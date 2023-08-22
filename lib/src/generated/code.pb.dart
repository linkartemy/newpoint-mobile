//
//  Generated code. Do not modify.
//  source: code.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class AddEmailCodeRequest extends $pb.GeneratedMessage {
  factory AddEmailCodeRequest({
    $core.String? email,
  }) {
    final $result = create();
    if (email != null) {
      $result.email = email;
    }
    return $result;
  }
  AddEmailCodeRequest._() : super();
  factory AddEmailCodeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddEmailCodeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddEmailCodeRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'user'), createEmptyInstance: create)
    ..aOS(2, _omitFieldNames ? '' : 'email')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddEmailCodeRequest clone() => AddEmailCodeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddEmailCodeRequest copyWith(void Function(AddEmailCodeRequest) updates) => super.copyWith((message) => updates(message as AddEmailCodeRequest)) as AddEmailCodeRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddEmailCodeRequest create() => AddEmailCodeRequest._();
  AddEmailCodeRequest createEmptyInstance() => create();
  static $pb.PbList<AddEmailCodeRequest> createRepeated() => $pb.PbList<AddEmailCodeRequest>();
  @$core.pragma('dart2js:noInline')
  static AddEmailCodeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddEmailCodeRequest>(create);
  static AddEmailCodeRequest? _defaultInstance;

  @$pb.TagNumber(2)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(2)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(2)
  void clearEmail() => clearField(2);
}

class AddEmailCodeResponse extends $pb.GeneratedMessage {
  factory AddEmailCodeResponse({
    $core.bool? sent,
  }) {
    final $result = create();
    if (sent != null) {
      $result.sent = sent;
    }
    return $result;
  }
  AddEmailCodeResponse._() : super();
  factory AddEmailCodeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddEmailCodeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddEmailCodeResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'user'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'sent')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddEmailCodeResponse clone() => AddEmailCodeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddEmailCodeResponse copyWith(void Function(AddEmailCodeResponse) updates) => super.copyWith((message) => updates(message as AddEmailCodeResponse)) as AddEmailCodeResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddEmailCodeResponse create() => AddEmailCodeResponse._();
  AddEmailCodeResponse createEmptyInstance() => create();
  static $pb.PbList<AddEmailCodeResponse> createRepeated() => $pb.PbList<AddEmailCodeResponse>();
  @$core.pragma('dart2js:noInline')
  static AddEmailCodeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddEmailCodeResponse>(create);
  static AddEmailCodeResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get sent => $_getBF(0);
  @$pb.TagNumber(1)
  set sent($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSent() => $_has(0);
  @$pb.TagNumber(1)
  void clearSent() => clearField(1);
}

class VerifyEmailCodeRequest extends $pb.GeneratedMessage {
  factory VerifyEmailCodeRequest({
    $core.String? email,
    $core.String? code,
  }) {
    final $result = create();
    if (email != null) {
      $result.email = email;
    }
    if (code != null) {
      $result.code = code;
    }
    return $result;
  }
  VerifyEmailCodeRequest._() : super();
  factory VerifyEmailCodeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VerifyEmailCodeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'VerifyEmailCodeRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'user'), createEmptyInstance: create)
    ..aOS(2, _omitFieldNames ? '' : 'email')
    ..aOS(3, _omitFieldNames ? '' : 'code')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VerifyEmailCodeRequest clone() => VerifyEmailCodeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VerifyEmailCodeRequest copyWith(void Function(VerifyEmailCodeRequest) updates) => super.copyWith((message) => updates(message as VerifyEmailCodeRequest)) as VerifyEmailCodeRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VerifyEmailCodeRequest create() => VerifyEmailCodeRequest._();
  VerifyEmailCodeRequest createEmptyInstance() => create();
  static $pb.PbList<VerifyEmailCodeRequest> createRepeated() => $pb.PbList<VerifyEmailCodeRequest>();
  @$core.pragma('dart2js:noInline')
  static VerifyEmailCodeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VerifyEmailCodeRequest>(create);
  static VerifyEmailCodeRequest? _defaultInstance;

  @$pb.TagNumber(2)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(2)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(2)
  void clearEmail() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get code => $_getSZ(1);
  @$pb.TagNumber(3)
  set code($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(3)
  void clearCode() => clearField(3);
}

class VerifyEmailCodeResponse extends $pb.GeneratedMessage {
  factory VerifyEmailCodeResponse({
    $core.bool? verified,
  }) {
    final $result = create();
    if (verified != null) {
      $result.verified = verified;
    }
    return $result;
  }
  VerifyEmailCodeResponse._() : super();
  factory VerifyEmailCodeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VerifyEmailCodeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'VerifyEmailCodeResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'user'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'verified')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VerifyEmailCodeResponse clone() => VerifyEmailCodeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VerifyEmailCodeResponse copyWith(void Function(VerifyEmailCodeResponse) updates) => super.copyWith((message) => updates(message as VerifyEmailCodeResponse)) as VerifyEmailCodeResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VerifyEmailCodeResponse create() => VerifyEmailCodeResponse._();
  VerifyEmailCodeResponse createEmptyInstance() => create();
  static $pb.PbList<VerifyEmailCodeResponse> createRepeated() => $pb.PbList<VerifyEmailCodeResponse>();
  @$core.pragma('dart2js:noInline')
  static VerifyEmailCodeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VerifyEmailCodeResponse>(create);
  static VerifyEmailCodeResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get verified => $_getBF(0);
  @$pb.TagNumber(1)
  set verified($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasVerified() => $_has(0);
  @$pb.TagNumber(1)
  void clearVerified() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
