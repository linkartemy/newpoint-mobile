import 'package:fixnum/src/int64.dart';
import 'package:newpoint/domain/api_clients/exceptions/api_client_exception.dart';
import 'package:newpoint/domain/grpc_clients/network_client.dart';
import 'package:newpoint/protos.dart';

class ImageService {
  final _networkClient = NetworkClient();
  late final _imageServiceClient =
      GrpcImageClient(_networkClient.clientChannel);

  Future<List<int>> getImageById(int id) async {
    var request = GetImageByIdRequest();
    request.id = Int64.parseInt(id.toString());
    var response = await _imageServiceClient.getImageById(request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    var getImageByIdResponse = GetImageByIdResponse();
    return response.data
        .unpackInto<GetImageByIdResponse>(getImageByIdResponse)
        .image
        .data;
  }
}
