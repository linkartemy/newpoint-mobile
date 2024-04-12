import 'package:flutter/material.dart';
import 'package:newpoint/domain/data_providers/blacklist_data_provider.dart';
import 'package:newpoint/domain/data_providers/database/post_view_table.dart';
import 'package:newpoint/domain/models/article/article.dart';
import 'package:newpoint/domain/models/feed_element/feed_element.dart';
import 'package:newpoint/domain/models/exceptions/api_client_exception.dart';
import 'package:newpoint/domain/models/post/post.dart';
import 'package:newpoint/domain/models/post_view_entry/post_view_entry.dart';
import 'package:newpoint/domain/models/user/user.dart';
import 'package:newpoint/domain/services/article_service.dart';
import 'package:newpoint/domain/services/feed_service.dart';
import 'package:newpoint/domain/services/post_service.dart';
import 'package:newpoint/domain/services/user_service.dart';

class MainViewModel extends ChangeNotifier {
  final _feedService = FeedService();
  final _userService = UserService();
  final _postService = PostService();
  final _articleService = ArticleService();
  final postViewEntryTable = PostViewEntryTable();
  final _blacklistDataProvider = BlacklistDataProvider();
  var _feed = <FeedEntry>[];
  var subscribedPosts = <FeedEntry>[];
  var viewedPosts = <int>[];

  User? _user;
  var isLoading = false;
  var isLoadingDatabase = true;
  String postsLoadingError = "";
  bool _processingLikePost = false;

  final feedScrollController = ScrollController();
  final subscribedFeedScrollController = ScrollController();

  int lastArticleId = -1;
  int lastPostId = -1;

  bool loadingFeed = false;
  bool loadingSubscribedFeed = false;

  MainViewModel() {}

  Future<List<PostViewEntry>> getViewedPosts() async {
    try {
      final viewedPostsEntries =
          await postViewEntryTable.getAllByUserId(userId: user!.id);
      isLoadingDatabase = false;
      for (var i = 0; i < viewedPostsEntries.length; ++i) {
        viewedPosts.add(viewedPostsEntries[i].postId);
      }
      return viewedPostsEntries;
    } catch (e) {
      postsLoadingError = "Something went wrong, please try again";
    }
    return <PostViewEntry>[];
  }

