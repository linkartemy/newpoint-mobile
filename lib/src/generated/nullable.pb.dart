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

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/struct.pbenum.dart' as $12;
import 'google/protobuf/timestamp.pb.dart' as $11;

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

enum NullableInt64_Kind {
  null_1, 
  data, 
  notSet
}

class NullableInt64 extends $pb.GeneratedMessage {
  factory NullableInt64({
    $12.NullValue? null_1,
    $fixnum.Int64? data,
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
  NullableInt64._() : super();
  factory NullableInt64.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NullableInt64.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, NullableInt64_Kind> _NullableInt64_KindByTag = {
    1 : NullableInt64_Kind.null_1,
    2 : NullableInt64_Kind.data,
    0 : NullableInt64_Kind.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NullableInt64', createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..e<$12.NullValue>(1, _omitFieldNames ? '' : 'null', $pb.PbFieldType.OE, defaultOrMaker: $12.NullValue.NULL_VALUE, valueOf: $12.NullValue.valueOf, enumValues: $12.NullValue.values)
    ..aInt64(2, _omitFieldNames ? '' : 'data')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NullableInt64 clone() => NullableInt64()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NullableInt64 copyWith(void Function(NullableInt64) updates) => super.copyWith((message) => updates(message as NullableInt64)) as NullableInt64;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NullableInt64 create() => NullableInt64._();
  NullableInt64 createEmptyInstance() => create();
  static $pb.PbList<NullableInt64> createRepeated() => $pb.PbList<NullableInt64>();
  @$core.pragma('dart2js:noInline')
  static NullableInt64 getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NullableInt64>(create);
  static NullableInt64? _defaultInstance;

  NullableInt64_Kind whichKind() => _NullableInt64_KindByTag[$_whichOneof(0)]!;
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
  $fixnum.Int64 get data => $_getI64(1);
  @$pb.TagNumber(2)
  set data($fixnum.Int64 v) { $_setInt64(1, v); }
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


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
