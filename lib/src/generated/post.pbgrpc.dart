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

import 'post.pb.dart' as $4;
import 'response.pb.dart' as $1;

export 'post.pb.dart';

@$pb.GrpcServiceName('post.GrpcPost')
class GrpcPostClient extends $grpc.Client {
  static final _$addPost = $grpc.ClientMethod<$4.AddPostRequest, $1.Response>(
      '/post.GrpcPost/AddPost',
      ($4.AddPostRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$getPosts = $grpc.ClientMethod<$4.GetPostsRequest, $1.Response>(
      '/post.GrpcPost/GetPosts',
      ($4.GetPostsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$getPostsByUserId = $grpc.ClientMethod<$4.GetPostsByUserIdRequest, $1.Response>(
      '/post.GrpcPost/GetPostsByUserId',
      ($4.GetPostsByUserIdRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$getPostById = $grpc.ClientMethod<$4.GetPostByIdRequest, $1.Response>(
      '/post.GrpcPost/GetPostById',
      ($4.GetPostByIdRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$likePost = $grpc.ClientMethod<$4.LikePostRequest, $1.Response>(
      '/post.GrpcPost/LikePost',
      ($4.LikePostRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$unLikePost = $grpc.ClientMethod<$4.UnLikePostRequest, $1.Response>(
      '/post.GrpcPost/UnLikePost',
      ($4.UnLikePostRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$sharePost = $grpc.ClientMethod<$4.SharePostRequest, $1.Response>(
      '/post.GrpcPost/SharePost',
      ($4.SharePostRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));
  static final _$addPostView = $grpc.ClientMethod<$4.AddPostViewRequest, $1.Response>(
      '/post.GrpcPost/AddPostView',
      ($4.AddPostViewRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Response.fromBuffer(value));

  GrpcPostClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$1.Response> addPost($4.AddPostRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addPost, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> getPosts($4.GetPostsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPosts, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> getPostsByUserId($4.GetPostsByUserIdRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPostsByUserId, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> getPostById($4.GetPostByIdRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPostById, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> likePost($4.LikePostRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$likePost, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> unLikePost($4.UnLikePostRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$unLikePost, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> sharePost($4.SharePostRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sharePost, request, options: options);
  }

  $grpc.ResponseFuture<$1.Response> addPostView($4.AddPostViewRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addPostView, request, options: options);
  }
}

@$pb.GrpcServiceName('post.GrpcPost')
abstract class GrpcPostServiceBase extends $grpc.Service {
  $core.String get $name => 'post.GrpcPost';

  GrpcPostServiceBase() {
    $addMethod($grpc.ServiceMethod<$4.AddPostRequest, $1.Response>(
        'AddPost',
        addPost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.AddPostRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.GetPostsRequest, $1.Response>(
        'GetPosts',
        getPosts_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.GetPostsRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.GetPostsByUserIdRequest, $1.Response>(
        'GetPostsByUserId',
        getPostsByUserId_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.GetPostsByUserIdRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.GetPostByIdRequest, $1.Response>(
        'GetPostById',
        getPostById_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.GetPostByIdRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.LikePostRequest, $1.Response>(
        'LikePost',
        likePost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.LikePostRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.UnLikePostRequest, $1.Response>(
        'UnLikePost',
        unLikePost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.UnLikePostRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.SharePostRequest, $1.Response>(
        'SharePost',
        sharePost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.SharePostRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.AddPostViewRequest, $1.Response>(
        'AddPostView',
        addPostView_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.AddPostViewRequest.fromBuffer(value),
        ($1.Response value) => value.writeToBuffer()));
  }

  $async.Future<$1.Response> addPost_Pre($grpc.ServiceCall call, $async.Future<$4.AddPostRequest> request) async {
    return addPost(call, await request);
  }

  $async.Future<$1.Response> getPosts_Pre($grpc.ServiceCall call, $async.Future<$4.GetPostsRequest> request) async {
    return getPosts(call, await request);
  }

  $async.Future<$1.Response> getPostsByUserId_Pre($grpc.ServiceCall call, $async.Future<$4.GetPostsByUserIdRequest> request) async {
    return getPostsByUserId(call, await request);
  }

  $async.Future<$1.Response> getPostById_Pre($grpc.ServiceCall call, $async.Future<$4.GetPostByIdRequest> request) async {
    return getPostById(call, await request);
  }

  $async.Future<$1.Response> likePost_Pre($grpc.ServiceCall call, $async.Future<$4.LikePostRequest> request) async {
    return likePost(call, await request);
  }

  $async.Future<$1.Response> unLikePost_Pre($grpc.ServiceCall call, $async.Future<$4.UnLikePostRequest> request) async {
    return unLikePost(call, await request);
  }

  $async.Future<$1.Response> sharePost_Pre($grpc.ServiceCall call, $async.Future<$4.SharePostRequest> request) async {
    return sharePost(call, await request);
  }

  $async.Future<$1.Response> addPostView_Pre($grpc.ServiceCall call, $async.Future<$4.AddPostViewRequest> request) async {
    return addPostView(call, await request);
  }

  $async.Future<$1.Response> addPost($grpc.ServiceCall call, $4.AddPostRequest request);
  $async.Future<$1.Response> getPosts($grpc.ServiceCall call, $4.GetPostsRequest request);
  $async.Future<$1.Response> getPostsByUserId($grpc.ServiceCall call, $4.GetPostsByUserIdRequest request);
  $async.Future<$1.Response> getPostById($grpc.ServiceCall call, $4.GetPostByIdRequest request);
  $async.Future<$1.Response> likePost($grpc.ServiceCall call, $4.LikePostRequest request);
  $async.Future<$1.Response> unLikePost($grpc.ServiceCall call, $4.UnLikePostRequest request);
  $async.Future<$1.Response> sharePost($grpc.ServiceCall call, $4.SharePostRequest request);
  $async.Future<$1.Response> addPostView($grpc.ServiceCall call, $4.AddPostViewRequest request);
}
