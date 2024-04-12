import 'package:fixnum/src/int64.dart';
import 'package:newpoint/domain/models/article_comment/article_comment.dart';
import 'package:newpoint/domain/models/exceptions/api_client_exception.dart';
import 'package:newpoint/domain/data_providers/session_data_provider.dart';
import 'package:newpoint/domain/grpc_clients/network_client.dart';
import 'package:newpoint/domain/models/comment/comment.dart';
import 'package:newpoint/domain/models/post/post.dart';
import 'package:newpoint/protos.dart';
import 'package:newpoint/src/generated/user.pbgrpc.dart';

class ArticleCommentService {
  final _networkClient = NetworkClient();
  late final _articleCommentServiceClient =
      GrpcArticleCommentClient(_networkClient.clientChannel);
  final _sessionDataProvider = SessionDataProvider();

  Future<List<ArticleComment>> getCommentsByArticleId(int id) async {
    final request = GetCommentsByArticleIdRequest();
    request.articleId = Int64.parseInt(id.toString());
    var response = await _articleCommentServiceClient.getCommentsByArticleId(request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    var getCommentsByArticleIdResponse = GetCommentsByArticleIdResponse();
    final commentModels = response.data
        .unpackInto<GetCommentsByArticleIdResponse>(getCommentsByArticleIdResponse)
        .comments;
    List<ArticleComment> comments = [];
    for (final commentModel in commentModels) {
      final comment = ArticleComment.fromModel(commentModel);
      comments.add(comment);
    }
    return comments;
  }

  Future<bool> addComment(int id, String content) async {
    final request = AddArticleCommentRequest();
    request.articleId = Int64.parseInt(id.toString());
    request.content = content;
    final response = await _articleCommentServiceClient.addComment(request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    var addCommentResponse = AddArticleCommentResponse();
    return response.data
        .unpackInto<AddArticleCommentResponse>(addCommentResponse)
        .added;
  }

  Future<bool> deleteComment(int id) async {
    final request = DeleteArticleCommentRequest();
    request.commentId = Int64.parseInt(id.toString());
    final response = await _articleCommentServiceClient.deleteComment(request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    var deleteCommentResponse = DeleteArticleCommentResponse();
    return response.data
        .unpackInto<DeleteArticleCommentResponse>(deleteCommentResponse)
        .deleted;
  }

  Future<bool> likeComment(int id) async {
    final request = LikeArticleCommentRequest();
    request.commentId = Int64.parseInt(id.toString());
    final response = await _articleCommentServiceClient.likeComment(request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    final likeCommentResponse = LikeArticleCommentResponse();
    return response.data
        .unpackInto<LikeArticleCommentResponse>(likeCommentResponse)
        .liked;
  }

  Future<bool> unLikeArticleComment(int id) async {
    final request = UnLikeArticleCommentRequest();
    request.commentId = Int64.parseInt(id.toString());
    final response = await _articleCommentServiceClient.unLikeComment(request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    final unLikeCommentResponse = UnLikeArticleCommentResponse();
    return response.data
        .unpackInto<UnLikeArticleCommentResponse>(unLikeCommentResponse)
        .liked;
  }
}