  Future<FeedEntry> getFeedEntry(FeedEntry feedEntry) async {
    try {
      isLoading = true;
      if (feedEntry is Post) {
        isLoading = false;
        return await _postService.getPostById(feedEntry.id);
      } else {
        isLoading = false;
        return await _articleService.getArticleById(feedEntry.id);
      }
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        postsLoadingError =
            "Something is wrong with the connection to the server";
      } else {
        postsLoadingError = e.error;
      }
    } catch (e) {
      print(e);
      postsLoadingError = "Something went wrong, please try again";
    }
    isLoading = false;
    return feedEntry;
  }

  Future<void> getFeed() async {
    try {
      await getViewedPosts();
      postsLoadingError = "";
      isLoading = true;
      _feed = await _feedService.getFeedByUserId();
      for (var i = 0; i < _feed.length; ++i) {
        final feedElement = _feed[i];
        if (_feed[i] is Article &&
            (_feed[i].id < lastArticleId || lastArticleId == -1)) {
          lastArticleId = _feed[i].id;
        }
        if (_feed[i] is Post &&
            (_feed[i].id < lastPostId || lastPostId == -1)) {
          lastPostId = _feed[i].id;
        }
        if (await _blacklistDataProvider.userExists(feedElement.authorId)) {
          _feed.removeAt(i);
          --i;
        }
      }
      isLoading = false;
      getSubscribedPosts();
      notifyListeners();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        postsLoadingError =
            "Something is wrong with the connection to the server";
      } else {
        postsLoadingError = e.error;
      }
    } catch (e) {
      print(e);
      postsLoadingError = "Something went wrong, please try again";
    }
  }

  Future<void> loadFeed() async {
    try {
      if (loadingFeed) {
        return;
      }
      loadingFeed = true;
      final feed = await _feedService.getFeedByUserId(
          lastArticleId: lastArticleId - 1, lastPostId: lastPostId - 1);
      for (var i = 0; i < feed.length; ++i) {
        final feedElement = feed[i];
        if (feedElement is Article &&
            (feedElement.id < lastArticleId || lastArticleId == -1)) {
          lastArticleId = feedElement.id;
        }
        if (feedElement is Post &&
            (feedElement.id < lastPostId || lastPostId == -1)) {
          lastPostId = feedElement.id;
        }
        if (await _blacklistDataProvider.userExists(feedElement.authorId)) {
          feed.removeAt(i);
          --i;
        }
      }
      _feed.addAll(feed);
      loadingFeed = false;
      getSubscribedPosts();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        postsLoadingError =
            "Something is wrong with the connection to the server";
      } else {
        postsLoadingError = e.error;
      }
    } catch (e) {
      print(e);
      postsLoadingError = "Something went wrong, please try again";
    }
  }

  Future<void> loadSubscribedFeed() async {
    try {
      if (loadingSubscribedFeed) {
        return;
      }
      loadingSubscribedFeed = true;
      final feed = await _feedService.getFeedByUserId(
          lastArticleId: lastArticleId - 1, lastPostId: lastPostId - 1);
      for (var i = 0; i < feed.length; ++i) {
        final feedElement = feed[i];
        if (_feed[i] is Article &&
            (_feed[i].id < lastArticleId || lastArticleId == -1)) {
          lastArticleId = _feed[i].id;
        }
        if (_feed[i] is Post &&
            (_feed[i].id < lastPostId || lastPostId == -1)) {
          lastPostId = _feed[i].id;
        }
        if (await _blacklistDataProvider.userExists(feedElement.authorId)) {
          feed.removeAt(i);
          --i;
        }
      }
      _feed.addAll(feed);
      getSubscribedPosts();
      loadingSubscribedFeed = false;
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        postsLoadingError =
            "Something is wrong with the connection to the server";
      } else {
        postsLoadingError = e.error;
      }
    } catch (e) {
      print(e);
      postsLoadingError = "Something went wrong, please try again";
    }
  }

  Future<void> getSubscribedPosts() async {
    subscribedPosts.clear();
    for (var i = 0; i < _feed.length; ++i) {
      final feedEntry = _feed[i];
      if (await _userService.isFollowing(feedEntry.authorId)) {
        subscribedPosts.add(feedEntry);
      }
    }
    notifyListeners();
  }

  List<FeedEntry> get feed => _feed;

  Future<void> getUser() async {
    try {
      _user = await _userService.getUser();
      notifyListeners();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        postsLoadingError =
            "Something is wrong with the connection to the server";
      } else {
        postsLoadingError = e.error;
      }
      print(e.error);
    } catch (e) {
      print(e);
      postsLoadingError = "Something went wrong, please try again";
    }
  }

  User? get user => _user;

  Future<void> like(int index) async {
    try {
      if (_processingLikePost || isLoading) {
        return;
      }
      _processingLikePost = true;
      final feedEntry = _feed[index];
      if (feedEntry.liked) {
        if (feedEntry is Article) {
          await _articleService.unLikeArticle(feedEntry.id);
        } else {
          await _postService.unLikePost(feedEntry.id);
        }
        feedEntry.likes--;
      } else {
        if (feedEntry is Article) {
          await _articleService.likeArticle(feedEntry.id);
        } else {
          await _postService.likePost(feedEntry.id);
        }
        feedEntry.likes++;
      }
      feedEntry.liked = !feedEntry.liked;
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        postsLoadingError =
            "Something is wrong with the connection to the server";
      }
    } catch (e) {
      postsLoadingError = "Something went wrong, please try again";
    }
    _processingLikePost = false;
  }

  Future<void> likeSubscribedPost(int index) async {
    try {
      if (_processingLikePost || isLoading) {
        return;
      }
      _processingLikePost = true;
      final feedEntry = subscribedPosts[index];
      if (feedEntry.liked) {
        if (feedEntry is Article) {
          await _articleService.unLikeArticle(feedEntry.id);
        } else {
          await _postService.unLikePost(feedEntry.id);
        }
        feedEntry.likes--;
      } else {
        if (feedEntry is Article) {
          await _articleService.likeArticle(feedEntry.id);
        } else {
          await _postService.likePost(feedEntry.id);
        }
        await _postService.likePost(feedEntry.id);
        feedEntry.likes++;
      }
      feedEntry.liked = !feedEntry.liked;
      notifyListeners();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        postsLoadingError =
            "Something is wrong with the connection to the server";
      }
    } catch (e) {
      postsLoadingError = "Something went wrong, please try again";
    }
    _processingLikePost = false;
  }

  Future<bool> share(int postId) async {
    try {
      final feedEntry = _feed.firstWhere((element) => element.id == postId);
      var shared = false;
      if (feedEntry is Article) {
        shared = await _articleService.shareArticle(postId);
      } else {
        shared = await _postService.sharePost(postId);
      }
      return shared;
    } on ApiClientException catch (e) {
    } catch (e) {}
    return false;
  }

  Future<void> addView(int postId) async {
    try {
      await postViewEntryTable.create(userId: user!.id, postId: postId);
      await _postService.addPostView(postId);
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        postsLoadingError =
            "Something is wrong with the connection to the server";
      }
      print(e);
    } catch (e) {
      print(e);
      postsLoadingError = "Something went wrong, please try again";
    }
  }

  Future<void> bookmark(int index) async {
    if (isLoading) {
      return;
    }
  }

  Future<void> deletePost(int postId) async {
    try {
      final feedEntry = _feed.firstWhere((element) => element.id == postId);
      if (feedEntry is Article) {
        await _articleService.deleteArticle(postId);
      } else {
        await _postService.deletePost(postId);
      }
      _feed.removeWhere((element) => element.id == postId);
      notifyListeners();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {}
    } catch (e) {}
  }

  Future<void> addToBlacklist(int userId) async {
    try {
      await _blacklistDataProvider.create(userId: userId);
      _feed.removeWhere((element) => (element as Post).authorId == userId);
      notifyListeners();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {}
    } catch (e) {}
  }
}
