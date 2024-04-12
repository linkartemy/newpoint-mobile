import 'package:fixnum/src/int64.dart';
import 'package:newpoint/domain/models/article/article.dart';
import 'package:newpoint/domain/models/exceptions/api_client_exception.dart';
import 'package:newpoint/domain/data_providers/session_data_provider.dart';
import 'package:newpoint/domain/grpc_clients/network_client.dart';
import 'package:newpoint/domain/models/feed_element/feed_element.dart';
import 'package:newpoint/domain/models/post/post.dart';
import 'package:newpoint/protos.dart';
import 'package:newpoint/src/generated/user.pbgrpc.dart';

class FeedService {
  final _networkClient = NetworkClient();
  late final _feedServiceClient = GrpcFeedClient(_networkClient.clientChannel);
  final _sessionDataProvider = SessionDataProvider();

  Future<List<FeedEntry>> getFeedByUserId({int lastArticleId = -1, int lastPostId = -1}) async {
    final request = GetFeedByUserIdRequest();
    request.lastArticleId = Int64.parseInt(lastArticleId.toString());
    request.lastPostId = Int64.parseInt(lastPostId.toString());
    var response = await _feedServiceClient.getFeedByUserId(request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    final getFeedByUserIdResponse = GetFeedByUserIdResponse();
    final List<FeedEntry> feed = [];
    final feedElements =
        response.data.unpackInto<GetFeedByUserIdResponse>(getFeedByUserIdResponse).feed;
    for (final feedElement in feedElements) {
      final postNullable = feedElement.post.parseNullable();
      final articleNullable = feedElement.article.parseNullable();
      if (postNullable == null) {
        feed.add(Article.fromModel(articleNullable!));
      } else {
        feed.add(Post.fromModel(postNullable));
      }
    }
    return feed;
  }
}
