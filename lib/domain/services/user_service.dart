import 'package:grpc/grpc.dart';
import 'package:newpoint/domain/api_clients/account_api_client.dart';
import 'package:newpoint/domain/api_clients/auth_api_client.dart';
import 'package:newpoint/domain/api_clients/exceptions/api_client_exception.dart';
import 'package:newpoint/domain/data_providers/session_data_provider.dart';
import 'package:newpoint/domain/grpc_clients/network_client.dart';
import 'package:newpoint/domain/models/user/user.dart';
import 'package:newpoint/protos.dart';
import 'package:newpoint/src/generated/google/protobuf/timestamp.pb.dart';

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
    var ts = Timestamp();
    ts.nanos = birthDate.millisecondsSinceEpoch;
    request.birthDate = ts;
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
    var user = User.fromModel(response.data
        .unpackInto<GetUserByTokenResponse>(getUserByTokenResponse)
        .user);
    return user;
  }

  Future<void> logout() async {
    await _sessionDataProvider.deleteToken();
    await _sessionDataProvider.deleteAccountId();
  }
}
