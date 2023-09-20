//
//  Generated code. Do not modify.
//  source: post.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $7;

class PostModel extends $pb.GeneratedMessage {
  factory PostModel({
    $fixnum.Int64? id,
    $fixnum.Int64? authorId,
    $core.String? login,
    $core.String? name,
    $core.String? surname,
    $core.String? content,
    $core.String? images,
    $core.int? likes,
    $core.int? shares,
    $core.int? comments,
    $core.bool? liked,
    $7.Timestamp? creationTimestamp,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (authorId != null) {
      $result.authorId = authorId;
    }
    if (login != null) {
      $result.login = login;
    }
    if (name != null) {
      $result.name = name;
    }
    if (surname != null) {
      $result.surname = surname;
    }
    if (content != null) {
      $result.content = content;
    }
    if (images != null) {
      $result.images = images;
    }
    if (likes != null) {
      $result.likes = likes;
    }
    if (shares != null) {
      $result.shares = shares;
    }
    if (comments != null) {
      $result.comments = comments;
    }
    if (liked != null) {
      $result.liked = liked;
    }
    if (creationTimestamp != null) {
      $result.creationTimestamp = creationTimestamp;
    }
    return $result;
  }
  PostModel._() : super();
  factory PostModel.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PostModel.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PostModel', package: const $pb.PackageName(_omitMessageNames ? '' : 'post'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aInt64(2, _omitFieldNames ? '' : 'authorId')
    ..aOS(3, _omitFieldNames ? '' : 'login')
    ..aOS(4, _omitFieldNames ? '' : 'name')
    ..aOS(5, _omitFieldNames ? '' : 'surname')
    ..aOS(6, _omitFieldNames ? '' : 'content')
    ..aOS(7, _omitFieldNames ? '' : 'images')
    ..a<$core.int>(8, _omitFieldNames ? '' : 'likes', $pb.PbFieldType.O3)
    ..a<$core.int>(9, _omitFieldNames ? '' : 'shares', $pb.PbFieldType.O3)
    ..a<$core.int>(10, _omitFieldNames ? '' : 'comments', $pb.PbFieldType.O3)
    ..aOB(11, _omitFieldNames ? '' : 'liked')
    ..aOM<$7.Timestamp>(12, _omitFieldNames ? '' : 'creationTimestamp', subBuilder: $7.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PostModel clone() => PostModel()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PostModel copyWith(void Function(PostModel) updates) => super.copyWith((message) => updates(message as PostModel)) as PostModel;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PostModel create() => PostModel._();
  PostModel createEmptyInstance() => create();
  static $pb.PbList<PostModel> createRepeated() => $pb.PbList<PostModel>();
  @$core.pragma('dart2js:noInline')
  static PostModel getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PostModel>(create);
  static PostModel? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get authorId => $_getI64(1);
  @$pb.TagNumber(2)
  set authorId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAuthorId() => $_has(1);
  @$pb.TagNumber(2)
  void clearAuthorId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get login => $_getSZ(2);
  @$pb.TagNumber(3)
  set login($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLogin() => $_has(2);
  @$pb.TagNumber(3)
  void clearLogin() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get name => $_getSZ(3);
  @$pb.TagNumber(4)
  set name($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasName() => $_has(3);
  @$pb.TagNumber(4)
  void clearName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get surname => $_getSZ(4);
  @$pb.TagNumber(5)
  set surname($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSurname() => $_has(4);
  @$pb.TagNumber(5)
  void clearSurname() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get content => $_getSZ(5);
  @$pb.TagNumber(6)
  set content($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasContent() => $_has(5);
  @$pb.TagNumber(6)
  void clearContent() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get images => $_getSZ(6);
  @$pb.TagNumber(7)
  set images($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasImages() => $_has(6);
  @$pb.TagNumber(7)
  void clearImages() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get likes => $_getIZ(7);
  @$pb.TagNumber(8)
  set likes($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasLikes() => $_has(7);
  @$pb.TagNumber(8)
  void clearLikes() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get shares => $_getIZ(8);
  @$pb.TagNumber(9)
  set shares($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasShares() => $_has(8);
  @$pb.TagNumber(9)
  void clearShares() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get comments => $_getIZ(9);
  @$pb.TagNumber(10)
  set comments($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasComments() => $_has(9);
  @$pb.TagNumber(10)
  void clearComments() => clearField(10);

  @$pb.TagNumber(11)
  $core.bool get liked => $_getBF(10);
  @$pb.TagNumber(11)
  set liked($core.bool v) { $_setBool(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasLiked() => $_has(10);
  @$pb.TagNumber(11)
  void clearLiked() => clearField(11);

  @$pb.TagNumber(12)
  $7.Timestamp get creationTimestamp => $_getN(11);
  @$pb.TagNumber(12)
  set creationTimestamp($7.Timestamp v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasCreationTimestamp() => $_has(11);
  @$pb.TagNumber(12)
  void clearCreationTimestamp() => clearField(12);
  @$pb.TagNumber(12)
  $7.Timestamp ensureCreationTimestamp() => $_ensure(11);
}

class GetPostsRequest extends $pb.GeneratedMessage {
  factory GetPostsRequest() => create();
  GetPostsRequest._() : super();
  factory GetPostsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPostsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPostsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'post'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPostsRequest clone() => GetPostsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPostsRequest copyWith(void Function(GetPostsRequest) updates) => super.copyWith((message) => updates(message as GetPostsRequest)) as GetPostsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPostsRequest create() => GetPostsRequest._();
  GetPostsRequest createEmptyInstance() => create();
  static $pb.PbList<GetPostsRequest> createRepeated() => $pb.PbList<GetPostsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetPostsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPostsRequest>(create);
  static GetPostsRequest? _defaultInstance;
}

class GetPostsResponse extends $pb.GeneratedMessage {
  factory GetPostsResponse({
    $core.Iterable<PostModel>? posts,
  }) {
    final $result = create();
    if (posts != null) {
      $result.posts.addAll(posts);
    }
    return $result;
  }
  GetPostsResponse._() : super();
  factory GetPostsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPostsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPostsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'post'), createEmptyInstance: create)
    ..pc<PostModel>(1, _omitFieldNames ? '' : 'posts', $pb.PbFieldType.PM, subBuilder: PostModel.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPostsResponse clone() => GetPostsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPostsResponse copyWith(void Function(GetPostsResponse) updates) => super.copyWith((message) => updates(message as GetPostsResponse)) as GetPostsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPostsResponse create() => GetPostsResponse._();
  GetPostsResponse createEmptyInstance() => create();
  static $pb.PbList<GetPostsResponse> createRepeated() => $pb.PbList<GetPostsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetPostsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPostsResponse>(create);
  static GetPostsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<PostModel> get posts => $_getList(0);
}

class GetPostsByUserIdRequest extends $pb.GeneratedMessage {
  factory GetPostsByUserIdRequest({
    $fixnum.Int64? userId,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    return $result;
  }
  GetPostsByUserIdRequest._() : super();
  factory GetPostsByUserIdRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPostsByUserIdRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPostsByUserIdRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'post'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPostsByUserIdRequest clone() => GetPostsByUserIdRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPostsByUserIdRequest copyWith(void Function(GetPostsByUserIdRequest) updates) => super.copyWith((message) => updates(message as GetPostsByUserIdRequest)) as GetPostsByUserIdRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPostsByUserIdRequest create() => GetPostsByUserIdRequest._();
  GetPostsByUserIdRequest createEmptyInstance() => create();
  static $pb.PbList<GetPostsByUserIdRequest> createRepeated() => $pb.PbList<GetPostsByUserIdRequest>();
  @$core.pragma('dart2js:noInline')
  static GetPostsByUserIdRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPostsByUserIdRequest>(create);
  static GetPostsByUserIdRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get userId => $_getI64(0);
  @$pb.TagNumber(1)
  set userId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);
}

class GetPostsByUserIdResponse extends $pb.GeneratedMessage {
  factory GetPostsByUserIdResponse({
    $core.Iterable<PostModel>? posts,
  }) {
    final $result = create();
    if (posts != null) {
      $result.posts.addAll(posts);
    }
    return $result;
  }
  GetPostsByUserIdResponse._() : super();
  factory GetPostsByUserIdResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPostsByUserIdResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPostsByUserIdResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'post'), createEmptyInstance: create)
    ..pc<PostModel>(1, _omitFieldNames ? '' : 'posts', $pb.PbFieldType.PM, subBuilder: PostModel.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPostsByUserIdResponse clone() => GetPostsByUserIdResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPostsByUserIdResponse copyWith(void Function(GetPostsByUserIdResponse) updates) => super.copyWith((message) => updates(message as GetPostsByUserIdResponse)) as GetPostsByUserIdResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPostsByUserIdResponse create() => GetPostsByUserIdResponse._();
  GetPostsByUserIdResponse createEmptyInstance() => create();
  static $pb.PbList<GetPostsByUserIdResponse> createRepeated() => $pb.PbList<GetPostsByUserIdResponse>();
  @$core.pragma('dart2js:noInline')
  static GetPostsByUserIdResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPostsByUserIdResponse>(create);
  static GetPostsByUserIdResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<PostModel> get posts => $_getList(0);
}

class GetPostByIdRequest extends $pb.GeneratedMessage {
  factory GetPostByIdRequest({
    $fixnum.Int64? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  GetPostByIdRequest._() : super();
  factory GetPostByIdRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPostByIdRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPostByIdRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'post'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPostByIdRequest clone() => GetPostByIdRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPostByIdRequest copyWith(void Function(GetPostByIdRequest) updates) => super.copyWith((message) => updates(message as GetPostByIdRequest)) as GetPostByIdRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPostByIdRequest create() => GetPostByIdRequest._();
  GetPostByIdRequest createEmptyInstance() => create();
  static $pb.PbList<GetPostByIdRequest> createRepeated() => $pb.PbList<GetPostByIdRequest>();
  @$core.pragma('dart2js:noInline')
  static GetPostByIdRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPostByIdRequest>(create);
  static GetPostByIdRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class GetPostByIdResponse extends $pb.GeneratedMessage {
  factory GetPostByIdResponse({
    PostModel? post,
  }) {
    final $result = create();
    if (post != null) {
      $result.post = post;
    }
    return $result;
  }
  GetPostByIdResponse._() : super();
  factory GetPostByIdResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPostByIdResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPostByIdResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'post'), createEmptyInstance: create)
    ..aOM<PostModel>(1, _omitFieldNames ? '' : 'post', subBuilder: PostModel.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPostByIdResponse clone() => GetPostByIdResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPostByIdResponse copyWith(void Function(GetPostByIdResponse) updates) => super.copyWith((message) => updates(message as GetPostByIdResponse)) as GetPostByIdResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPostByIdResponse create() => GetPostByIdResponse._();
  GetPostByIdResponse createEmptyInstance() => create();
  static $pb.PbList<GetPostByIdResponse> createRepeated() => $pb.PbList<GetPostByIdResponse>();
  @$core.pragma('dart2js:noInline')
  static GetPostByIdResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPostByIdResponse>(create);
  static GetPostByIdResponse? _defaultInstance;

  @$pb.TagNumber(1)
  PostModel get post => $_getN(0);
  @$pb.TagNumber(1)
  set post(PostModel v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPost() => $_has(0);
  @$pb.TagNumber(1)
  void clearPost() => clearField(1);
  @$pb.TagNumber(1)
  PostModel ensurePost() => $_ensure(0);
}

class LikePostRequest extends $pb.GeneratedMessage {
  factory LikePostRequest({
    $fixnum.Int64? postId,
  }) {
    final $result = create();
    if (postId != null) {
      $result.postId = postId;
    }
    return $result;
  }
  LikePostRequest._() : super();
  factory LikePostRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LikePostRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LikePostRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'post'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'postId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LikePostRequest clone() => LikePostRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LikePostRequest copyWith(void Function(LikePostRequest) updates) => super.copyWith((message) => updates(message as LikePostRequest)) as LikePostRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LikePostRequest create() => LikePostRequest._();
  LikePostRequest createEmptyInstance() => create();
  static $pb.PbList<LikePostRequest> createRepeated() => $pb.PbList<LikePostRequest>();
  @$core.pragma('dart2js:noInline')
  static LikePostRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LikePostRequest>(create);
  static LikePostRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get postId => $_getI64(0);
  @$pb.TagNumber(1)
  set postId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPostId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPostId() => clearField(1);
}

class LikePostResponse extends $pb.GeneratedMessage {
  factory LikePostResponse({
    $core.bool? liked,
  }) {
    final $result = create();
    if (liked != null) {
      $result.liked = liked;
    }
    return $result;
  }
  LikePostResponse._() : super();
  factory LikePostResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LikePostResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LikePostResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'post'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'liked')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LikePostResponse clone() => LikePostResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LikePostResponse copyWith(void Function(LikePostResponse) updates) => super.copyWith((message) => updates(message as LikePostResponse)) as LikePostResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LikePostResponse create() => LikePostResponse._();
  LikePostResponse createEmptyInstance() => create();
  static $pb.PbList<LikePostResponse> createRepeated() => $pb.PbList<LikePostResponse>();
  @$core.pragma('dart2js:noInline')
  static LikePostResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LikePostResponse>(create);
  static LikePostResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get liked => $_getBF(0);
  @$pb.TagNumber(1)
  set liked($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLiked() => $_has(0);
  @$pb.TagNumber(1)
  void clearLiked() => clearField(1);
}

class UnLikePostRequest extends $pb.GeneratedMessage {
  factory UnLikePostRequest({
    $fixnum.Int64? postId,
  }) {
    final $result = create();
    if (postId != null) {
      $result.postId = postId;
    }
    return $result;
  }
  UnLikePostRequest._() : super();
  factory UnLikePostRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UnLikePostRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UnLikePostRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'post'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'postId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UnLikePostRequest clone() => UnLikePostRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UnLikePostRequest copyWith(void Function(UnLikePostRequest) updates) => super.copyWith((message) => updates(message as UnLikePostRequest)) as UnLikePostRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UnLikePostRequest create() => UnLikePostRequest._();
  UnLikePostRequest createEmptyInstance() => create();
  static $pb.PbList<UnLikePostRequest> createRepeated() => $pb.PbList<UnLikePostRequest>();
  @$core.pragma('dart2js:noInline')
  static UnLikePostRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UnLikePostRequest>(create);
  static UnLikePostRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get postId => $_getI64(0);
  @$pb.TagNumber(1)
  set postId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPostId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPostId() => clearField(1);
}

class UnLikePostResponse extends $pb.GeneratedMessage {
  factory UnLikePostResponse({
    $core.bool? liked,
  }) {
    final $result = create();
    if (liked != null) {
      $result.liked = liked;
    }
    return $result;
  }
  UnLikePostResponse._() : super();
  factory UnLikePostResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UnLikePostResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UnLikePostResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'post'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'liked')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UnLikePostResponse clone() => UnLikePostResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UnLikePostResponse copyWith(void Function(UnLikePostResponse) updates) => super.copyWith((message) => updates(message as UnLikePostResponse)) as UnLikePostResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UnLikePostResponse create() => UnLikePostResponse._();
  UnLikePostResponse createEmptyInstance() => create();
  static $pb.PbList<UnLikePostResponse> createRepeated() => $pb.PbList<UnLikePostResponse>();
  @$core.pragma('dart2js:noInline')
  static UnLikePostResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UnLikePostResponse>(create);
  static UnLikePostResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get liked => $_getBF(0);
  @$pb.TagNumber(1)
  set liked($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLiked() => $_has(0);
  @$pb.TagNumber(1)
  void clearLiked() => clearField(1);
}

class SharePostRequest extends $pb.GeneratedMessage {
  factory SharePostRequest({
    $fixnum.Int64? postId,
  }) {
    final $result = create();
    if (postId != null) {
      $result.postId = postId;
    }
    return $result;
  }
  SharePostRequest._() : super();
  factory SharePostRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SharePostRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SharePostRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'post'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'postId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SharePostRequest clone() => SharePostRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SharePostRequest copyWith(void Function(SharePostRequest) updates) => super.copyWith((message) => updates(message as SharePostRequest)) as SharePostRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SharePostRequest create() => SharePostRequest._();
  SharePostRequest createEmptyInstance() => create();
  static $pb.PbList<SharePostRequest> createRepeated() => $pb.PbList<SharePostRequest>();
  @$core.pragma('dart2js:noInline')
  static SharePostRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SharePostRequest>(create);
  static SharePostRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get postId => $_getI64(0);
  @$pb.TagNumber(1)
  set postId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPostId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPostId() => clearField(1);
}

class SharePostResponse extends $pb.GeneratedMessage {
  factory SharePostResponse({
    $core.bool? shared,
  }) {
    final $result = create();
    if (shared != null) {
      $result.shared = shared;
    }
    return $result;
  }
  SharePostResponse._() : super();
  factory SharePostResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SharePostResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SharePostResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'post'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'shared')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SharePostResponse clone() => SharePostResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SharePostResponse copyWith(void Function(SharePostResponse) updates) => super.copyWith((message) => updates(message as SharePostResponse)) as SharePostResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SharePostResponse create() => SharePostResponse._();
  SharePostResponse createEmptyInstance() => create();
  static $pb.PbList<SharePostResponse> createRepeated() => $pb.PbList<SharePostResponse>();
  @$core.pragma('dart2js:noInline')
  static SharePostResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SharePostResponse>(create);
  static SharePostResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get shared => $_getBF(0);
  @$pb.TagNumber(1)
  set shared($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasShared() => $_has(0);
  @$pb.TagNumber(1)
  void clearShared() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
