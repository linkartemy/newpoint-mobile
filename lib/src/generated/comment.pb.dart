//
//  Generated code. Do not modify.
//  source: comment.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $5;

class CommentModel extends $pb.GeneratedMessage {
  factory CommentModel() => create();
  CommentModel._() : super();
  factory CommentModel.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CommentModel.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CommentModel',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'comment'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aInt64(2, _omitFieldNames ? '' : 'userId')
    ..aInt64(3, _omitFieldNames ? '' : 'postId')
    ..aOS(4, _omitFieldNames ? '' : 'login')
    ..aOS(5, _omitFieldNames ? '' : 'name')
    ..aOS(6, _omitFieldNames ? '' : 'surname')
    ..aOS(7, _omitFieldNames ? '' : 'content')
    ..a<$core.int>(8, _omitFieldNames ? '' : 'likes', $pb.PbFieldType.O3)
    ..aOB(9, _omitFieldNames ? '' : 'liked')
    ..aOM<$5.Timestamp>(10, _omitFieldNames ? '' : 'creationTimestamp',
        subBuilder: $5.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CommentModel clone() => CommentModel()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CommentModel copyWith(void Function(CommentModel) updates) =>
      super.copyWith((message) => updates(message as CommentModel))
          as CommentModel;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CommentModel create() => CommentModel._();
  CommentModel createEmptyInstance() => create();
  static $pb.PbList<CommentModel> createRepeated() =>
      $pb.PbList<CommentModel>();
  @$core.pragma('dart2js:noInline')
  static CommentModel getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CommentModel>(create);
  static CommentModel? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get userId => $_getI64(1);
  @$pb.TagNumber(2)
  set userId($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get postId => $_getI64(2);
  @$pb.TagNumber(3)
  set postId($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPostId() => $_has(2);
  @$pb.TagNumber(3)
  void clearPostId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get login => $_getSZ(3);
  @$pb.TagNumber(4)
  set login($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLogin() => $_has(3);
  @$pb.TagNumber(4)
  void clearLogin() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get name => $_getSZ(4);
  @$pb.TagNumber(5)
  set name($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasName() => $_has(4);
  @$pb.TagNumber(5)
  void clearName() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get surname => $_getSZ(5);
  @$pb.TagNumber(6)
  set surname($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasSurname() => $_has(5);
  @$pb.TagNumber(6)
  void clearSurname() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get content => $_getSZ(6);
  @$pb.TagNumber(7)
  set content($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasContent() => $_has(6);
  @$pb.TagNumber(7)
  void clearContent() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get likes => $_getIZ(7);
  @$pb.TagNumber(8)
  set likes($core.int v) {
    $_setSignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasLikes() => $_has(7);
  @$pb.TagNumber(8)
  void clearLikes() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get liked => $_getBF(8);
  @$pb.TagNumber(9)
  set liked($core.bool v) {
    $_setBool(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasLiked() => $_has(8);
  @$pb.TagNumber(9)
  void clearLiked() => clearField(9);

  @$pb.TagNumber(10)
  $5.Timestamp get creationTimestamp => $_getN(9);
  @$pb.TagNumber(10)
  set creationTimestamp($5.Timestamp v) {
    setField(10, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasCreationTimestamp() => $_has(9);
  @$pb.TagNumber(10)
  void clearCreationTimestamp() => clearField(10);
  @$pb.TagNumber(10)
  $5.Timestamp ensureCreationTimestamp() => $_ensure(9);
}

class GetCommentsByPostIdRequest extends $pb.GeneratedMessage {
  factory GetCommentsByPostIdRequest() => create();
  GetCommentsByPostIdRequest._() : super();
  factory GetCommentsByPostIdRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetCommentsByPostIdRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetCommentsByPostIdRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'comment'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'postId')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetCommentsByPostIdRequest clone() =>
      GetCommentsByPostIdRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetCommentsByPostIdRequest copyWith(
          void Function(GetCommentsByPostIdRequest) updates) =>
      super.copyWith(
              (message) => updates(message as GetCommentsByPostIdRequest))
          as GetCommentsByPostIdRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCommentsByPostIdRequest create() => GetCommentsByPostIdRequest._();
  GetCommentsByPostIdRequest createEmptyInstance() => create();
  static $pb.PbList<GetCommentsByPostIdRequest> createRepeated() =>
      $pb.PbList<GetCommentsByPostIdRequest>();
  @$core.pragma('dart2js:noInline')
  static GetCommentsByPostIdRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetCommentsByPostIdRequest>(create);
  static GetCommentsByPostIdRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get postId => $_getI64(0);
  @$pb.TagNumber(1)
  set postId($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPostId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPostId() => clearField(1);
}

class GetCommentsByPostIdResponse extends $pb.GeneratedMessage {
  factory GetCommentsByPostIdResponse() => create();
  GetCommentsByPostIdResponse._() : super();
  factory GetCommentsByPostIdResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetCommentsByPostIdResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetCommentsByPostIdResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'comment'),
      createEmptyInstance: create)
    ..pc<CommentModel>(1, _omitFieldNames ? '' : 'comments', $pb.PbFieldType.PM,
        subBuilder: CommentModel.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetCommentsByPostIdResponse clone() =>
      GetCommentsByPostIdResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetCommentsByPostIdResponse copyWith(
          void Function(GetCommentsByPostIdResponse) updates) =>
      super.copyWith(
              (message) => updates(message as GetCommentsByPostIdResponse))
          as GetCommentsByPostIdResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCommentsByPostIdResponse create() =>
      GetCommentsByPostIdResponse._();
  GetCommentsByPostIdResponse createEmptyInstance() => create();
  static $pb.PbList<GetCommentsByPostIdResponse> createRepeated() =>
      $pb.PbList<GetCommentsByPostIdResponse>();
  @$core.pragma('dart2js:noInline')
  static GetCommentsByPostIdResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetCommentsByPostIdResponse>(create);
  static GetCommentsByPostIdResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<CommentModel> get comments => $_getList(0);
}

class AddCommentRequest extends $pb.GeneratedMessage {
  factory AddCommentRequest() => create();
  AddCommentRequest._() : super();
  factory AddCommentRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AddCommentRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddCommentRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'comment'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'postId')
    ..aOS(2, _omitFieldNames ? '' : 'content')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AddCommentRequest clone() => AddCommentRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AddCommentRequest copyWith(void Function(AddCommentRequest) updates) =>
      super.copyWith((message) => updates(message as AddCommentRequest))
          as AddCommentRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddCommentRequest create() => AddCommentRequest._();
  AddCommentRequest createEmptyInstance() => create();
  static $pb.PbList<AddCommentRequest> createRepeated() =>
      $pb.PbList<AddCommentRequest>();
  @$core.pragma('dart2js:noInline')
  static AddCommentRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddCommentRequest>(create);
  static AddCommentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get postId => $_getI64(0);
  @$pb.TagNumber(1)
  set postId($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPostId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPostId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get content => $_getSZ(1);
  @$pb.TagNumber(2)
  set content($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => clearField(2);
}

class AddCommentResponse extends $pb.GeneratedMessage {
  factory AddCommentResponse() => create();
  AddCommentResponse._() : super();
  factory AddCommentResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AddCommentResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddCommentResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'comment'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'added')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AddCommentResponse clone() => AddCommentResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AddCommentResponse copyWith(void Function(AddCommentResponse) updates) =>
      super.copyWith((message) => updates(message as AddCommentResponse))
          as AddCommentResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddCommentResponse create() => AddCommentResponse._();
  AddCommentResponse createEmptyInstance() => create();
  static $pb.PbList<AddCommentResponse> createRepeated() =>
      $pb.PbList<AddCommentResponse>();
  @$core.pragma('dart2js:noInline')
  static AddCommentResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddCommentResponse>(create);
  static AddCommentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get added => $_getBF(0);
  @$pb.TagNumber(1)
  set added($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAdded() => $_has(0);
  @$pb.TagNumber(1)
  void clearAdded() => clearField(1);
}

class LikeCommentRequest extends $pb.GeneratedMessage {
  factory LikeCommentRequest() => create();
  LikeCommentRequest._() : super();
  factory LikeCommentRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LikeCommentRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LikeCommentRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'comment'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'commentId')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LikeCommentRequest clone() => LikeCommentRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LikeCommentRequest copyWith(void Function(LikeCommentRequest) updates) =>
      super.copyWith((message) => updates(message as LikeCommentRequest))
          as LikeCommentRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LikeCommentRequest create() => LikeCommentRequest._();
  LikeCommentRequest createEmptyInstance() => create();
  static $pb.PbList<LikeCommentRequest> createRepeated() =>
      $pb.PbList<LikeCommentRequest>();
  @$core.pragma('dart2js:noInline')
  static LikeCommentRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LikeCommentRequest>(create);
  static LikeCommentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get commentId => $_getI64(0);
  @$pb.TagNumber(1)
  set commentId($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCommentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommentId() => clearField(1);
}

class LikeCommentResponse extends $pb.GeneratedMessage {
  factory LikeCommentResponse() => create();
  LikeCommentResponse._() : super();
  factory LikeCommentResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LikeCommentResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LikeCommentResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'comment'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'liked')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LikeCommentResponse clone() => LikeCommentResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LikeCommentResponse copyWith(void Function(LikeCommentResponse) updates) =>
      super.copyWith((message) => updates(message as LikeCommentResponse))
          as LikeCommentResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LikeCommentResponse create() => LikeCommentResponse._();
  LikeCommentResponse createEmptyInstance() => create();
  static $pb.PbList<LikeCommentResponse> createRepeated() =>
      $pb.PbList<LikeCommentResponse>();
  @$core.pragma('dart2js:noInline')
  static LikeCommentResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LikeCommentResponse>(create);
  static LikeCommentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get liked => $_getBF(0);
  @$pb.TagNumber(1)
  set liked($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLiked() => $_has(0);
  @$pb.TagNumber(1)
  void clearLiked() => clearField(1);
}

class UnLikeCommentRequest extends $pb.GeneratedMessage {
  factory UnLikeCommentRequest() => create();
  UnLikeCommentRequest._() : super();
  factory UnLikeCommentRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UnLikeCommentRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UnLikeCommentRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'comment'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'commentId')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UnLikeCommentRequest clone() =>
      UnLikeCommentRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UnLikeCommentRequest copyWith(void Function(UnLikeCommentRequest) updates) =>
      super.copyWith((message) => updates(message as UnLikeCommentRequest))
          as UnLikeCommentRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UnLikeCommentRequest create() => UnLikeCommentRequest._();
  UnLikeCommentRequest createEmptyInstance() => create();
  static $pb.PbList<UnLikeCommentRequest> createRepeated() =>
      $pb.PbList<UnLikeCommentRequest>();
  @$core.pragma('dart2js:noInline')
  static UnLikeCommentRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnLikeCommentRequest>(create);
  static UnLikeCommentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get commentId => $_getI64(0);
  @$pb.TagNumber(1)
  set commentId($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCommentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommentId() => clearField(1);
}

class UnLikeCommentResponse extends $pb.GeneratedMessage {
  factory UnLikeCommentResponse() => create();
  UnLikeCommentResponse._() : super();
  factory UnLikeCommentResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UnLikeCommentResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UnLikeCommentResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'comment'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'liked')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UnLikeCommentResponse clone() =>
      UnLikeCommentResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UnLikeCommentResponse copyWith(
          void Function(UnLikeCommentResponse) updates) =>
      super.copyWith((message) => updates(message as UnLikeCommentResponse))
          as UnLikeCommentResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UnLikeCommentResponse create() => UnLikeCommentResponse._();
  UnLikeCommentResponse createEmptyInstance() => create();
  static $pb.PbList<UnLikeCommentResponse> createRepeated() =>
      $pb.PbList<UnLikeCommentResponse>();
  @$core.pragma('dart2js:noInline')
  static UnLikeCommentResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnLikeCommentResponse>(create);
  static UnLikeCommentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get liked => $_getBF(0);
  @$pb.TagNumber(1)
  set liked($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLiked() => $_has(0);
  @$pb.TagNumber(1)
  void clearLiked() => clearField(1);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
