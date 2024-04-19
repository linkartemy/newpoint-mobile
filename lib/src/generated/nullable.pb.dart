//
//  Generated code. Do not modify.
//  source: nullable.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'article.pb.dart' as $0;
import 'google/protobuf/struct.pbenum.dart' as $12;
import 'google/protobuf/timestamp.pb.dart' as $11;
import 'post.pb.dart' as $3;

enum NullableString_Kind {
  null_1, 
  data, 
  notSet
}

class NullableString extends $pb.GeneratedMessage {
  factory NullableString({
    $12.NullValue? null_1,
    $core.String? data,
  }) {
    final $result = create();
    if (null_1 != null) {
      $result.null_1 = null_1;
    }
    if (data != null) {
      $result.data = data;
    }
    return $result;
  }
  NullableString._() : super();
  factory NullableString.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NullableString.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, NullableString_Kind> _NullableString_KindByTag = {
    1 : NullableString_Kind.null_1,
    2 : NullableString_Kind.data,
    0 : NullableString_Kind.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NullableString', createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..e<$12.NullValue>(1, _omitFieldNames ? '' : 'null', $pb.PbFieldType.OE, defaultOrMaker: $12.NullValue.NULL_VALUE, valueOf: $12.NullValue.valueOf, enumValues: $12.NullValue.values)
    ..aOS(2, _omitFieldNames ? '' : 'data')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NullableString clone() => NullableString()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NullableString copyWith(void Function(NullableString) updates) => super.copyWith((message) => updates(message as NullableString)) as NullableString;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NullableString create() => NullableString._();
  NullableString createEmptyInstance() => create();
  static $pb.PbList<NullableString> createRepeated() => $pb.PbList<NullableString>();
  @$core.pragma('dart2js:noInline')
  static NullableString getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NullableString>(create);
  static NullableString? _defaultInstance;

  NullableString_Kind whichKind() => _NullableString_KindByTag[$_whichOneof(0)]!;
  void clearKind() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $12.NullValue get null_1 => $_getN(0);
  @$pb.TagNumber(1)
  set null_1($12.NullValue v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasNull_1() => $_has(0);
  @$pb.TagNumber(1)
  void clearNull_1() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get data => $_getSZ(1);
  @$pb.TagNumber(2)
  set data($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasData() => $_has(1);
  @$pb.TagNumber(2)
  void clearData() => clearField(2);
}

enum NullableTimestamp_Kind {
  null_1, 
  data, 
  notSet
}

class NullableTimestamp extends $pb.GeneratedMessage {
  factory NullableTimestamp({
    $12.NullValue? null_1,
    $11.Timestamp? data,
  }) {
    final $result = create();
    if (null_1 != null) {
      $result.null_1 = null_1;
    }
    if (data != null) {
      $result.data = data;
    }
    return $result;
  }
  NullableTimestamp._() : super();
  factory NullableTimestamp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NullableTimestamp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, NullableTimestamp_Kind> _NullableTimestamp_KindByTag = {
    1 : NullableTimestamp_Kind.null_1,
    2 : NullableTimestamp_Kind.data,
    0 : NullableTimestamp_Kind.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NullableTimestamp', createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..e<$12.NullValue>(1, _omitFieldNames ? '' : 'null', $pb.PbFieldType.OE, defaultOrMaker: $12.NullValue.NULL_VALUE, valueOf: $12.NullValue.valueOf, enumValues: $12.NullValue.values)
    ..aOM<$11.Timestamp>(2, _omitFieldNames ? '' : 'data', subBuilder: $11.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NullableTimestamp clone() => NullableTimestamp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NullableTimestamp copyWith(void Function(NullableTimestamp) updates) => super.copyWith((message) => updates(message as NullableTimestamp)) as NullableTimestamp;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NullableTimestamp create() => NullableTimestamp._();
  NullableTimestamp createEmptyInstance() => create();
  static $pb.PbList<NullableTimestamp> createRepeated() => $pb.PbList<NullableTimestamp>();
  @$core.pragma('dart2js:noInline')
  static NullableTimestamp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NullableTimestamp>(create);
  static NullableTimestamp? _defaultInstance;

  NullableTimestamp_Kind whichKind() => _NullableTimestamp_KindByTag[$_whichOneof(0)]!;
  void clearKind() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $12.NullValue get null_1 => $_getN(0);
  @$pb.TagNumber(1)
  set null_1($12.NullValue v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasNull_1() => $_has(0);
  @$pb.TagNumber(1)
  void clearNull_1() => clearField(1);

  @$pb.TagNumber(2)
  $11.Timestamp get data => $_getN(1);
  @$pb.TagNumber(2)
  set data($11.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasData() => $_has(1);
  @$pb.TagNumber(2)
  void clearData() => clearField(2);
  @$pb.TagNumber(2)
  $11.Timestamp ensureData() => $_ensure(1);
}

enum NullableArticle_Kind {
  null_1, 
  data, 
  notSet
}

class NullableArticle extends $pb.GeneratedMessage {
  factory NullableArticle({
    $12.NullValue? null_1,
    $0.ArticleModel? data,
  }) {
    final $result = create();
    if (null_1 != null) {
      $result.null_1 = null_1;
    }
    if (data != null) {
      $result.data = data;
    }
    return $result;
  }
  NullableArticle._() : super();
  factory NullableArticle.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NullableArticle.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, NullableArticle_Kind> _NullableArticle_KindByTag = {
    1 : NullableArticle_Kind.null_1,
    2 : NullableArticle_Kind.data,
    0 : NullableArticle_Kind.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NullableArticle', createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..e<$12.NullValue>(1, _omitFieldNames ? '' : 'null', $pb.PbFieldType.OE, defaultOrMaker: $12.NullValue.NULL_VALUE, valueOf: $12.NullValue.valueOf, enumValues: $12.NullValue.values)
    ..aOM<$0.ArticleModel>(2, _omitFieldNames ? '' : 'data', subBuilder: $0.ArticleModel.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NullableArticle clone() => NullableArticle()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NullableArticle copyWith(void Function(NullableArticle) updates) => super.copyWith((message) => updates(message as NullableArticle)) as NullableArticle;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NullableArticle create() => NullableArticle._();
  NullableArticle createEmptyInstance() => create();
  static $pb.PbList<NullableArticle> createRepeated() => $pb.PbList<NullableArticle>();
  @$core.pragma('dart2js:noInline')
  static NullableArticle getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NullableArticle>(create);
  static NullableArticle? _defaultInstance;

  NullableArticle_Kind whichKind() => _NullableArticle_KindByTag[$_whichOneof(0)]!;
  void clearKind() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $12.NullValue get null_1 => $_getN(0);
  @$pb.TagNumber(1)
  set null_1($12.NullValue v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasNull_1() => $_has(0);
  @$pb.TagNumber(1)
  void clearNull_1() => clearField(1);

  @$pb.TagNumber(2)
  $0.ArticleModel get data => $_getN(1);
  @$pb.TagNumber(2)
  set data($0.ArticleModel v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasData() => $_has(1);
  @$pb.TagNumber(2)
  void clearData() => clearField(2);
  @$pb.TagNumber(2)
  $0.ArticleModel ensureData() => $_ensure(1);
}

enum NullablePost_Kind {
  null_1, 
  data, 
  notSet
}

class NullablePost extends $pb.GeneratedMessage {
  factory NullablePost({
    $12.NullValue? null_1,
    $3.PostModel? data,
  }) {
    final $result = create();
    if (null_1 != null) {
      $result.null_1 = null_1;
    }
    if (data != null) {
      $result.data = data;
    }
    return $result;
  }
  NullablePost._() : super();
  factory NullablePost.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NullablePost.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, NullablePost_Kind> _NullablePost_KindByTag = {
    1 : NullablePost_Kind.null_1,
    2 : NullablePost_Kind.data,
    0 : NullablePost_Kind.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NullablePost', createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..e<$12.NullValue>(1, _omitFieldNames ? '' : 'null', $pb.PbFieldType.OE, defaultOrMaker: $12.NullValue.NULL_VALUE, valueOf: $12.NullValue.valueOf, enumValues: $12.NullValue.values)
    ..aOM<$3.PostModel>(2, _omitFieldNames ? '' : 'data', subBuilder: $3.PostModel.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NullablePost clone() => NullablePost()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NullablePost copyWith(void Function(NullablePost) updates) => super.copyWith((message) => updates(message as NullablePost)) as NullablePost;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NullablePost create() => NullablePost._();
  NullablePost createEmptyInstance() => create();
  static $pb.PbList<NullablePost> createRepeated() => $pb.PbList<NullablePost>();
  @$core.pragma('dart2js:noInline')
  static NullablePost getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NullablePost>(create);
  static NullablePost? _defaultInstance;

  NullablePost_Kind whichKind() => _NullablePost_KindByTag[$_whichOneof(0)]!;
  void clearKind() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $12.NullValue get null_1 => $_getN(0);
  @$pb.TagNumber(1)
  set null_1($12.NullValue v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasNull_1() => $_has(0);
  @$pb.TagNumber(1)
  void clearNull_1() => clearField(1);

  @$pb.TagNumber(2)
  $3.PostModel get data => $_getN(1);
  @$pb.TagNumber(2)
  set data($3.PostModel v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasData() => $_has(1);
  @$pb.TagNumber(2)
  void clearData() => clearField(2);
  @$pb.TagNumber(2)
  $3.PostModel ensureData() => $_ensure(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
