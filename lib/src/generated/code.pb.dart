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

import 'nullable.pb.dart' as $9;

class AddEmailVerificationCodeRequest extends $pb.GeneratedMessage {
  factory AddEmailVerificationCodeRequest({
    $core.String? email,
  }) {
    final $result = create();
    if (email != null) {
      $result.email = email;
    }
    return $result;
  }
  AddEmailVerificationCodeRequest._() : super();
  factory AddEmailVerificationCodeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddEmailVerificationCodeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddEmailVerificationCodeRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'code'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'email')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddEmailVerificationCodeRequest clone() => AddEmailVerificationCodeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddEmailVerificationCodeRequest copyWith(void Function(AddEmailVerificationCodeRequest) updates) => super.copyWith((message) => updates(message as AddEmailVerificationCodeRequest)) as AddEmailVerificationCodeRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddEmailVerificationCodeRequest create() => AddEmailVerificationCodeRequest._();
  AddEmailVerificationCodeRequest createEmptyInstance() => create();
  static $pb.PbList<AddEmailVerificationCodeRequest> createRepeated() => $pb.PbList<AddEmailVerificationCodeRequest>();
  @$core.pragma('dart2js:noInline')
  static AddEmailVerificationCodeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddEmailVerificationCodeRequest>(create);
  static AddEmailVerificationCodeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);
}

class AddEmailVerificationCodeResponse extends $pb.GeneratedMessage {
  factory AddEmailVerificationCodeResponse({
    $core.bool? sent,
  }) {
    final $result = create();
    if (sent != null) {
      $result.sent = sent;
    }
    return $result;
  }
  AddEmailVerificationCodeResponse._() : super();
  factory AddEmailVerificationCodeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddEmailVerificationCodeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddEmailVerificationCodeResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'code'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'sent')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddEmailVerificationCodeResponse clone() => AddEmailVerificationCodeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddEmailVerificationCodeResponse copyWith(void Function(AddEmailVerificationCodeResponse) updates) => super.copyWith((message) => updates(message as AddEmailVerificationCodeResponse)) as AddEmailVerificationCodeResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddEmailVerificationCodeResponse create() => AddEmailVerificationCodeResponse._();
  AddEmailVerificationCodeResponse createEmptyInstance() => create();
  static $pb.PbList<AddEmailVerificationCodeResponse> createRepeated() => $pb.PbList<AddEmailVerificationCodeResponse>();
  @$core.pragma('dart2js:noInline')
  static AddEmailVerificationCodeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddEmailVerificationCodeResponse>(create);
  static AddEmailVerificationCodeResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get sent => $_getBF(0);
  @$pb.TagNumber(1)
  set sent($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSent() => $_has(0);
  @$pb.TagNumber(1)
  void clearSent() => clearField(1);
}

