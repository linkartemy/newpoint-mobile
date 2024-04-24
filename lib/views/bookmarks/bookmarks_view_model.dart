import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newpoint/domain/data_providers/blacklist_data_provider.dart';
import 'package:newpoint/domain/models/article/article.dart';
import 'package:newpoint/domain/models/exceptions/api_client_exception.dart';
import 'package:newpoint/domain/data_providers/database/post_view_table.dart';
import 'package:newpoint/domain/models/post/post.dart';
import 'package:newpoint/domain/models/post_view_entry/post_view_entry.dart';
import 'package:newpoint/domain/models/user/user.dart';
import 'package:newpoint/domain/services/article_service.dart';
import 'package:newpoint/domain/services/bookmark_service.dart';
import 'package:newpoint/domain/services/image_service.dart';
import 'package:newpoint/domain/services/post_service.dart';
import 'package:newpoint/domain/services/user_service.dart';

class BookmarksViewModel extends ChangeNotifier {
  BookmarksViewModel();

  final _userService = UserService();
  final _bookmarkService = BookmarkService();
  final _postService = PostService();
  final _articleService = ArticleService();
  final postViewEntryTable = PostViewEntryTable();
  final _blacklistDataProvider = BlacklistDataProvider();

  User? user;
  List<Post> posts = [];
  List<Article> articles = [];
  var viewedPosts = <int>[];
  var isLoadingDatabase = true;
  String error = "";
  bool _processingLikePost = false;

  bool loadingPostsFeed = false;
  bool loadingArticlesFeed = false;
  int lastArticleId = -1;
  int lastPostId = -1;

  ImagePicker picker = ImagePicker();
  XFile? image;

  bool proceedingFollowing = false;
  bool _processingBookmark = false;

  void init() {
    lastArticleId = -1;
    lastPostId = -1;
  }

