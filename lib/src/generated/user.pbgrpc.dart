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
import 'user.pb.dart' as $8;

export 'user.pb.dart';

@$pb.GrpcServiceName('user.GrpcUser')
class GrpcUserClient extends $grpc.Client {
  static final _$login = $grpc.ClientMethod<$8.LoginRequest, $1.Response>(
      '/user.GrpcUser/Login',
      ($8.LoginRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$register = $grpc.ClientMethod<$8.RegisterRequest, $1.Response>(
      '/user.GrpcUser/Register',
      ($8.RegisterRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$getUserByToken = $grpc.ClientMethod<$8.GetUserByTokenRequest, $1.Response>(
      '/user.GrpcUser/GetUserByToken',
      ($8.GetUserByTokenRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$getProfileById = $grpc.ClientMethod<$8.GetProfileByIdRequest, $1.Response>(
      '/user.GrpcUser/GetProfileById',
      ($8.GetProfileByIdRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$validateUser = $grpc.ClientMethod<$8.ValidateUserRequest, $1.Response>(
      '/user.GrpcUser/ValidateUser',
      ($8.ValidateUserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$updateProfile = $grpc.ClientMethod<$8.UpdateProfileRequest, $1.Response>(
      '/user.GrpcUser/UpdateProfile',
      ($8.UpdateProfileRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$updateProfileImage = $grpc.ClientMethod<$8.UpdateProfileImageRequest, $1.Response>(
      '/user.GrpcUser/UpdateProfileImage',
      ($8.UpdateProfileImageRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$follow = $grpc.ClientMethod<$8.FollowRequest, $1.Response>(
      '/user.GrpcUser/Follow',
      ($8.FollowRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$isFollowing = $grpc.ClientMethod<$8.IsFollowingRequest, $1.Response>(
      '/user.GrpcUser/IsFollowing',
      ($8.IsFollowingRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$changeEmail = $grpc.ClientMethod<$8.ChangeEmailRequest, $1.Response>(
      '/user.GrpcUser/ChangeEmail',
      ($8.ChangeEmailRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$changePassword = $grpc.ClientMethod<$8.ChangePasswordRequest, $1.Response>(
      '/user.GrpcUser/ChangePassword',
      ($8.ChangePasswordRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$verifyPassword = $grpc.ClientMethod<$8.VerifyPasswordRequest, $1.Response>(
      '/user.GrpcUser/VerifyPassword',
      ($8.VerifyPasswordRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$getTwoFactorByToken = $grpc.ClientMethod<$8.GetTwoFactorByTokenRequest, $1.Response>(
      '/user.GrpcUser/GetTwoFactorByToken',
      ($8.GetTwoFactorByTokenRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$updateTwoFactor = $grpc.ClientMethod<$8.UpdateTwoFactorRequest, $1.Response>(
      '/user.GrpcUser/UpdateTwoFactor',
      ($8.UpdateTwoFactorRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$getUserByLogin = $grpc.ClientMethod<$8.GetUserByLoginRequest, $1.Response>(
      '/user.GrpcUser/GetUserByLogin',
      ($8.GetUserByLoginRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));

  GrpcUserClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$1.Response> login($8.LoginRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$login, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> register($8.RegisterRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$register, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> getUserByToken($8.GetUserByTokenRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUserByToken, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> getProfileById($8.GetProfileByIdRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getProfileById, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> validateUser($8.ValidateUserRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$validateUser, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> updateProfile($8.UpdateProfileRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateProfile, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> updateProfileImage($8.UpdateProfileImageRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateProfileImage, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> follow($8.FollowRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$follow, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> isFollowing($8.IsFollowingRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$isFollowing, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> changeEmail($8.ChangeEmailRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$changeEmail, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> changePassword($8.ChangePasswordRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$changePassword, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> verifyPassword($8.VerifyPasswordRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$verifyPassword, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> getTwoFactorByToken($8.GetTwoFactorByTokenRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTwoFactorByToken, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> updateTwoFactor($8.UpdateTwoFactorRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateTwoFactor, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> getUserByLogin($8.GetUserByLoginRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUserByLogin, request, options: options);
  }
}

@$pb.GrpcServiceName('user.GrpcUser')
abstract class GrpcUserServiceBase extends $grpc.Service {
  $core.String get $name => 'user.GrpcUser';

  GrpcUserServiceBase() {
    $addMethod($grpc.ServiceMethod<$8.LoginRequest, $1.Response>(
        'Login',
        login_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.LoginRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.RegisterRequest, $1.Response>(
        'Register',
        register_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.RegisterRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.GetUserByTokenRequest, $1.Response>(
        'GetUserByToken',
        getUserByToken_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.GetUserByTokenRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.GetProfileByIdRequest, $1.Response>(
        'GetProfileById',
        getProfileById_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.GetProfileByIdRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.ValidateUserRequest, $1.Response>(
        'ValidateUser',
        validateUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.ValidateUserRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.UpdateProfileRequest, $1.Response>(
        'UpdateProfile',
        updateProfile_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.UpdateProfileRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.UpdateProfileImageRequest, $1.Response>(
        'UpdateProfileImage',
        updateProfileImage_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.UpdateProfileImageRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.FollowRequest, $1.Response>(
        'Follow',
        follow_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.FollowRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.IsFollowingRequest, $1.Response>(
        'IsFollowing',
        isFollowing_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.IsFollowingRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.ChangeEmailRequest, $1.Response>(
        'ChangeEmail',
        changeEmail_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.ChangeEmailRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.ChangePasswordRequest, $1.Response>(
        'ChangePassword',
        changePassword_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.ChangePasswordRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.VerifyPasswordRequest, $1.Response>(
        'VerifyPassword',
        verifyPassword_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.VerifyPasswordRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.GetTwoFactorByTokenRequest, $1.Response>(
        'GetTwoFactorByToken',
        getTwoFactorByToken_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.GetTwoFactorByTokenRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.UpdateTwoFactorRequest, $1.Response>(
        'UpdateTwoFactor',
        updateTwoFactor_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.UpdateTwoFactorRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.GetUserByLoginRequest, $1.Response>(
        'GetUserByLogin',
        getUserByLogin_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.GetUserByLoginRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
  }

  $async.Future<$1.Response> login_Pre($grpc.ServiceCall call, $async.Future<$8.LoginRequest> request) async {
    return login(call, await request);
  }

  $async.Future<$1.Response> register_Pre($grpc.ServiceCall call, $async.Future<$8.RegisterRequest> request) async {
    return register(call, await request);
  }

  $async.Future<$1.Response> getUserByToken_Pre($grpc.ServiceCall call, $async.Future<$8.GetUserByTokenRequest> request) async {
    return getUserByToken(call, await request);
  }

  $async.Future<$1.Response> getProfileById_Pre($grpc.ServiceCall call, $async.Future<$8.GetProfileByIdRequest> request) async {
    return getProfileById(call, await request);
  }

  $async.Future<$1.Response> validateUser_Pre($grpc.ServiceCall call, $async.Future<$8.ValidateUserRequest> request) async {
    return validateUser(call, await request);
  }

  $async.Future<$1.Response> updateProfile_Pre($grpc.ServiceCall call, $async.Future<$8.UpdateProfileRequest> request) async {
    return updateProfile(call, await request);
  }

  $async.Future<$1.Response> updateProfileImage_Pre($grpc.ServiceCall call, $async.Future<$8.UpdateProfileImageRequest> request) async {
    return updateProfileImage(call, await request);
  }

  $async.Future<$1.Response> follow_Pre($grpc.ServiceCall call, $async.Future<$8.FollowRequest> request) async {
    return follow(call, await request);
  }

  $async.Future<$1.Response> isFollowing_Pre($grpc.ServiceCall call, $async.Future<$8.IsFollowingRequest> request) async {
    return isFollowing(call, await request);
  }

  $async.Future<$1.Response> changeEmail_Pre($grpc.ServiceCall call, $async.Future<$8.ChangeEmailRequest> request) async {
    return changeEmail(call, await request);
  }

  $async.Future<$1.Response> changePassword_Pre($grpc.ServiceCall call, $async.Future<$8.ChangePasswordRequest> request) async {
    return changePassword(call, await request);
  }

  $async.Future<$1.Response> verifyPassword_Pre($grpc.ServiceCall call, $async.Future<$8.VerifyPasswordRequest> request) async {
    return verifyPassword(call, await request);
  }

  $async.Future<$1.Response> getTwoFactorByToken_Pre($grpc.ServiceCall call, $async.Future<$8.GetTwoFactorByTokenRequest> request) async {
    return getTwoFactorByToken(call, await request);
  }

  $async.Future<$1.Response> updateTwoFactor_Pre($grpc.ServiceCall call, $async.Future<$8.UpdateTwoFactorRequest> request) async {
    return updateTwoFactor(call, await request);
  }

  $async.Future<$1.Response> getUserByLogin_Pre($grpc.ServiceCall call, $async.Future<$8.GetUserByLoginRequest> request) async {
    return getUserByLogin(call, await request);
  }

  $async.Future<$1.Response> login($grpc.ServiceCall call, $8.LoginRequest request);
  $async.Future<$1.Response> register($grpc.ServiceCall call, $8.RegisterRequest request);
  $async.Future<$1.Response> getUserByToken($grpc.ServiceCall call, $8.GetUserByTokenRequest request);
  $async.Future<$1.Response> getProfileById($grpc.ServiceCall call, $8.GetProfileByIdRequest request);
  $async.Future<$1.Response> validateUser($grpc.ServiceCall call, $8.ValidateUserRequest request);
  $async.Future<$1.Response> updateProfile($grpc.ServiceCall call, $8.UpdateProfileRequest request);
  $async.Future<$1.Response> updateProfileImage($grpc.ServiceCall call, $8.UpdateProfileImageRequest request);
  $async.Future<$1.Response> follow($grpc.ServiceCall call, $8.FollowRequest request);
  $async.Future<$1.Response> isFollowing($grpc.ServiceCall call, $8.IsFollowingRequest request);
  $async.Future<$1.Response> changeEmail($grpc.ServiceCall call, $8.ChangeEmailRequest request);
  $async.Future<$1.Response> changePassword($grpc.ServiceCall call, $8.ChangePasswordRequest request);
  $async.Future<$1.Response> verifyPassword($grpc.ServiceCall call, $8.VerifyPasswordRequest request);
  $async.Future<$1.Response> getTwoFactorByToken($grpc.ServiceCall call, $8.GetTwoFactorByTokenRequest request);
  $async.Future<$1.Response> updateTwoFactor($grpc.ServiceCall call, $8.UpdateTwoFactorRequest request);
  $async.Future<$1.Response> getUserByLogin($grpc.ServiceCall call, $8.GetUserByLoginRequest request);
}