class VerifyEmailVerificationCodeRequest extends $pb.GeneratedMessage {
  factory VerifyEmailVerificationCodeRequest({
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
  VerifyEmailVerificationCodeRequest._() : super();
  factory VerifyEmailVerificationCodeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VerifyEmailVerificationCodeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'VerifyEmailVerificationCodeRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'code'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'email')
    ..aOS(2, _omitFieldNames ? '' : 'code')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VerifyEmailVerificationCodeRequest clone() => VerifyEmailVerificationCodeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VerifyEmailVerificationCodeRequest copyWith(void Function(VerifyEmailVerificationCodeRequest) updates) => super.copyWith((message) => updates(message as VerifyEmailVerificationCodeRequest)) as VerifyEmailVerificationCodeRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VerifyEmailVerificationCodeRequest create() => VerifyEmailVerificationCodeRequest._();
  VerifyEmailVerificationCodeRequest createEmptyInstance() => create();
  static $pb.PbList<VerifyEmailVerificationCodeRequest> createRepeated() => $pb.PbList<VerifyEmailVerificationCodeRequest>();
  @$core.pragma('dart2js:noInline')
  static VerifyEmailVerificationCodeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VerifyEmailVerificationCodeRequest>(create);
  static VerifyEmailVerificationCodeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get code => $_getSZ(1);
  @$pb.TagNumber(2)
  set code($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => clearField(2);
}

class VerifyEmailVerificationCodeResponse extends $pb.GeneratedMessage {
  factory VerifyEmailVerificationCodeResponse({
    $core.bool? verified,
  }) {
    final $result = create();
    if (verified != null) {
      $result.verified = verified;
    }
    return $result;
  }
  VerifyEmailVerificationCodeResponse._() : super();
  factory VerifyEmailVerificationCodeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VerifyEmailVerificationCodeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'VerifyEmailVerificationCodeResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'code'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'verified')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VerifyEmailVerificationCodeResponse clone() => VerifyEmailVerificationCodeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VerifyEmailVerificationCodeResponse copyWith(void Function(VerifyEmailVerificationCodeResponse) updates) => super.copyWith((message) => updates(message as VerifyEmailVerificationCodeResponse)) as VerifyEmailVerificationCodeResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VerifyEmailVerificationCodeResponse create() => VerifyEmailVerificationCodeResponse._();
  VerifyEmailVerificationCodeResponse createEmptyInstance() => create();
  static $pb.PbList<VerifyEmailVerificationCodeResponse> createRepeated() => $pb.PbList<VerifyEmailVerificationCodeResponse>();
  @$core.pragma('dart2js:noInline')
  static VerifyEmailVerificationCodeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VerifyEmailVerificationCodeResponse>(create);
  static VerifyEmailVerificationCodeResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get verified => $_getBF(0);
  @$pb.TagNumber(1)
  set verified($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasVerified() => $_has(0);
  @$pb.TagNumber(1)
  void clearVerified() => clearField(1);
}

class AddPhoneVerificationCodeRequest extends $pb.GeneratedMessage {
  factory AddPhoneVerificationCodeRequest({
    $core.String? phone,
  }) {
    final $result = create();
    if (phone != null) {
      $result.phone = phone;
    }
    return $result;
  }
  AddPhoneVerificationCodeRequest._() : super();
  factory AddPhoneVerificationCodeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddPhoneVerificationCodeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddPhoneVerificationCodeRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'code'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'phone')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddPhoneVerificationCodeRequest clone() => AddPhoneVerificationCodeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddPhoneVerificationCodeRequest copyWith(void Function(AddPhoneVerificationCodeRequest) updates) => super.copyWith((message) => updates(message as AddPhoneVerificationCodeRequest)) as AddPhoneVerificationCodeRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddPhoneVerificationCodeRequest create() => AddPhoneVerificationCodeRequest._();
  AddPhoneVerificationCodeRequest createEmptyInstance() => create();
  static $pb.PbList<AddPhoneVerificationCodeRequest> createRepeated() => $pb.PbList<AddPhoneVerificationCodeRequest>();
  @$core.pragma('dart2js:noInline')
  static AddPhoneVerificationCodeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddPhoneVerificationCodeRequest>(create);
  static AddPhoneVerificationCodeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get phone => $_getSZ(0);
  @$pb.TagNumber(1)
  set phone($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPhone() => $_has(0);
  @$pb.TagNumber(1)
  void clearPhone() => clearField(1);
}

class AddPhoneVerificationCodeResponse extends $pb.GeneratedMessage {
  factory AddPhoneVerificationCodeResponse({
    $core.bool? sent,
  }) {
    final $result = create();
    if (sent != null) {
      $result.sent = sent;
    }
    return $result;
  }
  AddPhoneVerificationCodeResponse._() : super();
  factory AddPhoneVerificationCodeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddPhoneVerificationCodeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddPhoneVerificationCodeResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'code'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'sent')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddPhoneVerificationCodeResponse clone() => AddPhoneVerificationCodeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddPhoneVerificationCodeResponse copyWith(void Function(AddPhoneVerificationCodeResponse) updates) => super.copyWith((message) => updates(message as AddPhoneVerificationCodeResponse)) as AddPhoneVerificationCodeResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddPhoneVerificationCodeResponse create() => AddPhoneVerificationCodeResponse._();
  AddPhoneVerificationCodeResponse createEmptyInstance() => create();
  static $pb.PbList<AddPhoneVerificationCodeResponse> createRepeated() => $pb.PbList<AddPhoneVerificationCodeResponse>();
  @$core.pragma('dart2js:noInline')
  static AddPhoneVerificationCodeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddPhoneVerificationCodeResponse>(create);
  static AddPhoneVerificationCodeResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get sent => $_getBF(0);
  @$pb.TagNumber(1)
  set sent($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSent() => $_has(0);
  @$pb.TagNumber(1)
  void clearSent() => clearField(1);
}

class VerifyPhoneVerificationCodeRequest extends $pb.GeneratedMessage {
  factory VerifyPhoneVerificationCodeRequest({
    $core.String? phone,
    $core.String? code,
  }) {
    final $result = create();
    if (phone != null) {
      $result.phone = phone;
    }
    if (code != null) {
      $result.code = code;
    }
    return $result;
  }
  VerifyPhoneVerificationCodeRequest._() : super();
  factory VerifyPhoneVerificationCodeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VerifyPhoneVerificationCodeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'VerifyPhoneVerificationCodeRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'code'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'phone')
    ..aOS(2, _omitFieldNames ? '' : 'code')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VerifyPhoneVerificationCodeRequest clone() => VerifyPhoneVerificationCodeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VerifyPhoneVerificationCodeRequest copyWith(void Function(VerifyPhoneVerificationCodeRequest) updates) => super.copyWith((message) => updates(message as VerifyPhoneVerificationCodeRequest)) as VerifyPhoneVerificationCodeRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VerifyPhoneVerificationCodeRequest create() => VerifyPhoneVerificationCodeRequest._();
  VerifyPhoneVerificationCodeRequest createEmptyInstance() => create();
  static $pb.PbList<VerifyPhoneVerificationCodeRequest> createRepeated() => $pb.PbList<VerifyPhoneVerificationCodeRequest>();
  @$core.pragma('dart2js:noInline')
  static VerifyPhoneVerificationCodeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VerifyPhoneVerificationCodeRequest>(create);
  static VerifyPhoneVerificationCodeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get phone => $_getSZ(0);
  @$pb.TagNumber(1)
  set phone($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPhone() => $_has(0);
  @$pb.TagNumber(1)
  void clearPhone() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get code => $_getSZ(1);
  @$pb.TagNumber(2)
  set code($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => clearField(2);
}

class VerifyPhoneVerificationCodeResponse extends $pb.GeneratedMessage {
  factory VerifyPhoneVerificationCodeResponse({
    $core.bool? verified,
  }) {
    final $result = create();
    if (verified != null) {
      $result.verified = verified;
    }
    return $result;
  }
  VerifyPhoneVerificationCodeResponse._() : super();
  factory VerifyPhoneVerificationCodeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VerifyPhoneVerificationCodeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'VerifyPhoneVerificationCodeResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'code'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'verified')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VerifyPhoneVerificationCodeResponse clone() => VerifyPhoneVerificationCodeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VerifyPhoneVerificationCodeResponse copyWith(void Function(VerifyPhoneVerificationCodeResponse) updates) => super.copyWith((message) => updates(message as VerifyPhoneVerificationCodeResponse)) as VerifyPhoneVerificationCodeResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VerifyPhoneVerificationCodeResponse create() => VerifyPhoneVerificationCodeResponse._();
  VerifyPhoneVerificationCodeResponse createEmptyInstance() => create();
  static $pb.PbList<VerifyPhoneVerificationCodeResponse> createRepeated() => $pb.PbList<VerifyPhoneVerificationCodeResponse>();
  @$core.pragma('dart2js:noInline')
  static VerifyPhoneVerificationCodeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VerifyPhoneVerificationCodeResponse>(create);
  static VerifyPhoneVerificationCodeResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get verified => $_getBF(0);
  @$pb.TagNumber(1)
  set verified($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasVerified() => $_has(0);
  @$pb.TagNumber(1)
  void clearVerified() => clearField(1);
}

class AddPasswordChangeVerificationCodeRequest extends $pb.GeneratedMessage {
  factory AddPasswordChangeVerificationCodeRequest({
    $9.NullableString? email,
    $9.NullableString? phone,
  }) {
    final $result = create();
    if (email != null) {
      $result.email = email;
    }
    if (phone != null) {
      $result.phone = phone;
    }
    return $result;
  }
  AddPasswordChangeVerificationCodeRequest._() : super();
  factory AddPasswordChangeVerificationCodeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddPasswordChangeVerificationCodeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddPasswordChangeVerificationCodeRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'code'), createEmptyInstance: create)
    ..aOM<$9.NullableString>(1, _omitFieldNames ? '' : 'email', subBuilder: $9.NullableString.create)
    ..aOM<$9.NullableString>(2, _omitFieldNames ? '' : 'phone', subBuilder: $9.NullableString.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddPasswordChangeVerificationCodeRequest clone() => AddPasswordChangeVerificationCodeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddPasswordChangeVerificationCodeRequest copyWith(void Function(AddPasswordChangeVerificationCodeRequest) updates) => super.copyWith((message) => updates(message as AddPasswordChangeVerificationCodeRequest)) as AddPasswordChangeVerificationCodeRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddPasswordChangeVerificationCodeRequest create() => AddPasswordChangeVerificationCodeRequest._();
  AddPasswordChangeVerificationCodeRequest createEmptyInstance() => create();
  static $pb.PbList<AddPasswordChangeVerificationCodeRequest> createRepeated() => $pb.PbList<AddPasswordChangeVerificationCodeRequest>();
  @$core.pragma('dart2js:noInline')
  static AddPasswordChangeVerificationCodeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddPasswordChangeVerificationCodeRequest>(create);
  static AddPasswordChangeVerificationCodeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $9.NullableString get email => $_getN(0);
  @$pb.TagNumber(1)
  set email($9.NullableString v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);
  @$pb.TagNumber(1)
  $9.NullableString ensureEmail() => $_ensure(0);

  @$pb.TagNumber(2)
  $9.NullableString get phone => $_getN(1);
  @$pb.TagNumber(2)
  set phone($9.NullableString v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPhone() => $_has(1);
  @$pb.TagNumber(2)
  void clearPhone() => clearField(2);
  @$pb.TagNumber(2)
  $9.NullableString ensurePhone() => $_ensure(1);
}

class AddPasswordChangeVerificationCodeResponse extends $pb.GeneratedMessage {
  factory AddPasswordChangeVerificationCodeResponse({
    $core.bool? sent,
  }) {
    final $result = create();
    if (sent != null) {
      $result.sent = sent;
    }
    return $result;
  }
  AddPasswordChangeVerificationCodeResponse._() : super();
  factory AddPasswordChangeVerificationCodeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddPasswordChangeVerificationCodeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddPasswordChangeVerificationCodeResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'code'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'sent')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddPasswordChangeVerificationCodeResponse clone() => AddPasswordChangeVerificationCodeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddPasswordChangeVerificationCodeResponse copyWith(void Function(AddPasswordChangeVerificationCodeResponse) updates) => super.copyWith((message) => updates(message as AddPasswordChangeVerificationCodeResponse)) as AddPasswordChangeVerificationCodeResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddPasswordChangeVerificationCodeResponse create() => AddPasswordChangeVerificationCodeResponse._();
  AddPasswordChangeVerificationCodeResponse createEmptyInstance() => create();
  static $pb.PbList<AddPasswordChangeVerificationCodeResponse> createRepeated() => $pb.PbList<AddPasswordChangeVerificationCodeResponse>();
  @$core.pragma('dart2js:noInline')
  static AddPasswordChangeVerificationCodeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddPasswordChangeVerificationCodeResponse>(create);
  static AddPasswordChangeVerificationCodeResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get sent => $_getBF(0);
  @$pb.TagNumber(1)
  set sent($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSent() => $_has(0);
  @$pb.TagNumber(1)
  void clearSent() => clearField(1);
}

class VerifyPasswordChangeVerificationCodeRequest extends $pb.GeneratedMessage {
  factory VerifyPasswordChangeVerificationCodeRequest({
    $9.NullableString? email,
    $9.NullableString? phone,
    $core.String? code,
  }) {
    final $result = create();
    if (email != null) {
      $result.email = email;
    }
    if (phone != null) {
      $result.phone = phone;
    }
    if (code != null) {
      $result.code = code;
    }
    return $result;
  }
  VerifyPasswordChangeVerificationCodeRequest._() : super();
  factory VerifyPasswordChangeVerificationCodeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VerifyPasswordChangeVerificationCodeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'VerifyPasswordChangeVerificationCodeRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'code'), createEmptyInstance: create)
    ..aOM<$9.NullableString>(1, _omitFieldNames ? '' : 'email', subBuilder: $9.NullableString.create)
    ..aOM<$9.NullableString>(2, _omitFieldNames ? '' : 'phone', subBuilder: $9.NullableString.create)
    ..aOS(3, _omitFieldNames ? '' : 'code')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VerifyPasswordChangeVerificationCodeRequest clone() => VerifyPasswordChangeVerificationCodeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VerifyPasswordChangeVerificationCodeRequest copyWith(void Function(VerifyPasswordChangeVerificationCodeRequest) updates) => super.copyWith((message) => updates(message as VerifyPasswordChangeVerificationCodeRequest)) as VerifyPasswordChangeVerificationCodeRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VerifyPasswordChangeVerificationCodeRequest create() => VerifyPasswordChangeVerificationCodeRequest._();
  VerifyPasswordChangeVerificationCodeRequest createEmptyInstance() => create();
  static $pb.PbList<VerifyPasswordChangeVerificationCodeRequest> createRepeated() => $pb.PbList<VerifyPasswordChangeVerificationCodeRequest>();
  @$core.pragma('dart2js:noInline')
  static VerifyPasswordChangeVerificationCodeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VerifyPasswordChangeVerificationCodeRequest>(create);
  static VerifyPasswordChangeVerificationCodeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $9.NullableString get email => $_getN(0);
  @$pb.TagNumber(1)
  set email($9.NullableString v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);
  @$pb.TagNumber(1)
  $9.NullableString ensureEmail() => $_ensure(0);

  @$pb.TagNumber(2)
  $9.NullableString get phone => $_getN(1);
  @$pb.TagNumber(2)
  set phone($9.NullableString v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPhone() => $_has(1);
  @$pb.TagNumber(2)
  void clearPhone() => clearField(2);
  @$pb.TagNumber(2)
  $9.NullableString ensurePhone() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get code => $_getSZ(2);
  @$pb.TagNumber(3)
  set code($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCode() => $_has(2);
  @$pb.TagNumber(3)
  void clearCode() => clearField(3);
}

class VerifyPasswordChangeVerificationCodeResponse extends $pb.GeneratedMessage {
  factory VerifyPasswordChangeVerificationCodeResponse({
    $core.bool? verified,
  }) {
    final $result = create();
    if (verified != null) {
      $result.verified = verified;
    }
    return $result;
  }
  VerifyPasswordChangeVerificationCodeResponse._() : super();
  factory VerifyPasswordChangeVerificationCodeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VerifyPasswordChangeVerificationCodeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'VerifyPasswordChangeVerificationCodeResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'code'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'verified')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VerifyPasswordChangeVerificationCodeResponse clone() => VerifyPasswordChangeVerificationCodeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VerifyPasswordChangeVerificationCodeResponse copyWith(void Function(VerifyPasswordChangeVerificationCodeResponse) updates) => super.copyWith((message) => updates(message as VerifyPasswordChangeVerificationCodeResponse)) as VerifyPasswordChangeVerificationCodeResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VerifyPasswordChangeVerificationCodeResponse create() => VerifyPasswordChangeVerificationCodeResponse._();
  VerifyPasswordChangeVerificationCodeResponse createEmptyInstance() => create();
  static $pb.PbList<VerifyPasswordChangeVerificationCodeResponse> createRepeated() => $pb.PbList<VerifyPasswordChangeVerificationCodeResponse>();
  @$core.pragma('dart2js:noInline')
  static VerifyPasswordChangeVerificationCodeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VerifyPasswordChangeVerificationCodeResponse>(create);
  static VerifyPasswordChangeVerificationCodeResponse? _defaultInstance;

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
