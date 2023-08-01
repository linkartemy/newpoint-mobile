//
//  Generated code. Do not modify.
//  source: post.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'post.pb.dart' as $2;
import 'response.pb.dart' as $1;

export 'post.pb.dart';

@$pb.GrpcServiceName('post.GrpcPost')
class GrpcPostClient extends $grpc.Client {
  static final _$getPosts = $grpc.ClientMethod<$2.GetPostsRequest, $1.Response>(
      '/post.GrpcPost/GetPosts',
      ($2.GetPostsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$getPostById = $grpc.ClientMethod<$2.GetPostByIdRequest, $1.Response>(
      '/post.GrpcPost/GetPostById',
      ($2.GetPostByIdRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$likePost = $grpc.ClientMethod<$2.LikePostRequest, $1.Response>(
      '/post.GrpcPost/LikePost',
      ($2.LikePostRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$unLikePost = $grpc.ClientMethod<$2.UnLikePostRequest, $1.Response>(
      '/post.GrpcPost/UnLikePost',
      ($2.UnLikePostRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$sharePost = $grpc.ClientMethod<$2.SharePostRequest, $1.Response>(
      '/post.GrpcPost/SharePost',
      ($2.SharePostRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));

  GrpcPostClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$1.Response> getPosts($2.GetPostsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPosts, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> getPostById($2.GetPostByIdRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPostById, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> likePost($2.LikePostRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$likePost, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> unLikePost($2.UnLikePostRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$unLikePost, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> sharePost($2.SharePostRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sharePost, request, options: options);
  }
}

@$pb.GrpcServiceName('post.GrpcPost')
abstract class GrpcPostServiceBase extends $grpc.Service {
  $core.String get $name => 'post.GrpcPost';

  GrpcPostServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.GetPostsRequest, $1.Response>(
        'GetPosts',
        getPosts_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.GetPostsRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.GetPostByIdRequest, $1.Response>(
        'GetPostById',
        getPostById_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.GetPostByIdRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.LikePostRequest, $1.Response>(
        'LikePost',
        likePost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.LikePostRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.UnLikePostRequest, $1.Response>(
        'UnLikePost',
        unLikePost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.UnLikePostRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.SharePostRequest, $1.Response>(
        'SharePost',
        sharePost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.SharePostRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
  }

  $async.Future<$1.Response> getPosts_Pre($grpc.ServiceCall call, $async.Future<$2.GetPostsRequest> request) async {
    return getPosts(call, await request);
  }

  $async.Future<$1.Response> getPostById_Pre($grpc.ServiceCall call, $async.Future<$2.GetPostByIdRequest> request) async {
    return getPostById(call, await request);
  }

  $async.Future<$1.Response> likePost_Pre($grpc.ServiceCall call, $async.Future<$2.LikePostRequest> request) async {
    return likePost(call, await request);
  }

  $async.Future<$1.Response> unLikePost_Pre($grpc.ServiceCall call, $async.Future<$2.UnLikePostRequest> request) async {
    return unLikePost(call, await request);
  }

  $async.Future<$1.Response> sharePost_Pre($grpc.ServiceCall call, $async.Future<$2.SharePostRequest> request) async {
    return sharePost(call, await request);
  }

  $async.Future<$1.Response> getPosts($grpc.ServiceCall call, $2.GetPostsRequest request);
  $async.Future<$1.Response> getPostById($grpc.ServiceCall call, $2.GetPostByIdRequest request);
  $async.Future<$1.Response> likePost($grpc.ServiceCall call, $2.LikePostRequest request);
  $async.Future<$1.Response> unLikePost($grpc.ServiceCall call, $2.UnLikePostRequest request);
  $async.Future<$1.Response> sharePost($grpc.ServiceCall call, $2.SharePostRequest request);
}
