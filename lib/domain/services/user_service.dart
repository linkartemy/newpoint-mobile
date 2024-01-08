import 'package:fixnum/src/int64.dart';
import 'package:newpoint/domain/api_clients/exceptions/api_client_exception.dart';
import 'package:newpoint/domain/data_providers/session_data_provider.dart';
import 'package:newpoint/domain/grpc_clients/network_client.dart';
import 'package:newpoint/domain/models/user/user.dart';
import 'package:newpoint/protos.dart';

class UserService {
  final _networkClient = NetworkClient();
  late final _userServiceClient = GrpcUserClient(_networkClient.clientChannel);
  final _sessionDataProvider = SessionDataProvider();

  Future<bool> isAuth() async {
    return await _sessionDataProvider.hasToken();
  }

  Future<void> register(String login, String password, String name,
      String surname, String email, String phone, DateTime birthDate) async {
    var request = RegisterRequest();
    request.login = login;
    request.password = password;
    request.name = name;
    request.surname = surname;
    request.email = email;
    request.phone = phone;
    request.birthDate = birthDate.toTimestamp();
    var response = _userServiceClient.register(request);
    var headers = await response.headers;
    await _sessionDataProvider.setToken(headers["authorization"].toString());
  }

  Future<void> login(String login, String password) async {
    var request = LoginRequest();
    request.login = login;
    request.password = password;
    var response = _userServiceClient.login(request);
    var headers = await response.headers;
    await _sessionDataProvider.setToken(headers["authorization"].toString());
  }

  Future<User> getUser() async {
    var response = await _userServiceClient.getUserByToken(
        GetUserByTokenRequest(),
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    var getUserByTokenResponse = GetUserByTokenResponse();
    return User.fromModel(response.data
        .unpackInto<GetUserByTokenResponse>(getUserByTokenResponse)
        .user);
  }

  Future<void> logout() async {
    await _sessionDataProvider.deleteToken();
    await _sessionDataProvider.deleteAccountId();
  }

  Future<User> getProfileById(int id) async {
    var request = GetProfileByIdRequest();
    request.id = Int64.parseInt(id.toString());
    var response = await _userServiceClient.getProfileById(request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    var getProfileByIdResponse = GetProfileByIdResponse();
    return User.fromModel(response.data
        .unpackInto<GetProfileByIdResponse>(getProfileByIdResponse)
        .user);
  }

  Future<bool> validateUser(String login, String password, String name,
      String surname, String email, String phone) async {
    var request = ValidateUserRequest();
    request.login = login;
    request.password = password;
    request.name = name;
    request.surname = surname;
    request.email = email;
    request.phone = phone;
    var response = await _userServiceClient.validateUser(request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    var validateUserResponse = ValidateUserResponse();
    return response.data
        .unpackInto<ValidateUserResponse>(validateUserResponse)
        .valid;
  }

  Future<User> updateProfile(
      String name, String surname, String description, String location) async {
    var request = UpdateProfileRequest();
    request.name = name;
    request.surname = surname;
    request.description = description;
    request.location = location;
    var response = await _userServiceClient.updateProfile(request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    var updateProfileResponse = UpdateProfileResponse();
    return User.fromModel(response.data
        .unpackInto<UpdateProfileResponse>(updateProfileResponse)
        .user);
  }

  Future<int> updateProfileImage(List<int> data, String name) async {
    var request = UpdateProfileImageRequest();
    request.data = data;
    request.name = name;
    var response = await _userServiceClient.updateProfileImage(request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    var updateProfileImageResponse = UpdateProfileImageResponse();
    return response.data
        .unpackInto<UpdateProfileImageResponse>(updateProfileImageResponse)
        .id
        .toInt();
  }
}
