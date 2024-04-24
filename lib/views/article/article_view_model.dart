import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:newpoint/domain/data_providers/blacklist_data_provider.dart';
import 'package:newpoint/domain/models/article/article.dart';
import 'package:newpoint/domain/models/article_comment/article_comment.dart';
import 'package:newpoint/domain/models/exceptions/api_client_exception.dart';
import 'package:newpoint/domain/models/comment/comment.dart';
import 'package:newpoint/domain/models/post/post.dart';
import 'package:newpoint/domain/models/user/user.dart';
import 'package:newpoint/domain/services/article_comment_service.dart';
import 'package:newpoint/domain/services/article_service.dart';
import 'package:newpoint/domain/services/auth_service.dart';
import 'package:newpoint/domain/services/bookmark_service.dart';
import 'package:newpoint/domain/services/comment_service.dart';
import 'package:newpoint/domain/services/image_service.dart';
import 'package:newpoint/domain/services/post_service.dart';
import 'package:newpoint/domain/services/user_service.dart';

class ArticleViewModel extends ChangeNotifier {
  ArticleViewModel(this.articleId);

  final _userService = UserService();
  final _articleService = ArticleService();
  final _articleCommentService = ArticleCommentService();
  final _bookmarkService = BookmarkService();
  final _blacklistDataProvider = BlacklistDataProvider();
  final _imageService = ImageService();

  late int articleId;
  User? user;
  Article? article;
  List<ArticleComment> comments = [];
  String error = "";
  final commentFieldText = TextEditingController();
  String comment = "";

  bool proceedingLikePost = false;
  bool proceedingLikeComment = false;
  bool proceedingBookmark = false;
  bool loadingComments = false;

  int lastCommentId = -1;

  late List<int> profileImageData;

  void onCommentTextChanged(String value) {
    comment = value;
  }

  Future<void> getUser() async {
    try {
      user = await _userService.getUser();
      profileImageData = await _imageService.getImageById(user!.profileImageId);
      notifyListeners();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        error = "Something is wrong with the connection to the server";
      }
    } catch (e) {
      error = "Something went wrong, please try again";
    }
  }

  Future<void> getArticle() async {
    try {
      proceedingLikePost = true;
      proceedingBookmark = true;
      article = await _articleService.getArticleById(articleId);
      proceedingLikePost = false;
      proceedingBookmark = false;
      notifyListeners();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        error = "Something is wrong with the connection to the server";
      }
    } catch (e) {
      error = "Something went wrong, please try again";
    }
  }

  Future<void> deletePost() async {
    try {
      await _articleService.deleteArticle(articleId);
      notifyListeners();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        error = "Something is wrong with the connection to the server";
      }
    } catch (e) {
      error = "Something went wrong, please try again";
    }
  }

  Future<void> getComments() async {
    try {
      comments = await _articleCommentService.getCommentsByArticleId(articleId);
      for (var i = 0; i < comments.length; ++i) {
        final comment = comments[i];
        if (comment.id < lastCommentId || lastCommentId == -1) {
          lastCommentId = comment.id;
        }
      }
      notifyListeners();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        error = "Something is wrong with the connection to the server";
      }
    } catch (e) {
      error = "Something went wrong, please try again";
    }
  }

  Future<void> loadComments() async {
    try {
      if (loadingComments) {
        return;
      }
      loadingComments = true;
      final commentsUpdated = await _articleCommentService
          .getCommentsByArticleId(articleId, lastCommentId: lastCommentId - 1);
      for (var i = 0; i < commentsUpdated.length; ++i) {
        final comment = commentsUpdated[i];
        if (comment.id < lastCommentId || lastCommentId == -1) {
          lastCommentId = comment.id;
        }
      }
      comments.addAll(commentsUpdated);
      loadingComments = false;
      notifyListeners();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        error = "Something is wrong with the connection to the server";
      }
    } catch (e) {
      error = "Something went wrong, please try again";
    }
  }

  Future<void> reloadComments() async {
    try {
      proceedingLikeComment = true;
      for (var i = 0; i < comments.length; i++) {
        comments[i] =
            await _articleCommentService.getCommentById(comments[i].id);
      }
      proceedingLikeComment = false;
      notifyListeners();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        error = "Something is wrong with the connection to the server";
      }
    } catch (e) {
      error = "Something went wrong, please try again";
    }
  }

  Future<void> share() async {
    try {
      _articleService.shareArticle(articleId);
      article!.shares++;
      notifyListeners();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        error = "Something is wrong with the connection to the server";
      }
    } catch (e) {
      error = "Something went wrong, please try again";
    }
  }

  Future<void> like() async {
    try {
      if (proceedingLikePost) {
        return;
      }
      proceedingLikePost = true;
      article!.liked = !article!.liked;
      if (!article!.liked) {
        await _articleService.unLikeArticle(articleId);
        article!.likes--;
      } else {
        await _articleService.likeArticle(articleId);
        article!.likes++;
      }
      notifyListeners();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        error = "Something is wrong with the connection to the server";
      }
    } catch (e) {
      error = "Something went wrong, please try again";
    }
    proceedingLikePost = false;
  }

  Future<void> sendComment() async {
    try {
      await _articleCommentService.addComment(articleId, comment);
      comment = "";
      commentFieldText.clear();
      article!.comments++;
      notifyListeners();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        error = "Something is wrong with the connection to the server";
      }
    } catch (e) {
      error = "Something went wrong, please try again";
    }
  }

  Future<void> deleteComment(int commentId) async {
    try {
      await _articleCommentService.deleteComment(commentId);
      comments.removeWhere((element) => element.id == commentId);
      --article!.comments;
      notifyListeners();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        error = "Something is wrong with the connection to the server";
      }
    } catch (e) {
      error = "Something went wrong, please try again";
    }
  }

  Future<void> likeComment(int index) async {
    try {
      if (proceedingLikeComment) {
        return;
      }
      proceedingLikeComment = true;
      final comment = comments[index];
      comment.liked = !comment.liked;
      if (!comment.liked) {
        await _articleCommentService.unLikeArticleComment(comment.id);
        comment.likes--;
      } else {
        await _articleCommentService.likeComment(comment.id);
        comment.likes++;
      }
      notifyListeners();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        error = "Something is wrong with the connection to the server";
      }
    } catch (e) {
      error = "Something went wrong, please try again";
    }
    proceedingLikeComment = false;
  }

  Future<void> bookmark() async {
    try {
      if (proceedingBookmark) {
        return;
      }
      proceedingBookmark = true;
      if (article!.bookmarked) {
        await _bookmarkService.deleteArticleBookmarkByArticleId(articleId);
      } else {
        await _bookmarkService.addArticleBookmark(user!.id, articleId);
      }
      article!.bookmarked = !article!.bookmarked;
      proceedingBookmark = false;
      notifyListeners();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        error = "Something is wrong with the connection to the server";
      }
    } catch (e) {
      error = "Something went wrong, please try again";
    }
  }

  Future<void> addToBlacklist() async {
    try {
      await _blacklistDataProvider.create(userId: article!.authorId);
      notifyListeners();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        error = "Something is wrong with the connection to the server";
      }
    } catch (e) {
      error = "Something went wrong, please try again";
    }
  }
}
