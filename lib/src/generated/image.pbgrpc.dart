//
//  Generated code. Do not modify.
//  source: image.proto
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

import 'image.pb.dart' as $3;
import 'response.pb.dart' as $1;

export 'image.pb.dart';

@$pb.GrpcServiceName('image.GrpcImage')
class GrpcImageClient extends $grpc.Client {
  static final _$getImageById = $grpc.ClientMethod<$3.GetImageByIdRequest, $1.Response>(
      '/image.GrpcImage/GetImageById',
      ($3.GetImageByIdRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));

  GrpcImageClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$1.Response> getImageById($3.GetImageByIdRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getImageById, request, options: options);
  }
}

@$pb.GrpcServiceName('image.GrpcImage')
abstract class GrpcImageServiceBase extends $grpc.Service {
  $core.String get $name => 'image.GrpcImage';

  GrpcImageServiceBase() {
    $addMethod($grpc.ServiceMethod<$3.GetImageByIdRequest, $1.Response>(
        'GetImageById',
        getImageById_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.GetImageByIdRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
  }

  $async.Future<$1.Response> getImageById_Pre($grpc.ServiceCall call, $async.Future<$3.GetImageByIdRequest> request) async {
    return getImageById(call, await request);
  }

  $async.Future<$1.Response> getImageById($grpc.ServiceCall call, $3.GetImageByIdRequest request);
}
