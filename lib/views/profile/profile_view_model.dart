import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newpoint/domain/data_providers/blacklist_data_provider.dart';
import 'package:newpoint/domain/models/exceptions/api_client_exception.dart';
import 'package:newpoint/domain/data_providers/database/post_view_table.dart';
import 'package:newpoint/domain/models/post/post.dart';
import 'package:newpoint/domain/models/post_view_entry/post_view_entry.dart';
import 'package:newpoint/domain/models/user/user.dart';
import 'package:newpoint/domain/services/image_service.dart';
import 'package:newpoint/domain/services/post_service.dart';
import 'package:newpoint/domain/services/user_service.dart';

class ProfileViewModel extends ChangeNotifier {
  ProfileViewModel(this.profileId);

  final _userService = UserService();
  final _postService = PostService();
  final postViewEntryTable = PostViewEntryTable();
  final _blacklistDataProvider = BlacklistDataProvider();

  late int profileId;
  User? user;
  User? profile;
  List<Post> posts = [];
  var viewedPosts = <int>[];
  var isLoadingDatabase = true;
  String error = "";
  bool following = false;
  bool _processingLikePost = false;

  ImagePicker picker = ImagePicker();
  XFile? image;

  bool proceedingFollowing = false;

  Future<void> onImageTap() async {
    try {
      image = await picker.pickImage(source: ImageSource.gallery);
      if (image == null) {
        throw Exception("Error occurred while getting photo");
      }
      final id = await _userService.updateProfileImage(
          (await image!.readAsBytes()).toList(), image!.name);
      user?.profileImageId = id;
      getProfile();
      notifyListeners();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        error = "Something is wrong with the connection to the server";
      }
    } catch (e) {
      error = "Something went wrong, please try again";
    }
  }

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
      error = "Something went wrong, please try again";
    }
    return <PostViewEntry>[];
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

  Future<void> getProfile() async {
    try {
      profile = await _userService.getProfileById(profileId);
      notifyListeners();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        error = "Something is wrong with the connection to the server";
      }
      error = e.error;
    } catch (e) {
      error = "Something went wrong, please try again";
    }
  }

  Future<void> getIsFollowing() async {
    try {
      following = await _userService.isFollowing(profileId);
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        error = "Something is wrong with the connection to the server";
      }
      error = e.error;
    } catch (e) {
      error = "Something went wrong, please try again";
    }
  }

  Future<void> getPosts() async {
    try {
      error = "";
      posts = await _postService.getPostsByUserId(profileId);
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

  Future<void> follow() async {
    try {
      if (proceedingFollowing) {
        return;
      }
      proceedingFollowing = true;
      following = !following;
      notifyListeners();
      final followingResult = await _userService.follow(profileId);
      if (followingResult != following) {
        following = followingResult;
      }
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        error = "Something is wrong with the connection to the server";
      }
      print(e);
    } catch (e) {
      print(e);
      error = "Something went wrong, please try again";
    }
    proceedingFollowing = false;
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
