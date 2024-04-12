//
//  Generated code. Do not modify.
//  source: comment.proto
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

import 'comment.pb.dart' as $5;
import 'response.pb.dart' as $1;

export 'comment.pb.dart';

@$pb.GrpcServiceName('comment.GrpcComment')
class GrpcCommentClient extends $grpc.Client {
  static final _$getCommentsByPostId = $grpc.ClientMethod<$5.GetCommentsByPostIdRequest, $1.Response>(
      '/comment.GrpcComment/GetCommentsByPostId',
      ($5.GetCommentsByPostIdRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$addComment = $grpc.ClientMethod<$5.AddCommentRequest, $1.Response>(
      '/comment.GrpcComment/AddComment',
      ($5.AddCommentRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$deleteComment = $grpc.ClientMethod<$5.DeleteCommentRequest, $1.Response>(
      '/comment.GrpcComment/DeleteComment',
      ($5.DeleteCommentRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$likeComment = $grpc.ClientMethod<$5.LikeCommentRequest, $1.Response>(
      '/comment.GrpcComment/LikeComment',
      ($5.LikeCommentRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$unLikeComment = $grpc.ClientMethod<$5.UnLikeCommentRequest, $1.Response>(
      '/comment.GrpcComment/UnLikeComment',
      ($5.UnLikeCommentRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));

  GrpcCommentClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$1.Response> getCommentsByPostId($5.GetCommentsByPostIdRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getCommentsByPostId, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> addComment($5.AddCommentRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addComment, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> deleteComment($5.DeleteCommentRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteComment, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> likeComment($5.LikeCommentRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$likeComment, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> unLikeComment($5.UnLikeCommentRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$unLikeComment, request, options: options);
  }
}

@$pb.GrpcServiceName('comment.GrpcComment')
abstract class GrpcCommentServiceBase extends $grpc.Service {
  $core.String get $name => 'comment.GrpcComment';

  GrpcCommentServiceBase() {
    $addMethod($grpc.ServiceMethod<$5.GetCommentsByPostIdRequest, $1.Response>(
        'GetCommentsByPostId',
        getCommentsByPostId_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.GetCommentsByPostIdRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.AddCommentRequest, $1.Response>(
        'AddComment',
        addComment_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.AddCommentRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.DeleteCommentRequest, $1.Response>(
        'DeleteComment',
        deleteComment_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.DeleteCommentRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.LikeCommentRequest, $1.Response>(
        'LikeComment',
        likeComment_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.LikeCommentRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.UnLikeCommentRequest, $1.Response>(
        'UnLikeComment',
        unLikeComment_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.UnLikeCommentRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
  }

  $async.Future<$1.Response> getCommentsByPostId_Pre($grpc.ServiceCall call, $async.Future<$5.GetCommentsByPostIdRequest> request) async {
    return getCommentsByPostId(call, await request);
  }

  $async.Future<$1.Response> addComment_Pre($grpc.ServiceCall call, $async.Future<$5.AddCommentRequest> request) async {
    return addComment(call, await request);
  }

  $async.Future<$1.Response> deleteComment_Pre($grpc.ServiceCall call, $async.Future<$5.DeleteCommentRequest> request) async {
    return deleteComment(call, await request);
  }

  $async.Future<$1.Response> likeComment_Pre($grpc.ServiceCall call, $async.Future<$5.LikeCommentRequest> request) async {
    return likeComment(call, await request);
  }

  $async.Future<$1.Response> unLikeComment_Pre($grpc.ServiceCall call, $async.Future<$5.UnLikeCommentRequest> request) async {
    return unLikeComment(call, await request);
  }

  $async.Future<$1.Response> getCommentsByPostId($grpc.ServiceCall call, $5.GetCommentsByPostIdRequest request);
  $async.Future<$1.Response> addComment($grpc.ServiceCall call, $5.AddCommentRequest request);
  $async.Future<$1.Response> deleteComment($grpc.ServiceCall call, $5.DeleteCommentRequest request);
  $async.Future<$1.Response> likeComment($grpc.ServiceCall call, $5.LikeCommentRequest request);
  $async.Future<$1.Response> unLikeComment($grpc.ServiceCall call, $5.UnLikeCommentRequest request);
}
