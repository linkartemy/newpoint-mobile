//
//  Generated code. Do not modify.
//  source: code.proto
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

import 'code.pb.dart' as $0;
import 'response.pb.dart' as $1;

export 'code.pb.dart';

@$pb.GrpcServiceName('code.GrpcCode')
class GrpcCodeClient extends $grpc.Client {
  static final _$addEmailVerificationCode = $grpc.ClientMethod<$0.AddEmailVerificationCodeRequest, $1.Response>(
      '/code.GrpcCode/AddEmailVerificationCode',
      ($0.AddEmailVerificationCodeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$verifyEmailVerificationCode = $grpc.ClientMethod<$0.VerifyEmailVerificationCodeRequest, $1.Response>(
      '/code.GrpcCode/VerifyEmailVerificationCode',
      ($0.VerifyEmailVerificationCodeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$addPhoneVerificationCode = $grpc.ClientMethod<$0.AddPhoneVerificationCodeRequest, $1.Response>(
      '/code.GrpcCode/AddPhoneVerificationCode',
      ($0.AddPhoneVerificationCodeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$verifyPhoneVerificationCode = $grpc.ClientMethod<$0.VerifyPhoneVerificationCodeRequest, $1.Response>(
      '/code.GrpcCode/VerifyPhoneVerificationCode',
      ($0.VerifyPhoneVerificationCodeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$addPasswordChangeVerificationCode = $grpc.ClientMethod<$0.AddPasswordChangeVerificationCodeRequest, $1.Response>(
      '/code.GrpcCode/AddPasswordChangeVerificationCode',
      ($0.AddPasswordChangeVerificationCodeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$verifyPasswordChangeVerificationCode = $grpc.ClientMethod<$0.VerifyPasswordChangeVerificationCodeRequest, $1.Response>(
      '/code.GrpcCode/VerifyPasswordChangeVerificationCode',
      ($0.VerifyPasswordChangeVerificationCodeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));

  GrpcCodeClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$1.Response> addEmailVerificationCode($0.AddEmailVerificationCodeRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addEmailVerificationCode, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> verifyEmailVerificationCode($0.VerifyEmailVerificationCodeRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$verifyEmailVerificationCode, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> addPhoneVerificationCode($0.AddPhoneVerificationCodeRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addPhoneVerificationCode, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> verifyPhoneVerificationCode($0.VerifyPhoneVerificationCodeRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$verifyPhoneVerificationCode, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> addPasswordChangeVerificationCode($0.AddPasswordChangeVerificationCodeRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addPasswordChangeVerificationCode, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> verifyPasswordChangeVerificationCode($0.VerifyPasswordChangeVerificationCodeRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$verifyPasswordChangeVerificationCode, request, options: options);
  }
}

@$pb.GrpcServiceName('code.GrpcCode')
abstract class GrpcCodeServiceBase extends $grpc.Service {
  $core.String get $name => 'code.GrpcCode';

  GrpcCodeServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.AddEmailVerificationCodeRequest, $1.Response>(
        'AddEmailVerificationCode',
        addEmailVerificationCode_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AddEmailVerificationCodeRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.VerifyEmailVerificationCodeRequest, $1.Response>(
        'VerifyEmailVerificationCode',
        verifyEmailVerificationCode_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.VerifyEmailVerificationCodeRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AddPhoneVerificationCodeRequest, $1.Response>(
        'AddPhoneVerificationCode',
        addPhoneVerificationCode_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AddPhoneVerificationCodeRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.VerifyPhoneVerificationCodeRequest, $1.Response>(
        'VerifyPhoneVerificationCode',
        verifyPhoneVerificationCode_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.VerifyPhoneVerificationCodeRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AddPasswordChangeVerificationCodeRequest, $1.Response>(
        'AddPasswordChangeVerificationCode',
        addPasswordChangeVerificationCode_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AddPasswordChangeVerificationCodeRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.VerifyPasswordChangeVerificationCodeRequest, $1.Response>(
        'VerifyPasswordChangeVerificationCode',
        verifyPasswordChangeVerificationCode_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.VerifyPasswordChangeVerificationCodeRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
  }

  $async.Future<$1.Response> addEmailVerificationCode_Pre($grpc.ServiceCall call, $async.Future<$0.AddEmailVerificationCodeRequest> request) async {
    return addEmailVerificationCode(call, await request);
  }

  $async.Future<$1.Response> verifyEmailVerificationCode_Pre($grpc.ServiceCall call, $async.Future<$0.VerifyEmailVerificationCodeRequest> request) async {
    return verifyEmailVerificationCode(call, await request);
  }

  $async.Future<$1.Response> addPhoneVerificationCode_Pre($grpc.ServiceCall call, $async.Future<$0.AddPhoneVerificationCodeRequest> request) async {
    return addPhoneVerificationCode(call, await request);
  }

  $async.Future<$1.Response> verifyPhoneVerificationCode_Pre($grpc.ServiceCall call, $async.Future<$0.VerifyPhoneVerificationCodeRequest> request) async {
    return verifyPhoneVerificationCode(call, await request);
  }

  $async.Future<$1.Response> addPasswordChangeVerificationCode_Pre($grpc.ServiceCall call, $async.Future<$0.AddPasswordChangeVerificationCodeRequest> request) async {
    return addPasswordChangeVerificationCode(call, await request);
  }

  $async.Future<$1.Response> verifyPasswordChangeVerificationCode_Pre($grpc.ServiceCall call, $async.Future<$0.VerifyPasswordChangeVerificationCodeRequest> request) async {
    return verifyPasswordChangeVerificationCode(call, await request);
  }

  $async.Future<$1.Response> addEmailVerificationCode($grpc.ServiceCall call, $0.AddEmailVerificationCodeRequest request);
  $async.Future<$1.Response> verifyEmailVerificationCode($grpc.ServiceCall call, $0.VerifyEmailVerificationCodeRequest request);
  $async.Future<$1.Response> addPhoneVerificationCode($grpc.ServiceCall call, $0.AddPhoneVerificationCodeRequest request);
  $async.Future<$1.Response> verifyPhoneVerificationCode($grpc.ServiceCall call, $0.VerifyPhoneVerificationCodeRequest request);
  $async.Future<$1.Response> addPasswordChangeVerificationCode($grpc.ServiceCall call, $0.AddPasswordChangeVerificationCodeRequest request);
  $async.Future<$1.Response> verifyPasswordChangeVerificationCode($grpc.ServiceCall call, $0.VerifyPasswordChangeVerificationCodeRequest request);
}
