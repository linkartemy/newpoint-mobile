import 'package:fixnum/src/int64.dart';
import 'package:newpoint/domain/models/exceptions/api_client_exception.dart';
import 'package:newpoint/domain/data_providers/session_data_provider.dart';
import 'package:newpoint/domain/grpc_clients/network_client.dart';
import 'package:newpoint/domain/models/article/article.dart';
import 'package:newpoint/protos.dart';
import 'package:newpoint/src/generated/google/protobuf/timestamp.pb.dart';

class ArticleService {
  final _networkClient = NetworkClient();
  late final _articleServiceClient =
      GrpcArticleClient(_networkClient.clientChannel);
  final _sessionDataProvider = SessionDataProvider();

  Future<int> addArticle(
      int authorId, String title, String content, List<int> images) async {
    final request = AddArticleRequest();
    request.title = title;
    request.authorId = Int64.parseInt(authorId.toString());
    request.content = content;
    var response = await _articleServiceClient.addArticle(request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    var addArticleResponse = AddArticleResponse();
    return response.data
        .unpackInto<AddArticleResponse>(addArticleResponse)
        .id
        .toInt();
  }

  Future<List<Article>> getArticles() async {
    var response = await _articleServiceClient.getArticles(GetArticlesRequest(),
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    var getArticlesResponse = GetArticlesResponse();
    final articleModels = response.data
        .unpackInto<GetArticlesResponse>(getArticlesResponse)
        .articles;
    List<Article> articles = [];
    for (final articleModel in articleModels) {
      final article = Article.fromModel(articleModel);
      articles.add(article);
    }
    return articles;
  }

  Future<List<Article>> getArticlesByUserId(int id,
      {lastArticleId = -1}) async {
    final request = GetArticlesByUserIdRequest();
    request.userId = Int64.parseInt(id.toString());
    request.lastArticleId = Int64.parseInt(lastArticleId.toString());
    var response = await _articleServiceClient.getArticlesByUserId(request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    var getArticlesByUserIdResponse = GetArticlesByUserIdResponse();
    final articleModels = response.data
        .unpackInto<GetArticlesByUserIdResponse>(getArticlesByUserIdResponse)
        .articles;
    List<Article> articles = [];
    for (final articleModel in articleModels) {
      final article = Article.fromModel(articleModel);
      articles.add(article);
    }
    return articles;
  }

  Future<List<Article>> getArticlesByUserIdAfterTimestamp(
      int id, Timestamp timestamp) async {
    final request = GetArticlesByUserIdAfterTimestampRequest();
    request.userId = Int64.parseInt(id.toString());
    request.timestamp = timestamp;
    var response =
        await _articleServiceClient.getArticlesByUserIdAfterTimestamp(request,
            options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    var getArticlesByUserIdAfterTimestampResponse =
        GetArticlesByUserIdAfterTimestampResponse();
    final articleModels = response.data
        .unpackInto<GetArticlesByUserIdAfterTimestampResponse>(
            getArticlesByUserIdAfterTimestampResponse)
        .articles;
    List<Article> articles = [];
    for (final articleModel in articleModels) {
      final article = Article.fromModel(articleModel);
      articles.add(article);
    }
    return articles;
  }

  Future<Article> getArticleById(int id) async {
    final request = GetArticleByIdRequest();
    request.id = Int64.parseInt(id.toString());
    final response = await _articleServiceClient.getArticleById(request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    var getArticleByIdResponse = GetArticleByIdResponse();
    var article = Article.fromModel(response.data
        .unpackInto<GetArticleByIdResponse>(getArticleByIdResponse)
        .article);
    return article;
  }

  Future<bool> likeArticle(int id) async {
    final request = LikeArticleRequest();
    request.articleId = Int64.parseInt(id.toString());
    final response = await _articleServiceClient.likeArticle(request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    final likeResponse = LikeArticleResponse();
    return response.data.unpackInto<LikeArticleResponse>(likeResponse).liked;
  }

  Future<bool> unLikeArticle(int id) async {
    final request = UnLikeArticleRequest();
    request.articleId = Int64.parseInt(id.toString());
    final response = await _articleServiceClient.unLikeArticle(request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    final unLikeResponse = UnLikeArticleResponse();
    return response.data
        .unpackInto<UnLikeArticleResponse>(unLikeResponse)
        .liked;
  }

  Future<bool> shareArticle(int id) async {
    final request = ShareArticleRequest();
    request.articleId = Int64.parseInt(id.toString());
    final response = await _articleServiceClient.shareArticle(request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    final shareResponse = ShareArticleResponse();
    return response.data.unpackInto<ShareArticleResponse>(shareResponse).shared;
  }

  Future<int> addArticleView(int id) async {
    final request = AddArticleViewRequest();
    request.articleId = Int64.parseInt(id.toString());
    final response = await _articleServiceClient.addArticleView(request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    final addArticleViewResponse = AddArticleViewResponse();
    return int.parse(response.data
        .unpackInto<AddArticleViewResponse>(addArticleViewResponse)
        .views
        .toString());
  }

  Future<bool> deleteArticle(int articleId) async {
    final request = DeleteArticleRequest();
    request.articleId = Int64.parseInt(articleId.toString());
    var response = await _articleServiceClient.deleteArticle(request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    final deleteArticleResponse = DeleteArticleResponse();
    return response.data
        .unpackInto<DeleteArticleResponse>(deleteArticleResponse)
        .deleted;
  }
}
