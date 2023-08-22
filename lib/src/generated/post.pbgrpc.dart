//
//  Generated code. Do not modify.
//  source: post.proto
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

import 'post.pb.dart' as $3;
import 'response.pb.dart' as $1;

export 'post.pb.dart';

@$pb.GrpcServiceName('post.GrpcPost')
class GrpcPostClient extends $grpc.Client {
  static final _$getPosts = $grpc.ClientMethod<$3.GetPostsRequest, $1.Response>(
      '/post.GrpcPost/GetPosts',
      ($3.GetPostsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$getPostsByUserId = $grpc.ClientMethod<$3.GetPostsByUserIdRequest, $1.Response>(
      '/post.GrpcPost/GetPostsByUserId',
      ($3.GetPostsByUserIdRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$getPostById = $grpc.ClientMethod<$3.GetPostByIdRequest, $1.Response>(
      '/post.GrpcPost/GetPostById',
      ($3.GetPostByIdRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$likePost = $grpc.ClientMethod<$3.LikePostRequest, $1.Response>(
      '/post.GrpcPost/LikePost',
      ($3.LikePostRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$unLikePost = $grpc.ClientMethod<$3.UnLikePostRequest, $1.Response>(
      '/post.GrpcPost/UnLikePost',
      ($3.UnLikePostRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$sharePost = $grpc.ClientMethod<$3.SharePostRequest, $1.Response>(
      '/post.GrpcPost/SharePost',
      ($3.SharePostRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));

  GrpcPostClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$1.Response> getPosts($3.GetPostsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPosts, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> getPostsByUserId($3.GetPostsByUserIdRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPostsByUserId, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> getPostById($3.GetPostByIdRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPostById, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> likePost($3.LikePostRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$likePost, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> unLikePost($3.UnLikePostRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$unLikePost, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> sharePost($3.SharePostRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sharePost, request, options: options);
  }
}

@$pb.GrpcServiceName('post.GrpcPost')
abstract class GrpcPostServiceBase extends $grpc.Service {
  $core.String get $name => 'post.GrpcPost';

  GrpcPostServiceBase() {
    $addMethod($grpc.ServiceMethod<$3.GetPostsRequest, $1.Response>(
        'GetPosts',
        getPosts_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.GetPostsRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.GetPostsByUserIdRequest, $1.Response>(
        'GetPostsByUserId',
        getPostsByUserId_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.GetPostsByUserIdRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.GetPostByIdRequest, $1.Response>(
        'GetPostById',
        getPostById_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.GetPostByIdRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.LikePostRequest, $1.Response>(
        'LikePost',
        likePost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.LikePostRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.UnLikePostRequest, $1.Response>(
        'UnLikePost',
        unLikePost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.UnLikePostRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.SharePostRequest, $1.Response>(
        'SharePost',
        sharePost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.SharePostRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
  }

  $async.Future<$1.Response> getPosts_Pre($grpc.ServiceCall call, $async.Future<$3.GetPostsRequest> request) async {
    return getPosts(call, await request);
  }

  $async.Future<$1.Response> getPostsByUserId_Pre($grpc.ServiceCall call, $async.Future<$3.GetPostsByUserIdRequest> request) async {
    return getPostsByUserId(call, await request);
  }

  $async.Future<$1.Response> getPostById_Pre($grpc.ServiceCall call, $async.Future<$3.GetPostByIdRequest> request) async {
    return getPostById(call, await request);
  }

  $async.Future<$1.Response> likePost_Pre($grpc.ServiceCall call, $async.Future<$3.LikePostRequest> request) async {
    return likePost(call, await request);
  }

  $async.Future<$1.Response> unLikePost_Pre($grpc.ServiceCall call, $async.Future<$3.UnLikePostRequest> request) async {
    return unLikePost(call, await request);
  }

  $async.Future<$1.Response> sharePost_Pre($grpc.ServiceCall call, $async.Future<$3.SharePostRequest> request) async {
    return sharePost(call, await request);
  }

  $async.Future<$1.Response> getPosts($grpc.ServiceCall call, $3.GetPostsRequest request);
  $async.Future<$1.Response> getPostsByUserId($grpc.ServiceCall call, $3.GetPostsByUserIdRequest request);
  $async.Future<$1.Response> getPostById($grpc.ServiceCall call, $3.GetPostByIdRequest request);
  $async.Future<$1.Response> likePost($grpc.ServiceCall call, $3.LikePostRequest request);
  $async.Future<$1.Response> unLikePost($grpc.ServiceCall call, $3.UnLikePostRequest request);
  $async.Future<$1.Response> sharePost($grpc.ServiceCall call, $3.SharePostRequest request);
}
