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
import 'user.pb.dart' as $9;

export 'user.pb.dart';

@$pb.GrpcServiceName('user.GrpcUser')
class GrpcUserClient extends $grpc.Client {
  static final _$login = $grpc.ClientMethod<$9.LoginRequest, $1.Response>(
      '/user.GrpcUser/Login',
      ($9.LoginRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$register = $grpc.ClientMethod<$9.RegisterRequest, $1.Response>(
      '/user.GrpcUser/Register',
      ($9.RegisterRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$getUserByToken =
      $grpc.ClientMethod<$9.GetUserByTokenRequest, $1.Response>(
          '/user.GrpcUser/GetUserByToken',
          ($9.GetUserByTokenRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$getProfileById =
      $grpc.ClientMethod<$9.GetProfileByIdRequest, $1.Response>(
          '/user.GrpcUser/GetProfileById',
          ($9.GetProfileByIdRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$validateUser =
      $grpc.ClientMethod<$9.ValidateUserRequest, $1.Response>(
          '/user.GrpcUser/ValidateUser',
          ($9.ValidateUserRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$updateProfile =
      $grpc.ClientMethod<$9.UpdateProfileRequest, $1.Response>(
          '/user.GrpcUser/UpdateProfile',
          ($9.UpdateProfileRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$updateProfileImage =
      $grpc.ClientMethod<$9.UpdateProfileImageRequest, $1.Response>(
          '/user.GrpcUser/UpdateProfileImage',
          ($9.UpdateProfileImageRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$follow = $grpc.ClientMethod<$9.FollowRequest, $1.Response>(
      '/user.GrpcUser/Follow',
      ($9.FollowRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$isFollowing =
      $grpc.ClientMethod<$9.IsFollowingRequest, $1.Response>(
          '/user.GrpcUser/IsFollowing',
          ($9.IsFollowingRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$changeEmail =
      $grpc.ClientMethod<$9.ChangeEmailRequest, $1.Response>(
          '/user.GrpcUser/ChangeEmail',
          ($9.ChangeEmailRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$changePassword =
      $grpc.ClientMethod<$9.ChangePasswordRequest, $1.Response>(
          '/user.GrpcUser/ChangePassword',
          ($9.ChangePasswordRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$verifyPassword =
      $grpc.ClientMethod<$9.VerifyPasswordRequest, $1.Response>(
          '/user.GrpcUser/VerifyPassword',
          ($9.VerifyPasswordRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$getTwoFactorByToken =
      $grpc.ClientMethod<$9.GetTwoFactorByTokenRequest, $1.Response>(
          '/user.GrpcUser/GetTwoFactorByToken',
          ($9.GetTwoFactorByTokenRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$updateTwoFactor =
      $grpc.ClientMethod<$9.UpdateTwoFactorRequest, $1.Response>(
          '/user.GrpcUser/UpdateTwoFactor',
          ($9.UpdateTwoFactorRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$getUserByLogin =
      $grpc.ClientMethod<$9.GetUserByLoginRequest, $1.Response>(
          '/user.GrpcUser/GetUserByLogin',
          ($9.GetUserByLoginRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Response.fromBuffer(value));

  GrpcUserClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.Response> login($9.LoginRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$login, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> register($9.RegisterRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$register, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> getUserByToken(
      $9.GetUserByTokenRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUserByToken, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> getProfileById(
      $9.GetProfileByIdRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getProfileById, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> validateUser($9.ValidateUserRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$validateUser, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> updateProfile(
      $9.UpdateProfileRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateProfile, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> updateProfileImage(
      $9.UpdateProfileImageRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateProfileImage, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> follow($9.FollowRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$follow, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> isFollowing($9.IsFollowingRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$isFollowing, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> changeEmail($9.ChangeEmailRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$changeEmail, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> changePassword(
      $9.ChangePasswordRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$changePassword, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> verifyPassword(
      $9.VerifyPasswordRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$verifyPassword, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> getTwoFactorByToken(
      $9.GetTwoFactorByTokenRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTwoFactorByToken, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> updateTwoFactor(
      $9.UpdateTwoFactorRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateTwoFactor, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> getUserByLogin(
      $9.GetUserByLoginRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUserByLogin, request, options: options);
  }
}

@$pb.GrpcServiceName('user.GrpcUser')
abstract class GrpcUserServiceBase extends $grpc.Service {
  $core.String get $name => 'user.GrpcUser';

  GrpcUserServiceBase() {
    $addMethod($grpc.ServiceMethod<$9.LoginRequest, $1.Response>(
        'Login',
        login_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $9.LoginRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.RegisterRequest, $1.Response>(
        'Register',
        register_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $9.RegisterRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.GetUserByTokenRequest, $1.Response>(
        'GetUserByToken',
        getUserByToken_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $9.GetUserByTokenRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.GetProfileByIdRequest, $1.Response>(
        'GetProfileById',
        getProfileById_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $9.GetProfileByIdRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.ValidateUserRequest, $1.Response>(
        'ValidateUser',
        validateUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $9.ValidateUserRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.UpdateProfileRequest, $1.Response>(
        'UpdateProfile',
        updateProfile_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $9.UpdateProfileRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.UpdateProfileImageRequest, $1.Response>(
        'UpdateProfileImage',
        updateProfileImage_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $9.UpdateProfileImageRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.FollowRequest, $1.Response>(
        'Follow',
        follow_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $9.FollowRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.IsFollowingRequest, $1.Response>(
        'IsFollowing',
        isFollowing_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $9.IsFollowingRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.ChangeEmailRequest, $1.Response>(
        'ChangeEmail',
        changeEmail_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $9.ChangeEmailRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.ChangePasswordRequest, $1.Response>(
        'ChangePassword',
        changePassword_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $9.ChangePasswordRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.VerifyPasswordRequest, $1.Response>(
        'VerifyPassword',
        verifyPassword_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $9.VerifyPasswordRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.GetTwoFactorByTokenRequest, $1.Response>(
        'GetTwoFactorByToken',
        getTwoFactorByToken_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $9.GetTwoFactorByTokenRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.UpdateTwoFactorRequest, $1.Response>(
        'UpdateTwoFactor',
        updateTwoFactor_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $9.UpdateTwoFactorRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.GetUserByLoginRequest, $1.Response>(
        'GetUserByLogin',
        getUserByLogin_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $9.GetUserByLoginRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
  }

  $async.Future<$1.Response> login_Pre(
      $grpc.ServiceCall call, $async.Future<$9.LoginRequest> request) async {
    return login(call, await request);
  }

  $async.Future<$1.Response> register_Pre(
      $grpc.ServiceCall call, $async.Future<$9.RegisterRequest> request) async {
    return register(call, await request);
  }

  $async.Future<$1.Response> getUserByToken_Pre($grpc.ServiceCall call,
      $async.Future<$9.GetUserByTokenRequest> request) async {
    return getUserByToken(call, await request);
  }

  $async.Future<$1.Response> getProfileById_Pre($grpc.ServiceCall call,
      $async.Future<$9.GetProfileByIdRequest> request) async {
    return getProfileById(call, await request);
  }

  $async.Future<$1.Response> validateUser_Pre($grpc.ServiceCall call,
      $async.Future<$9.ValidateUserRequest> request) async {
    return validateUser(call, await request);
  }

  $async.Future<$1.Response> updateProfile_Pre($grpc.ServiceCall call,
      $async.Future<$9.UpdateProfileRequest> request) async {
    return updateProfile(call, await request);
  }

  $async.Future<$1.Response> updateProfileImage_Pre($grpc.ServiceCall call,
      $async.Future<$9.UpdateProfileImageRequest> request) async {
    return updateProfileImage(call, await request);
  }

  $async.Future<$1.Response> follow_Pre(
      $grpc.ServiceCall call, $async.Future<$9.FollowRequest> request) async {
    return follow(call, await request);
  }

  $async.Future<$1.Response> isFollowing_Pre($grpc.ServiceCall call,
      $async.Future<$9.IsFollowingRequest> request) async {
    return isFollowing(call, await request);
  }

  $async.Future<$1.Response> changeEmail_Pre($grpc.ServiceCall call,
      $async.Future<$9.ChangeEmailRequest> request) async {
    return changeEmail(call, await request);
  }

  $async.Future<$1.Response> changePassword_Pre($grpc.ServiceCall call,
      $async.Future<$9.ChangePasswordRequest> request) async {
    return changePassword(call, await request);
  }

  $async.Future<$1.Response> verifyPassword_Pre($grpc.ServiceCall call,
      $async.Future<$9.VerifyPasswordRequest> request) async {
    return verifyPassword(call, await request);
  }

  $async.Future<$1.Response> getTwoFactorByToken_Pre($grpc.ServiceCall call,
      $async.Future<$9.GetTwoFactorByTokenRequest> request) async {
    return getTwoFactorByToken(call, await request);
  }

  $async.Future<$1.Response> updateTwoFactor_Pre($grpc.ServiceCall call,
      $async.Future<$9.UpdateTwoFactorRequest> request) async {
    return updateTwoFactor(call, await request);
  }

  $async.Future<$1.Response> getUserByLogin_Pre($grpc.ServiceCall call,
      $async.Future<$9.GetUserByLoginRequest> request) async {
    return getUserByLogin(call, await request);
  }

  $async.Future<$1.Response> login(
      $grpc.ServiceCall call, $9.LoginRequest request);
  $async.Future<$1.Response> register(
      $grpc.ServiceCall call, $9.RegisterRequest request);
  $async.Future<$1.Response> getUserByToken(
      $grpc.ServiceCall call, $9.GetUserByTokenRequest request);
  $async.Future<$1.Response> getProfileById(
      $grpc.ServiceCall call, $9.GetProfileByIdRequest request);
  $async.Future<$1.Response> validateUser(
      $grpc.ServiceCall call, $9.ValidateUserRequest request);
  $async.Future<$1.Response> updateProfile(
      $grpc.ServiceCall call, $9.UpdateProfileRequest request);
  $async.Future<$1.Response> updateProfileImage(
      $grpc.ServiceCall call, $9.UpdateProfileImageRequest request);
  $async.Future<$1.Response> follow(
      $grpc.ServiceCall call, $9.FollowRequest request);
  $async.Future<$1.Response> isFollowing(
      $grpc.ServiceCall call, $9.IsFollowingRequest request);
  $async.Future<$1.Response> changeEmail(
      $grpc.ServiceCall call, $9.ChangeEmailRequest request);
  $async.Future<$1.Response> changePassword(
      $grpc.ServiceCall call, $9.ChangePasswordRequest request);
  $async.Future<$1.Response> verifyPassword(
      $grpc.ServiceCall call, $9.VerifyPasswordRequest request);
  $async.Future<$1.Response> getTwoFactorByToken(
      $grpc.ServiceCall call, $9.GetTwoFactorByTokenRequest request);
  $async.Future<$1.Response> updateTwoFactor(
      $grpc.ServiceCall call, $9.UpdateTwoFactorRequest request);
  $async.Future<$1.Response> getUserByLogin(
      $grpc.ServiceCall call, $9.GetUserByLoginRequest request);
}
