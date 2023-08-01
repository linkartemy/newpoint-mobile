import 'package:grpc/grpc.dart';
import 'package:newpoint/configuration/configuration.dart';
import 'package:newpoint/domain/api_clients/exceptions/api_client_exception.dart';
import 'package:newpoint/domain/data_providers/session_data_provider.dart';
import 'package:newpoint/protos.dart' as protos;

class NetworkClient {
  final _sessionDataProvider = SessionDataProvider();

  final clientChannel = ClientChannel(
    Configuration.grpcHost!,
    port: Configuration.grpcPort,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  );

  Future<CallOptions> getAuthorizedCallOptions() async {
    return CallOptions(metadata: {
      'Authorization': 'bearer ${await _sessionDataProvider.getToken()}'
    });
  }

  Future<bool> proceed(protos.Response response) async {
    switch (response.status) {
      case 200:
        return true;
      case 400:
        throw ApiClientException(
            ApiClientExceptionType.badRequest, response.error);
      case 500:
        throw ApiClientException(ApiClientExceptionType.other, response.error);
    }
    return false;
  }
}
