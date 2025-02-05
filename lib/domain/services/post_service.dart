import 'package:fixnum/src/int64.dart';
import 'package:newpoint/domain/data_providers/session_data_provider.dart';
import 'package:newpoint/domain/grpc_clients/network_client.dart';
import 'package:newpoint/domain/models/exceptions/api_client_exception.dart';
import 'package:newpoint/domain/models/post/post.dart';
import 'package:newpoint/protos.dart';
import 'package:newpoint/src/generated/google/protobuf/timestamp.pb.dart';

class PostService {
  final _networkClient = NetworkClient();
  late final _postServiceClient = GrpcPostClient(_networkClient.clientChannel);
  final _sessionDataProvider = SessionDataProvider();

  Future<int> addPost(int authorId, String content, List<int> images) async {
    final request = AddPostRequest();
    request.authorId = Int64.parseInt(authorId.toString());
    request.content = content;
    var response = await _postServiceClient.addPost(request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    var addPostResponse = AddPostResponse();
    return response.data
        .unpackInto<AddPostResponse>(addPostResponse)
        .id
        .toInt();
  }

  Future<List<Post>> getPosts() async {
    var response = await _postServiceClient.getPosts(GetPostsRequest(),
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    var getPostsResponse = GetPostsResponse();
    final postModels =
        response.data.unpackInto<GetPostsResponse>(getPostsResponse).posts;
    List<Post> posts = [];
    for (final postModel in postModels) {
      final post = Post.fromModel(postModel);
      print(post);
      posts.add(post);
    }
    return posts;
  }

  Future<List<Post>> getPostsByUserId(int id, {lastPostId = -1}) async {
    final request = GetPostsByUserIdRequest();
    request.userId = Int64.parseInt(id.toString());
    request.lastPostId = Int64.parseInt(lastPostId.toString());
    var response = await _postServiceClient.getPostsByUserId(request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    var getPostsByUserIdResponse = GetPostsByUserIdResponse();
    final postModels = response.data
        .unpackInto<GetPostsByUserIdResponse>(getPostsByUserIdResponse)
        .posts;
    List<Post> posts = [];
    for (final postModel in postModels) {
      final post = Post.fromModel(postModel);
      posts.add(post);
    }
    return posts;
  }

  Future<List<Post>> getPostsByUserIdAfterTimestamp(
      int id, Timestamp timestamp) async {
    final request = GetPostsByUserIdAfterTimestampRequest();
    request.userId = Int64.parseInt(id.toString());
    request.timestamp = timestamp;
    var response = await _postServiceClient.getPostsByUserIdAfterTimestamp(
        request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    var getPostsByUserIdAfterTimestampResponse =
        GetPostsByUserIdAfterTimestampResponse();
    final postModels = response.data
        .unpackInto<GetPostsByUserIdAfterTimestampResponse>(
            getPostsByUserIdAfterTimestampResponse)
        .posts;
    List<Post> posts = [];
    for (final postModel in postModels) {
      final post = Post.fromModel(postModel);
      posts.add(post);
    }
    return posts;
  }

  Future<Post> getPostById(int id) async {
    final request = GetPostByIdRequest();
    request.id = Int64.parseInt(id.toString());
    final response = await _postServiceClient.getPostById(request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    var getPostByIdResponse = GetPostByIdResponse();
    var post = Post.fromModel(response.data
        .unpackInto<GetPostByIdResponse>(getPostByIdResponse)
        .post);
    return post;
  }

  Future<bool> likePost(int id) async {
    final request = LikePostRequest();
    request.postId = Int64.parseInt(id.toString());
    final response = await _postServiceClient.likePost(request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    final likeResponse = LikePostResponse();
    return response.data.unpackInto<LikePostResponse>(likeResponse).liked;
  }

  Future<bool> unLikePost(int id) async {
    final request = UnLikePostRequest();
    request.postId = Int64.parseInt(id.toString());
    final response = await _postServiceClient.unLikePost(request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    final unLikeResponse = UnLikePostResponse();
    return response.data.unpackInto<UnLikePostResponse>(unLikeResponse).liked;
  }

  Future<bool> sharePost(int id) async {
    final request = SharePostRequest();
    request.postId = Int64.parseInt(id.toString());
    final response = await _postServiceClient.sharePost(request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    final shareResponse = SharePostResponse();
    return response.data.unpackInto<SharePostResponse>(shareResponse).shared;
  }

  Future<int> addPostView(int id) async {
    final request = AddPostViewRequest();
    request.postId = Int64.parseInt(id.toString());
    final response = await _postServiceClient.addPostView(request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    final addPostViewResponse = AddPostViewResponse();
    return int.parse(response.data
        .unpackInto<AddPostViewResponse>(addPostViewResponse)
        .views
        .toString());
  }

  Future<bool> deletePost(int postId) async {
    final request = DeletePostRequest();
    request.postId = Int64.parseInt(postId.toString());
    var response = await _postServiceClient.deletePost(request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    final deletePostResponse = DeletePostResponse();
    return response.data
        .unpackInto<DeletePostResponse>(deletePostResponse)
        .deleted;
  }
}
