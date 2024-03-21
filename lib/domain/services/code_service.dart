import 'package:fixnum/src/int64.dart';
import 'package:grpc/grpc.dart';
import 'package:newpoint/domain/api_clients/account_api_client.dart';
import 'package:newpoint/domain/api_clients/auth_api_client.dart';
import 'package:newpoint/domain/models/exceptions/api_client_exception.dart';
import 'package:newpoint/domain/data_providers/session_data_provider.dart';
import 'package:newpoint/domain/grpc_clients/network_client.dart';
import 'package:newpoint/domain/models/user/user.dart';
import 'package:newpoint/protos.dart';
import 'package:newpoint/src/generated/google/protobuf/timestamp.pb.dart';

class CodeService {
  final _networkClient = NetworkClient();
  late final _codeServiceClient = GrpcCodeClient(_networkClient.clientChannel);

  Future<bool> addEmailCode(String email) async {
    var request = AddEmailCodeRequest();
    request.email = email;
    var response = await _codeServiceClient.addEmailCode(request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    var addEmailCodeResponse = AddEmailCodeResponse();
    return response.data
        .unpackInto<AddEmailCodeResponse>(addEmailCodeResponse)
        .sent;
  }

  Future<bool> verifyEmailCode(String email, String code) async {
    var request = VerifyEmailCodeRequest();
    request.email = email;
    request.code = code;
    var response = await _codeServiceClient.verifyEmailCode(request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    var verifyEmailCodeResponse = VerifyEmailCodeResponse();
    return response.data
        .unpackInto<VerifyEmailCodeResponse>(verifyEmailCodeResponse)
        .verified;
  }
}
