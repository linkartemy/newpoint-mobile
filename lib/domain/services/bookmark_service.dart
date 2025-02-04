import 'package:fixnum/src/int64.dart';
import 'package:newpoint/domain/grpc_clients/network_client.dart';
import 'package:newpoint/domain/models/article/article.dart';
import 'package:newpoint/domain/models/exceptions/api_client_exception.dart';
import 'package:newpoint/domain/models/post/post.dart';
import 'package:newpoint/protos.dart';

class BookmarkService {
  final _networkClient = NetworkClient();
  late final _bookmarkServiceClient =
      GrpcBookmarkClient(_networkClient.clientChannel);

  Future<int> addPostBookmark(int userId, int postId) async {
    final request = AddPostBookmarkRequest();
    request.userId = Int64.parseInt(userId.toString());
    request.postId = Int64.parseInt(postId.toString());
    var response = await _bookmarkServiceClient.addPostBookmark(request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    var addPostBookmarkResponse = AddPostBookmarkResponse();
    return response.data
        .unpackInto<AddPostBookmarkResponse>(addPostBookmarkResponse)
        .id
        .toInt();
  }

  Future<int> addArticleBookmark(int userId, int articleId) async {
    final request = AddArticleBookmarkRequest();
    request.userId = Int64.parseInt(userId.toString());
    request.articleId = Int64.parseInt(articleId.toString());
    var response = await _bookmarkServiceClient.addArticleBookmark(request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    var addArticleBookmarkResponse = AddArticleBookmarkResponse();
    return response.data
        .unpackInto<AddArticleBookmarkResponse>(addArticleBookmarkResponse)
        .id
        .toInt();
  }

  Future<List<Post>> getBookmarkedPosts(int userId, {lastPostId = -1}) async {
    final request = GetBookmarkedPostsRequest();
    request.userId = Int64.parseInt(userId.toString());
    request.lastPostId = Int64.parseInt(lastPostId.toString());
    var response = await _bookmarkServiceClient.getBookmarkedPosts(request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    var getBookmarkedPostsResponse = GetBookmarkedPostsResponse();
    final postModels = response.data
        .unpackInto<GetBookmarkedPostsResponse>(getBookmarkedPostsResponse)
        .posts;
    List<Post> posts = [];
    for (final postModel in postModels) {
      final post = Post.fromModel(postModel);
      posts.add(post);
    }
    return posts;
  }

  Future<List<Article>> getBookmarkedArticles(int userId,
      {lastArticleId = -1}) async {
    final request = GetBookmarkedArticlesRequest();
    request.userId = Int64.parseInt(userId.toString());
    request.lastArticleId = Int64.parseInt(lastArticleId.toString());
    var response = await _bookmarkServiceClient.getBookmarkedArticles(request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    var getBookmarkedArticlesResponse = GetBookmarkedArticlesResponse();
    final articleModels = response.data
        .unpackInto<GetBookmarkedArticlesResponse>(
            getBookmarkedArticlesResponse)
        .articles;
    List<Article> articles = [];
    for (final articleModel in articleModels) {
      final article = Article.fromModel(articleModel);
      articles.add(article);
    }
    return articles;
  }

  Future<bool> deletePostBookmarkByPostId(int postId) async {
    final request = DeletePostBookmarkByPostIdRequest();
    request.postId = Int64.parseInt(postId.toString());
    var response = await _bookmarkServiceClient.deletePostBookmarkByPostId(
        request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    final deletePostBookmarkByPostIdResponse =
        DeletePostBookmarkByPostIdResponse();
    return response.data
        .unpackInto<DeletePostBookmarkByPostIdResponse>(
            deletePostBookmarkByPostIdResponse)
        .deleted;
  }

  Future<bool> deleteArticleBookmarkByArticleId(int articleId) async {
    final request = DeleteArticleBookmarkByArticleIdRequest();
    request.articleId = Int64.parseInt(articleId.toString());
    var response =
        await _bookmarkServiceClient.deleteArticleBookmarkByArticleId(request,
            options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    final deleteArticleBookmarkByArticleIdResponse =
        DeleteArticleBookmarkByArticleIdResponse();
    return response.data
        .unpackInto<DeleteArticleBookmarkByArticleIdResponse>(
            deleteArticleBookmarkByArticleIdResponse)
        .deleted;
  }

  Future<bool> deleteAllBookmarksByUserId(int userId) async {
    final request = DeleteAllBookmarksByUserIdRequest();
    request.userId = Int64.parseInt(userId.toString());
    var response = await _bookmarkServiceClient.deleteAllBookmarksByUserId(
        request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    final deleteAllBookmarksByUserIdResponse =
        DeleteAllBookmarksByUserIdResponse();
    return response.data
        .unpackInto<DeleteAllBookmarksByUserIdResponse>(
            deleteAllBookmarksByUserIdResponse)
        .deleted;
  }
}
