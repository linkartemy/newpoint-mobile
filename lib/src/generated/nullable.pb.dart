//
//  Generated code. Do not modify.
//  source: nullable.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/struct.pbenum.dart' as $6;
import 'google/protobuf/timestamp.pb.dart' as $5;

enum NullableString_Kind {
  null_1, 
  data, 
  notSet
}

class NullableString extends $pb.GeneratedMessage {
  factory NullableString() => create();
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
    ..e<$6.NullValue>(1, _omitFieldNames ? '' : 'null', $pb.PbFieldType.OE, defaultOrMaker: $6.NullValue.NULL_VALUE, valueOf: $6.NullValue.valueOf, enumValues: $6.NullValue.values)
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
  $6.NullValue get null_1 => $_getN(0);
  @$pb.TagNumber(1)
  set null_1($6.NullValue v) { setField(1, v); }
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
  factory NullableTimestamp() => create();
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
    ..e<$6.NullValue>(1, _omitFieldNames ? '' : 'null', $pb.PbFieldType.OE, defaultOrMaker: $6.NullValue.NULL_VALUE, valueOf: $6.NullValue.valueOf, enumValues: $6.NullValue.values)
    ..aOM<$5.Timestamp>(2, _omitFieldNames ? '' : 'data', subBuilder: $5.Timestamp.create)
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
  $6.NullValue get null_1 => $_getN(0);
  @$pb.TagNumber(1)
  set null_1($6.NullValue v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasNull_1() => $_has(0);
  @$pb.TagNumber(1)
  void clearNull_1() => clearField(1);

  @$pb.TagNumber(2)
  $5.Timestamp get data => $_getN(1);
  @$pb.TagNumber(2)
  set data($5.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasData() => $_has(1);
  @$pb.TagNumber(2)
  void clearData() => clearField(2);
  @$pb.TagNumber(2)
  $5.Timestamp ensureData() => $_ensure(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
