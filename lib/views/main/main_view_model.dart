import 'package:flutter/material.dart';
import 'package:newpoint/domain/data_providers/database/post_view_table.dart';
import 'package:newpoint/domain/models/exceptions/api_client_exception.dart';
import 'package:newpoint/domain/models/post/post.dart';
import 'package:newpoint/domain/models/post_view_entry/post_view_entry.dart';
import 'package:newpoint/domain/models/user/user.dart';
import 'package:newpoint/domain/services/post_service.dart';
import 'package:newpoint/domain/services/user_service.dart';

class MainViewModel extends ChangeNotifier {
  final _postService = PostService();
  final _authService = UserService();
  final postViewEntryTable = PostViewEntryTable();
  var _posts = <Post>[];
  var viewedPosts = <int>[];

  User? _user;
  var isLoadingPosts = false;
  var isLoadingDatabase = true;
  String postsLoadingError = "";
  bool _processingLikePost = false;

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

  Future<void> getPosts() async {
    try {
      await getViewedPosts();
      postsLoadingError = "";
      isLoadingPosts = true;
      _posts = await _postService.getPosts();
      isLoadingPosts = false;
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

  List<Post> get posts => _posts;

  Future<void> getUser() async {
    try {
      _user = await _authService.getUser();
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
      var shared = _postService.sharePost(postId);
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

  Future<void> deletePost(int postId) async {
    try {
      await _postService.deletePost(postId);
      posts.removeWhere((element) => element.id == postId);
      notifyListeners();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {}
    } catch (e) {}
  }
}
