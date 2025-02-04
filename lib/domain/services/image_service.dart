import 'dart:typed_data';

import 'package:fixnum/src/int64.dart';
import 'package:newpoint/domain/data_providers/image_data_provider.dart';
import 'package:newpoint/domain/grpc_clients/network_client.dart';
import 'package:newpoint/domain/models/exceptions/api_client_exception.dart';
import 'package:newpoint/protos.dart';

class ImageService {
  final _networkClient = NetworkClient();
  late final _imageServiceClient =
      GrpcImageClient(_networkClient.clientChannel);
  final _imageDataProvider = ImageDataProvider();

  Future<List<int>> getImageById(int id) async {
    if (await _imageDataProvider.imageExists(id)) {
      return await _imageDataProvider.getImageById(id);
    }
    var request = GetImageByIdRequest();
    request.id = Int64.parseInt(id.toString());
    var response = await _imageServiceClient.getImageById(request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    var getImageByIdResponse = GetImageByIdResponse();
    var data = response.data
        .unpackInto<GetImageByIdResponse>(getImageByIdResponse)
        .image
        .data;
    await _imageDataProvider.create(
        imageId: id, data: Uint8List.fromList(data));
    return data;
  }
}
