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

@$pb.GrpcServiceName('user.GrpcCode')
class GrpcCodeClient extends $grpc.Client {
  static final _$addEmailCode = $grpc.ClientMethod<$0.AddEmailCodeRequest, $1.Response>(
      '/user.GrpcCode/AddEmailCode',
      ($0.AddEmailCodeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$verifyEmailCode = $grpc.ClientMethod<$0.VerifyEmailCodeRequest, $1.Response>(
      '/user.GrpcCode/VerifyEmailCode',
      ($0.VerifyEmailCodeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));

  GrpcCodeClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$1.Response> addEmailCode($0.AddEmailCodeRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addEmailCode, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> verifyEmailCode($0.VerifyEmailCodeRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$verifyEmailCode, request, options: options);
  }
}

@$pb.GrpcServiceName('user.GrpcCode')
abstract class GrpcCodeServiceBase extends $grpc.Service {
  $core.String get $name => 'user.GrpcCode';

  GrpcCodeServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.AddEmailCodeRequest, $1.Response>(
        'AddEmailCode',
        addEmailCode_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AddEmailCodeRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.VerifyEmailCodeRequest, $1.Response>(
        'VerifyEmailCode',
        verifyEmailCode_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.VerifyEmailCodeRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
  }

  $async.Future<$1.Response> addEmailCode_Pre($grpc.ServiceCall call, $async.Future<$0.AddEmailCodeRequest> request) async {
    return addEmailCode(call, await request);
  }

  $async.Future<$1.Response> verifyEmailCode_Pre($grpc.ServiceCall call, $async.Future<$0.VerifyEmailCodeRequest> request) async {
    return verifyEmailCode(call, await request);
  }

  $async.Future<$1.Response> addEmailCode($grpc.ServiceCall call, $0.AddEmailCodeRequest request);
  $async.Future<$1.Response> verifyEmailCode($grpc.ServiceCall call, $0.VerifyEmailCodeRequest request);
}
