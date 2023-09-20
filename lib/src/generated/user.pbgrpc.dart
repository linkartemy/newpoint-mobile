//
//  Generated code. Do not modify.
//  source: user.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'response.pb.dart' as $1;
import 'user.pb.dart' as $5;

export 'user.pb.dart';

@$pb.GrpcServiceName('user.GrpcUser')
class GrpcUserClient extends $grpc.Client {
  static final _$login = $grpc.ClientMethod<$5.LoginRequest, $1.Response>(
      '/user.GrpcUser/Login',
      ($5.LoginRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$register = $grpc.ClientMethod<$5.RegisterRequest, $1.Response>(
      '/user.GrpcUser/Register',
      ($5.RegisterRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$getUserByToken = $grpc.ClientMethod<$5.GetUserByTokenRequest, $1.Response>(
      '/user.GrpcUser/GetUserByToken',
      ($5.GetUserByTokenRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$getProfileById = $grpc.ClientMethod<$5.GetProfileByIdRequest, $1.Response>(
      '/user.GrpcUser/GetProfileById',
      ($5.GetProfileByIdRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$validateUser = $grpc.ClientMethod<$5.ValidateUserRequest, $1.Response>(
      '/user.GrpcUser/ValidateUser',
      ($5.ValidateUserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));

  GrpcUserClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$1.Response> login($5.LoginRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$login, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> register($5.RegisterRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$register, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> getUserByToken($5.GetUserByTokenRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUserByToken, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> getProfileById($5.GetProfileByIdRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getProfileById, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> validateUser($5.ValidateUserRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$validateUser, request, options: options);
  }
}

@$pb.GrpcServiceName('user.GrpcUser')
abstract class GrpcUserServiceBase extends $grpc.Service {
  $core.String get $name => 'user.GrpcUser';

  GrpcUserServiceBase() {
    $addMethod($grpc.ServiceMethod<$5.LoginRequest, $1.Response>(
        'Login',
        login_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.LoginRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.RegisterRequest, $1.Response>(
        'Register',
        register_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.RegisterRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.GetUserByTokenRequest, $1.Response>(
        'GetUserByToken',
        getUserByToken_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.GetUserByTokenRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.GetProfileByIdRequest, $1.Response>(
        'GetProfileById',
        getProfileById_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.GetProfileByIdRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.ValidateUserRequest, $1.Response>(
        'ValidateUser',
        validateUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.ValidateUserRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
  }

  $async.Future<$1.Response> login_Pre($grpc.ServiceCall call, $async.Future<$5.LoginRequest> request) async {
    return login(call, await request);
  }

  $async.Future<$1.Response> register_Pre($grpc.ServiceCall call, $async.Future<$5.RegisterRequest> request) async {
    return register(call, await request);
  }

  $async.Future<$1.Response> getUserByToken_Pre($grpc.ServiceCall call, $async.Future<$5.GetUserByTokenRequest> request) async {
    return getUserByToken(call, await request);
  }

  $async.Future<$1.Response> getProfileById_Pre($grpc.ServiceCall call, $async.Future<$5.GetProfileByIdRequest> request) async {
    return getProfileById(call, await request);
  }

  $async.Future<$1.Response> validateUser_Pre($grpc.ServiceCall call, $async.Future<$5.ValidateUserRequest> request) async {
    return validateUser(call, await request);
  }

  $async.Future<$1.Response> login($grpc.ServiceCall call, $5.LoginRequest request);
  $async.Future<$1.Response> register($grpc.ServiceCall call, $5.RegisterRequest request);
  $async.Future<$1.Response> getUserByToken($grpc.ServiceCall call, $5.GetUserByTokenRequest request);
  $async.Future<$1.Response> getProfileById($grpc.ServiceCall call, $5.GetProfileByIdRequest request);
  $async.Future<$1.Response> validateUser($grpc.ServiceCall call, $5.ValidateUserRequest request);
}
