import 'package:fixnum/src/int64.dart';
import 'package:newpoint/domain/models/exceptions/api_client_exception.dart';
import 'package:newpoint/domain/data_providers/session_data_provider.dart';
import 'package:newpoint/domain/grpc_clients/network_client.dart';
import 'package:newpoint/domain/models/user/user.dart';
import 'package:newpoint/protos.dart';

class UserService {
  final _networkClient = NetworkClient();
  late final _userServiceClient = GrpcUserClient(_networkClient.clientChannel);
  final _sessionDataProvider = SessionDataProvider();

  Future<bool> isAuth() async {
    if (!await _sessionDataProvider.hasToken()) {
      return false;
    }
    try {
      await getUser();
    } catch (e) {
      return false;
    }
    return true;
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

  Future<String> login(String login, String password) async {
    var request = LoginRequest();
    request.login = login;
    request.password = password;
    var response = _userServiceClient.login(request);
    if (await _networkClient.proceed(await response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    var headers = await response.headers;
    return headers["authorization"].toString();
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

  Future<User> updateProfile(String name, String surname, String description,
      String location, DateTime birthDate) async {
    var request = UpdateProfileRequest();
    request.name = name;
    request.surname = surname;
    request.description = description;
    request.location = location;
    request.birthDate = birthDate.toTimestamp();
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

  Future<bool> changeEmail(String email) async {
    var request = ChangeEmailRequest();
    request.email = email;
    var response = await _userServiceClient.changeEmail(request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    var changeEmailResponse = ChangeEmailResponse();
    return response.data
        .unpackInto<ChangeEmailResponse>(changeEmailResponse)
        .changed;
  }

  Future<bool> changePassword(
      String currentPassword, String newPassword) async {
    var request = ChangePasswordRequest();
    request.currentPassword = currentPassword;
    request.newPassword = newPassword;
    var response = await _userServiceClient.changePassword(request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    var changePasswordResponse = ChangePasswordResponse();
    return response.data
        .unpackInto<ChangePasswordResponse>(changePasswordResponse)
        .changed;
  }

  Future<bool> verifyPassword(String password) async {
    var request = VerifyPasswordRequest();
    request.password = password;
    var response = await _userServiceClient.verifyPassword(request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    var verifyPasswordResponse = VerifyPasswordResponse();
    return response.data
        .unpackInto<VerifyPasswordResponse>(verifyPasswordResponse)
        .verified;
  }

  Future<bool> follow(int userId) async {
    var request = FollowRequest();
    request.userId = Int64.parseInt(userId.toString());
    var response = await _userServiceClient.follow(request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    var followResponse = FollowResponse();
    return response.data.unpackInto<FollowResponse>(followResponse).following;
  }

  Future<bool> isFollowing(int userId) async {
    var request = IsFollowingRequest();
    request.userId = Int64.parseInt(userId.toString());
    var response = await _userServiceClient.isFollowing(request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    var isFollowingResponse = IsFollowingResponse();
    return response.data
        .unpackInto<IsFollowingResponse>(isFollowingResponse)
        .following;
  }

  Future<bool> getTwoFactorByToken(String token) async {
    var request = GetTwoFactorByTokenRequest();
    request.token = token;
    var response = await _userServiceClient.getTwoFactorByToken(request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    var getTwoFactorResponse = GetTwoFactorByTokenResponse();
    return response.data
        .unpackInto<GetTwoFactorByTokenResponse>(getTwoFactorResponse)
        .enabled;
  }

  Future<bool> updateTwoFactor(bool enabled) async {
    var request = UpdateTwoFactorRequest();
    request.enabled = enabled;
    var response = await _userServiceClient.updateTwoFactor(request,
        options: await _networkClient.getAuthorizedCallOptions());
    if (await _networkClient.proceed(response) == false) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    var updateTwoFactorResponse = UpdateTwoFactorResponse();
    return response.data
        .unpackInto<UpdateTwoFactorResponse>(updateTwoFactorResponse)
        .updated;
  }
}
