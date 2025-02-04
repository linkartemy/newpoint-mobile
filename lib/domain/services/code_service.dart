import 'package:newpoint/domain/grpc_clients/network_client.dart';
import 'package:newpoint/domain/models/exceptions/api_client_exception.dart';
import 'package:newpoint/protos.dart';

class CodeService {
  final _networkClient = NetworkClient();
  late final _codeServiceClient = GrpcCodeClient(_networkClient.clientChannel);

  Future<bool> addEmailVerificationCode(String email) async {
    var request = AddEmailVerificationCodeRequest();
    request.email = email;
    var response = await _codeServiceClient.addEmailVerificationCode(request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    var addEmailCodeResponse = AddEmailVerificationCodeResponse();
    return response.data
        .unpackInto<AddEmailVerificationCodeResponse>(addEmailCodeResponse)
        .sent;
  }

  Future<bool> verifyEmailVerificationCode(String email, String code) async {
    var request = VerifyEmailVerificationCodeRequest();
    request.email = email;
    request.code = code;
    var response = await _codeServiceClient.verifyEmailVerificationCode(request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    var verifyEmailCodeResponse = VerifyEmailVerificationCodeResponse();
    return response.data
        .unpackInto<VerifyEmailVerificationCodeResponse>(
            verifyEmailCodeResponse)
        .verified;
  }

  Future<bool> addPhoneVerificationCode(String phone) async {
    var request = AddPhoneVerificationCodeRequest();
    request.phone = phone;
    var response = await _codeServiceClient.addPhoneVerificationCode(request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    var addPhoneCodeResponse = AddPhoneVerificationCodeResponse();
    return response.data
        .unpackInto<AddPhoneVerificationCodeResponse>(addPhoneCodeResponse)
        .sent;
  }

  Future<bool> verifyPhoneVerificationCode(String phone, String code) async {
    var request = VerifyPhoneVerificationCodeRequest();
    request.phone = phone;
    request.code = code;
    var response = await _codeServiceClient.verifyPhoneVerificationCode(request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    var verifyPhoneCodeResponse = VerifyPhoneVerificationCodeResponse();
    return response.data
        .unpackInto<VerifyPhoneVerificationCodeResponse>(
            verifyPhoneCodeResponse)
        .verified;
  }

  Future<bool> addPasswordChangeVerificationCode(
      String? email, String? phone) async {
    var request = AddPasswordChangeVerificationCodeRequest();
    request.email = email as NullableString;
    request.phone = phone as NullableString;
    var response = await _codeServiceClient.addPasswordChangeVerificationCode(
        request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    var addPasswordChangeCodeResponse =
        AddPasswordChangeVerificationCodeResponse();
    return response.data
        .unpackInto<AddPasswordChangeVerificationCodeResponse>(
            addPasswordChangeCodeResponse)
        .sent;
  }

  Future<bool> verifyPasswordChangeVerificationCode(
      String? email, String? phone, String code) async {
    var request = VerifyPasswordChangeVerificationCodeRequest();
    request.email = email as NullableString;
    request.phone = phone as NullableString;
    request.code = code;
    var response =
        await _codeServiceClient.verifyPasswordChangeVerificationCode(request,
            options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    var verifyPasswordChangeCodeResponse =
        VerifyPasswordChangeVerificationCodeResponse();
    return response.data
        .unpackInto<VerifyPasswordChangeVerificationCodeResponse>(
            verifyPasswordChangeCodeResponse)
        .verified;
  }
}
