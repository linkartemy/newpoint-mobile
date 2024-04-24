import 'package:fixnum/src/int64.dart';
import 'package:newpoint/domain/models/exceptions/api_client_exception.dart';
import 'package:newpoint/domain/data_providers/session_data_provider.dart';
import 'package:newpoint/domain/grpc_clients/network_client.dart';
import 'package:newpoint/domain/models/comment/comment.dart';
import 'package:newpoint/domain/models/post/post.dart';
import 'package:newpoint/protos.dart';
import 'package:newpoint/src/generated/user.pbgrpc.dart';

class CommentService {
  final _networkClient = NetworkClient();
  late final _commentServiceClient =
      GrpcCommentClient(_networkClient.clientChannel);
  final _sessionDataProvider = SessionDataProvider();

  Future<List<Comment>> getCommentsByPostId(int id,
      {lastCommentId = -1}) async {
    final request = GetCommentsByPostIdRequest();
    request.postId = Int64.parseInt(id.toString());
    request.lastCommentId = Int64.parseInt(lastCommentId.toString());
    var response = await _commentServiceClient.getCommentsByPostId(request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    var getCommentsByPostIdResponse = GetCommentsByPostIdResponse();
    final commentModels = response.data
        .unpackInto<GetCommentsByPostIdResponse>(getCommentsByPostIdResponse)
        .comments;
    List<Comment> comments = [];
    for (final commentModel in commentModels) {
      final comment = Comment.fromModel(commentModel);
      comments.add(comment);
    }
    return comments;
  }

  Future<Comment> getCommentById(int id) async {
    final request = GetCommentByIdRequest();
    request.id = Int64.parseInt(id.toString());
    var response = await _commentServiceClient.getCommentById(request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    var getCommentByIdResponse = GetCommentByIdResponse();
    return Comment.fromModel(response.data
        .unpackInto<GetCommentByIdResponse>(getCommentByIdResponse)
        .comment);
  }

  Future<bool> addComment(int id, String content) async {
    final request = AddCommentRequest();
    request.postId = Int64.parseInt(id.toString());
    request.content = content;
    final response = await _commentServiceClient.addComment(request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    var addCommentResponse = AddCommentResponse();
    return response.data
        .unpackInto<AddCommentResponse>(addCommentResponse)
        .added;
  }

  Future<bool> deleteComment(int id) async {
    final request = DeleteCommentRequest();
    request.commentId = Int64.parseInt(id.toString());
    final response = await _commentServiceClient.deleteComment(request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    var deleteCommentResponse = DeleteCommentResponse();
    return response.data
        .unpackInto<DeleteCommentResponse>(deleteCommentResponse)
        .deleted;
  }

  Future<bool> likeComment(int id) async {
    final request = LikeCommentRequest();
    request.commentId = Int64.parseInt(id.toString());
    final response = await _commentServiceClient.likeComment(request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    final likeCommentResponse = LikeCommentResponse();
    return response.data
        .unpackInto<LikeCommentResponse>(likeCommentResponse)
        .liked;
  }

  Future<bool> unLikeComment(int id) async {
    final request = UnLikeCommentRequest();
    request.commentId = Int64.parseInt(id.toString());
    final response = await _commentServiceClient.unLikeComment(request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    final unLikeCommentResponse = UnLikeCommentResponse();
    return response.data
        .unpackInto<UnLikeCommentResponse>(unLikeCommentResponse)
        .liked;
  }
}
