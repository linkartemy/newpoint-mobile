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

import 'google/protobuf/timestamp.pb.dart' as $11;

class PostModel extends $pb.GeneratedMessage {
  factory PostModel({
    $fixnum.Int64? id,
    $fixnum.Int64? authorId,
    $core.String? login,
    $core.String? name,
    $core.String? surname,
    $fixnum.Int64? profileImageId,
    $core.String? content,
    $core.String? images,
    $core.int? likes,
    $core.int? shares,
    $core.int? comments,
    $core.int? views,
    $core.bool? liked,
    $core.bool? bookmarked,
    $11.Timestamp? creationTimestamp,
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
    if (profileImageId != null) {
      $result.profileImageId = profileImageId;
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
    if (views != null) {
      $result.views = views;
    }
    if (liked != null) {
      $result.liked = liked;
    }
    if (bookmarked != null) {
      $result.bookmarked = bookmarked;
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
    ..aInt64(6, _omitFieldNames ? '' : 'profileImageId')
    ..aOS(7, _omitFieldNames ? '' : 'content')
    ..aOS(8, _omitFieldNames ? '' : 'images')
    ..a<$core.int>(9, _omitFieldNames ? '' : 'likes', $pb.PbFieldType.O3)
    ..a<$core.int>(10, _omitFieldNames ? '' : 'shares', $pb.PbFieldType.O3)
    ..a<$core.int>(11, _omitFieldNames ? '' : 'comments', $pb.PbFieldType.O3)
    ..a<$core.int>(12, _omitFieldNames ? '' : 'views', $pb.PbFieldType.O3)
    ..aOB(13, _omitFieldNames ? '' : 'liked')
    ..aOB(14, _omitFieldNames ? '' : 'bookmarked')
    ..aOM<$11.Timestamp>(15, _omitFieldNames ? '' : 'creationTimestamp', subBuilder: $11.Timestamp.create)
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
  $fixnum.Int64 get profileImageId => $_getI64(5);
  @$pb.TagNumber(6)
  set profileImageId($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasProfileImageId() => $_has(5);
  @$pb.TagNumber(6)
  void clearProfileImageId() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get content => $_getSZ(6);
  @$pb.TagNumber(7)
  set content($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasContent() => $_has(6);
  @$pb.TagNumber(7)
  void clearContent() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get images => $_getSZ(7);
  @$pb.TagNumber(8)
  set images($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasImages() => $_has(7);
  @$pb.TagNumber(8)
  void clearImages() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get likes => $_getIZ(8);
  @$pb.TagNumber(9)
  set likes($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasLikes() => $_has(8);
  @$pb.TagNumber(9)
  void clearLikes() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get shares => $_getIZ(9);
  @$pb.TagNumber(10)
  set shares($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasShares() => $_has(9);
  @$pb.TagNumber(10)
  void clearShares() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get comments => $_getIZ(10);
  @$pb.TagNumber(11)
  set comments($core.int v) { $_setSignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasComments() => $_has(10);
  @$pb.TagNumber(11)
  void clearComments() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get views => $_getIZ(11);
  @$pb.TagNumber(12)
  set views($core.int v) { $_setSignedInt32(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasViews() => $_has(11);
  @$pb.TagNumber(12)
  void clearViews() => clearField(12);

  @$pb.TagNumber(13)
  $core.bool get liked => $_getBF(12);
  @$pb.TagNumber(13)
  set liked($core.bool v) { $_setBool(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasLiked() => $_has(12);
  @$pb.TagNumber(13)
  void clearLiked() => clearField(13);

  @$pb.TagNumber(14)
  $core.bool get bookmarked => $_getBF(13);
  @$pb.TagNumber(14)
  set bookmarked($core.bool v) { $_setBool(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasBookmarked() => $_has(13);
  @$pb.TagNumber(14)
  void clearBookmarked() => clearField(14);

  @$pb.TagNumber(15)
  $11.Timestamp get creationTimestamp => $_getN(14);
  @$pb.TagNumber(15)
  set creationTimestamp($11.Timestamp v) { setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasCreationTimestamp() => $_has(14);
  @$pb.TagNumber(15)
  void clearCreationTimestamp() => clearField(15);
  @$pb.TagNumber(15)
  $11.Timestamp ensureCreationTimestamp() => $_ensure(14);
}

class AddPostRequest extends $pb.GeneratedMessage {
  factory AddPostRequest({
    $fixnum.Int64? authorId,
    $core.String? content,
  }) {
    final $result = create();
    if (authorId != null) {
      $result.authorId = authorId;
    }
    if (content != null) {
      $result.content = content;
    }
    return $result;
  }
  AddPostRequest._() : super();
  factory AddPostRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddPostRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddPostRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'post'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'authorId')
    ..aOS(2, _omitFieldNames ? '' : 'content')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddPostRequest clone() => AddPostRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddPostRequest copyWith(void Function(AddPostRequest) updates) => super.copyWith((message) => updates(message as AddPostRequest)) as AddPostRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddPostRequest create() => AddPostRequest._();
  AddPostRequest createEmptyInstance() => create();
  static $pb.PbList<AddPostRequest> createRepeated() => $pb.PbList<AddPostRequest>();
  @$core.pragma('dart2js:noInline')
  static AddPostRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddPostRequest>(create);
  static AddPostRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get authorId => $_getI64(0);
  @$pb.TagNumber(1)
  set authorId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAuthorId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAuthorId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get content => $_getSZ(1);
  @$pb.TagNumber(2)
  set content($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => clearField(2);
}

class AddPostResponse extends $pb.GeneratedMessage {
  factory AddPostResponse({
    $fixnum.Int64? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  AddPostResponse._() : super();
  factory AddPostResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddPostResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddPostResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'post'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddPostResponse clone() => AddPostResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddPostResponse copyWith(void Function(AddPostResponse) updates) => super.copyWith((message) => updates(message as AddPostResponse)) as AddPostResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddPostResponse create() => AddPostResponse._();
  AddPostResponse createEmptyInstance() => create();
  static $pb.PbList<AddPostResponse> createRepeated() => $pb.PbList<AddPostResponse>();
  @$core.pragma('dart2js:noInline')
  static AddPostResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddPostResponse>(create);
  static AddPostResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
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
    $fixnum.Int64? lastPostId,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (lastPostId != null) {
      $result.lastPostId = lastPostId;
    }
    return $result;
  }
  GetPostsByUserIdRequest._() : super();
  factory GetPostsByUserIdRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPostsByUserIdRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPostsByUserIdRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'post'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'userId')
    ..aInt64(2, _omitFieldNames ? '' : 'lastPostId')
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

  @$pb.TagNumber(2)
  $fixnum.Int64 get lastPostId => $_getI64(1);
  @$pb.TagNumber(2)
  set lastPostId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLastPostId() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastPostId() => clearField(2);
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

class GetPostsByUserIdAfterTimestampRequest extends $pb.GeneratedMessage {
  factory GetPostsByUserIdAfterTimestampRequest({
    $fixnum.Int64? userId,
    $11.Timestamp? timestamp,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (timestamp != null) {
      $result.timestamp = timestamp;
    }
    return $result;
  }
  GetPostsByUserIdAfterTimestampRequest._() : super();
  factory GetPostsByUserIdAfterTimestampRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPostsByUserIdAfterTimestampRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPostsByUserIdAfterTimestampRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'post'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'userId')
    ..aOM<$11.Timestamp>(2, _omitFieldNames ? '' : 'timestamp', subBuilder: $11.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPostsByUserIdAfterTimestampRequest clone() => GetPostsByUserIdAfterTimestampRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPostsByUserIdAfterTimestampRequest copyWith(void Function(GetPostsByUserIdAfterTimestampRequest) updates) => super.copyWith((message) => updates(message as GetPostsByUserIdAfterTimestampRequest)) as GetPostsByUserIdAfterTimestampRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPostsByUserIdAfterTimestampRequest create() => GetPostsByUserIdAfterTimestampRequest._();
  GetPostsByUserIdAfterTimestampRequest createEmptyInstance() => create();
  static $pb.PbList<GetPostsByUserIdAfterTimestampRequest> createRepeated() => $pb.PbList<GetPostsByUserIdAfterTimestampRequest>();
  @$core.pragma('dart2js:noInline')
  static GetPostsByUserIdAfterTimestampRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPostsByUserIdAfterTimestampRequest>(create);
  static GetPostsByUserIdAfterTimestampRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get userId => $_getI64(0);
  @$pb.TagNumber(1)
  set userId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $11.Timestamp get timestamp => $_getN(1);
  @$pb.TagNumber(2)
  set timestamp($11.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasTimestamp() => $_has(1);
  @$pb.TagNumber(2)
  void clearTimestamp() => clearField(2);
  @$pb.TagNumber(2)
  $11.Timestamp ensureTimestamp() => $_ensure(1);
}

class GetPostsByUserIdAfterTimestampResponse extends $pb.GeneratedMessage {
  factory GetPostsByUserIdAfterTimestampResponse({
    $core.Iterable<PostModel>? posts,
  }) {
    final $result = create();
    if (posts != null) {
      $result.posts.addAll(posts);
    }
    return $result;
  }
  GetPostsByUserIdAfterTimestampResponse._() : super();
  factory GetPostsByUserIdAfterTimestampResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPostsByUserIdAfterTimestampResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPostsByUserIdAfterTimestampResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'post'), createEmptyInstance: create)
    ..pc<PostModel>(1, _omitFieldNames ? '' : 'posts', $pb.PbFieldType.PM, subBuilder: PostModel.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPostsByUserIdAfterTimestampResponse clone() => GetPostsByUserIdAfterTimestampResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPostsByUserIdAfterTimestampResponse copyWith(void Function(GetPostsByUserIdAfterTimestampResponse) updates) => super.copyWith((message) => updates(message as GetPostsByUserIdAfterTimestampResponse)) as GetPostsByUserIdAfterTimestampResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPostsByUserIdAfterTimestampResponse create() => GetPostsByUserIdAfterTimestampResponse._();
  GetPostsByUserIdAfterTimestampResponse createEmptyInstance() => create();
  static $pb.PbList<GetPostsByUserIdAfterTimestampResponse> createRepeated() => $pb.PbList<GetPostsByUserIdAfterTimestampResponse>();
  @$core.pragma('dart2js:noInline')
  static GetPostsByUserIdAfterTimestampResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPostsByUserIdAfterTimestampResponse>(create);
  static GetPostsByUserIdAfterTimestampResponse? _defaultInstance;

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

class AddPostViewRequest extends $pb.GeneratedMessage {
  factory AddPostViewRequest({
    $fixnum.Int64? userId,
    $fixnum.Int64? postId,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (postId != null) {
      $result.postId = postId;
    }
    return $result;
  }
  AddPostViewRequest._() : super();
  factory AddPostViewRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddPostViewRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddPostViewRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'post'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'userId')
    ..aInt64(2, _omitFieldNames ? '' : 'postId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddPostViewRequest clone() => AddPostViewRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddPostViewRequest copyWith(void Function(AddPostViewRequest) updates) => super.copyWith((message) => updates(message as AddPostViewRequest)) as AddPostViewRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddPostViewRequest create() => AddPostViewRequest._();
  AddPostViewRequest createEmptyInstance() => create();
  static $pb.PbList<AddPostViewRequest> createRepeated() => $pb.PbList<AddPostViewRequest>();
  @$core.pragma('dart2js:noInline')
  static AddPostViewRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddPostViewRequest>(create);
  static AddPostViewRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get userId => $_getI64(0);
  @$pb.TagNumber(1)
  set userId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get postId => $_getI64(1);
  @$pb.TagNumber(2)
  set postId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPostId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPostId() => clearField(2);
}

class AddPostViewResponse extends $pb.GeneratedMessage {
  factory AddPostViewResponse({
    $fixnum.Int64? views,
  }) {
    final $result = create();
    if (views != null) {
      $result.views = views;
    }
    return $result;
  }
  AddPostViewResponse._() : super();
  factory AddPostViewResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddPostViewResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddPostViewResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'post'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'views')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddPostViewResponse clone() => AddPostViewResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddPostViewResponse copyWith(void Function(AddPostViewResponse) updates) => super.copyWith((message) => updates(message as AddPostViewResponse)) as AddPostViewResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddPostViewResponse create() => AddPostViewResponse._();
  AddPostViewResponse createEmptyInstance() => create();
  static $pb.PbList<AddPostViewResponse> createRepeated() => $pb.PbList<AddPostViewResponse>();
  @$core.pragma('dart2js:noInline')
  static AddPostViewResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddPostViewResponse>(create);
  static AddPostViewResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get views => $_getI64(0);
  @$pb.TagNumber(1)
  set views($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasViews() => $_has(0);
  @$pb.TagNumber(1)
  void clearViews() => clearField(1);
}

class DeletePostRequest extends $pb.GeneratedMessage {
  factory DeletePostRequest({
    $fixnum.Int64? postId,
  }) {
    final $result = create();
    if (postId != null) {
      $result.postId = postId;
    }
    return $result;
  }
  DeletePostRequest._() : super();
  factory DeletePostRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeletePostRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeletePostRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'post'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'postId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeletePostRequest clone() => DeletePostRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeletePostRequest copyWith(void Function(DeletePostRequest) updates) => super.copyWith((message) => updates(message as DeletePostRequest)) as DeletePostRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeletePostRequest create() => DeletePostRequest._();
  DeletePostRequest createEmptyInstance() => create();
  static $pb.PbList<DeletePostRequest> createRepeated() => $pb.PbList<DeletePostRequest>();
  @$core.pragma('dart2js:noInline')
  static DeletePostRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeletePostRequest>(create);
  static DeletePostRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get postId => $_getI64(0);
  @$pb.TagNumber(1)
  set postId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPostId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPostId() => clearField(1);
}

class DeletePostResponse extends $pb.GeneratedMessage {
  factory DeletePostResponse({
    $core.bool? deleted,
  }) {
    final $result = create();
    if (deleted != null) {
      $result.deleted = deleted;
    }
    return $result;
  }
  DeletePostResponse._() : super();
  factory DeletePostResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeletePostResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeletePostResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'post'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'deleted')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeletePostResponse clone() => DeletePostResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeletePostResponse copyWith(void Function(DeletePostResponse) updates) => super.copyWith((message) => updates(message as DeletePostResponse)) as DeletePostResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeletePostResponse create() => DeletePostResponse._();
  DeletePostResponse createEmptyInstance() => create();
  static $pb.PbList<DeletePostResponse> createRepeated() => $pb.PbList<DeletePostResponse>();
  @$core.pragma('dart2js:noInline')
  static DeletePostResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeletePostResponse>(create);
  static DeletePostResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get deleted => $_getBF(0);
  @$pb.TagNumber(1)
  set deleted($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeleted() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeleted() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