  Future<void> deletePost(int postId) async {
    try {
      await _postService.deletePost(postId);
      posts.removeWhere((element) => element.id == postId);
      notifyListeners();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        error = "Something is wrong with the connection to the server";
      }
    } catch (e) {
      error = "Something went wrong, please try again";
    }
  }

  Future<void> deleteAllBookmarks() async {
    try {
      if (posts.isEmpty && articles.isEmpty) {
        return;
      }
      await _bookmarkService.deleteAllBookmarksByUserId(user!.id);
      posts.clear();
      articles.clear();
      notifyListeners();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        error = "Something is wrong with the connection to the server";
      }
    } catch (e) {
      error = "Something went wrong, please try again";
    }
  }

  Future<void> getUser() async {
    try {
      user = await _userService.getUser();
      notifyListeners();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        error = "Something is wrong with the connection to the server";
      }
    } catch (e) {
      error = "Something went wrong, please try again";
    }
  }

  Future<Post> getPostById(Post post) async {
    try {
      return await _postService.getPostById(post.id);
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        error = "Something is wrong with the connection to the server";
      } else {
        error = e.error;
      }
    } catch (e) {
      error = "Something went wrong, please try again";
    }
    return post;
  }

  Future<Article> getArticleById(Article article) async {
    try {
      return await _articleService.getArticleById(article.id);
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        error = "Something is wrong with the connection to the server";
      } else {
        error = e.error;
      }
    } catch (e) {
      error = "Something went wrong, please try again";
    }
    return article;
  }

  Future<void> getPosts() async {
    try {
      error = "";
      posts = await _bookmarkService.getBookmarkedPosts(user!.id);
      lastPostId = posts.isNotEmpty ? posts[0].id : -1;
      for (var post in posts) {
        if (post.id < lastPostId || lastPostId == -1) {
          lastPostId = post.id;
        }
      }
      notifyListeners();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        error = "Something is wrong with the connection to the server";
      } else {
        error = e.error;
      }
    } catch (e) {
      error = "Something went wrong, please try again";
    }
  }

  Future<void> getArticles() async {
    try {
      error = "";
      articles = await _bookmarkService.getBookmarkedArticles(user!.id);
      lastArticleId = posts.isNotEmpty ? posts[0].id : -1;
      for (var article in articles) {
        if (article.id < lastArticleId || lastArticleId == -1) {
          lastArticleId = article.id;
        }
      }
      notifyListeners();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        error = "Something is wrong with the connection to the server";
      } else {
        error = e.error;
      }
    } catch (e) {
      error = "Something went wrong, please try again";
    }
  }

  Future<void> loadPostsFeed() async {
    try {
      if (loadingPostsFeed) {
        return;
      }
      loadingPostsFeed = true;
      final postsFeed = await _bookmarkService.getBookmarkedPosts(user!.id,
          lastPostId: lastPostId - 1);
      for (var i = 0; i < postsFeed.length; ++i) {
        final post = postsFeed[i];
        if (post.id < lastPostId || lastPostId == -1) {
          lastPostId = post.id;
        }
      }
      posts.addAll(postsFeed);
      loadingPostsFeed = false;
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        error = "Something is wrong with the connection to the server";
      } else {
        error = e.error;
      }
    } catch (e) {
      error = "Something went wrong, please try again";
    }
  }

  Future<void> loadArticlesFeed() async {
    try {
      if (loadingArticlesFeed) {
        return;
      }
      loadingArticlesFeed = true;
      final articlesFeed = await _bookmarkService
          .getBookmarkedArticles(user!.id, lastArticleId: lastArticleId - 1);
      for (var i = 0; i < articlesFeed.length; ++i) {
        final article = articlesFeed[i];
        if (article.id < lastArticleId || lastArticleId == -1) {
          lastArticleId = article.id;
        }
      }
      articles.addAll(articlesFeed);
      loadingArticlesFeed = false;
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        error = "Something is wrong with the connection to the server";
      } else {
        error = e.error;
      }
    } catch (e) {
      error = "Something went wrong, please try again";
    }
  }

  Future<void> share(int index) async {
    try {
      _postService.sharePost(posts[index].id);
      posts[index].shares++;
      notifyListeners();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        error = "Something is wrong with the connection to the server";
      }
    } catch (e) {
      error = "Something went wrong, please try again";
    }
  }

  Future<void> like(int index) async {
    try {
      if (_processingLikePost) {
        return;
      }
      _processingLikePost = true;
      final post = posts[index];
      if (post.liked) {
        await _postService.unLikePost(post.id);
        post.likes--;
      } else {
        await _postService.likePost(post.id);
        post.likes++;
      }
      post.liked = !post.liked;
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        error = "Something is wrong with the connection to the server";
      }
    } catch (e) {
      error = "Something went wrong, please try again";
    }
    _processingLikePost = false;
  }

  Future<void> bookmarkPost(int index) async {
    try {
      if (_processingBookmark) {
        return;
      }
      _processingBookmark = true;
      final post = posts[index];
      if (post.bookmarked) {
        await _bookmarkService.deletePostBookmarkByPostId(post.id);
        posts.removeWhere((element) => element.id == post.id);
      } else {
        await _bookmarkService.addPostBookmark(user!.id, post.id);
      }
      post.bookmarked = !post.bookmarked;
      _processingBookmark = false;
      notifyListeners();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        error = "Something is wrong with the connection to the server";
      }
    } catch (e) {
      error = "Something went wrong, please try again";
    }
  }

  Future<void> bookmarkArticle(int index) async {
    try {
      if (_processingBookmark) {
        return;
      }
      _processingBookmark = true;
      final article = articles[index];
      if (article.bookmarked) {
        await _bookmarkService.deleteArticleBookmarkByArticleId(article.id);
        articles.removeWhere((element) => element.id == article.id);
      } else {
        await _bookmarkService.addArticleBookmark(user!.id, article.id);
      }
      article.bookmarked = !article.bookmarked;
      _processingBookmark = false;
      notifyListeners();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        error = "Something is wrong with the connection to the server";
      }
    } catch (e) {
      error = "Something went wrong, please try again";
    }
  }

  Future<void> addView(int postId) async {
    try {
      await postViewEntryTable.create(userId: user!.id, postId: postId);
      await _postService.addPostView(postId);
      notifyListeners();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        error = "Something is wrong with the connection to the server";
      }
      print(e);
    } catch (e) {
      print(e);
      error = "Something went wrong, please try again";
    }
  }

  Future<void> addToBlacklist(int userId) async {
    try {
      await _blacklistDataProvider.create(userId: userId);
      posts.removeWhere((element) => element.authorId == userId);
      notifyListeners();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {}
    } catch (e) {}
  }
}
