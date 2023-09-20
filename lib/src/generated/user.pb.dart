//
//  Generated code. Do not modify.
//  source: user.proto
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
import 'nullable.pb.dart' as $9;

class UserModel extends $pb.GeneratedMessage {
  factory UserModel({
    $fixnum.Int64? id,
    $core.String? login,
    $core.String? name,
    $core.String? surname,
    $9.NullableString? description,
    $9.NullableString? location,
    $9.NullableString? email,
    $9.NullableString? phone,
    $9.NullableString? profileImage,
    $9.NullableString? headerImage,
    $9.NullableTimestamp? birthDate,
    $9.NullableTimestamp? registrationTimestamp,
    $9.NullableTimestamp? lastLoginTimestamp,
    $9.NullableString? ip,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
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
    if (description != null) {
      $result.description = description;
    }
    if (location != null) {
      $result.location = location;
    }
    if (email != null) {
      $result.email = email;
    }
    if (phone != null) {
      $result.phone = phone;
    }
    if (profileImage != null) {
      $result.profileImage = profileImage;
    }
    if (headerImage != null) {
      $result.headerImage = headerImage;
    }
    if (birthDate != null) {
      $result.birthDate = birthDate;
    }
    if (registrationTimestamp != null) {
      $result.registrationTimestamp = registrationTimestamp;
    }
    if (lastLoginTimestamp != null) {
      $result.lastLoginTimestamp = lastLoginTimestamp;
    }
    if (ip != null) {
      $result.ip = ip;
    }
    return $result;
  }
  UserModel._() : super();
  factory UserModel.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserModel.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserModel', package: const $pb.PackageName(_omitMessageNames ? '' : 'user'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'login')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'surname')
    ..aOM<$9.NullableString>(5, _omitFieldNames ? '' : 'description', subBuilder: $9.NullableString.create)
    ..aOM<$9.NullableString>(6, _omitFieldNames ? '' : 'location', subBuilder: $9.NullableString.create)
    ..aOM<$9.NullableString>(7, _omitFieldNames ? '' : 'email', subBuilder: $9.NullableString.create)
    ..aOM<$9.NullableString>(8, _omitFieldNames ? '' : 'phone', subBuilder: $9.NullableString.create)
    ..aOM<$9.NullableString>(9, _omitFieldNames ? '' : 'profileImage', protoName: 'profileImage', subBuilder: $9.NullableString.create)
    ..aOM<$9.NullableString>(10, _omitFieldNames ? '' : 'headerImage', protoName: 'headerImage', subBuilder: $9.NullableString.create)
    ..aOM<$9.NullableTimestamp>(11, _omitFieldNames ? '' : 'birthDate', subBuilder: $9.NullableTimestamp.create)
    ..aOM<$9.NullableTimestamp>(12, _omitFieldNames ? '' : 'registrationTimestamp', subBuilder: $9.NullableTimestamp.create)
    ..aOM<$9.NullableTimestamp>(13, _omitFieldNames ? '' : 'lastLoginTimestamp', subBuilder: $9.NullableTimestamp.create)
    ..aOM<$9.NullableString>(14, _omitFieldNames ? '' : 'ip', subBuilder: $9.NullableString.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserModel clone() => UserModel()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserModel copyWith(void Function(UserModel) updates) => super.copyWith((message) => updates(message as UserModel)) as UserModel;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserModel create() => UserModel._();
  UserModel createEmptyInstance() => create();
  static $pb.PbList<UserModel> createRepeated() => $pb.PbList<UserModel>();
  @$core.pragma('dart2js:noInline')
  static UserModel getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserModel>(create);
  static UserModel? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get login => $_getSZ(1);
  @$pb.TagNumber(2)
  set login($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLogin() => $_has(1);
  @$pb.TagNumber(2)
  void clearLogin() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get surname => $_getSZ(3);
  @$pb.TagNumber(4)
  set surname($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSurname() => $_has(3);
  @$pb.TagNumber(4)
  void clearSurname() => clearField(4);

  @$pb.TagNumber(5)
  $9.NullableString get description => $_getN(4);
  @$pb.TagNumber(5)
  set description($9.NullableString v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasDescription() => $_has(4);
  @$pb.TagNumber(5)
  void clearDescription() => clearField(5);
  @$pb.TagNumber(5)
  $9.NullableString ensureDescription() => $_ensure(4);

  @$pb.TagNumber(6)
  $9.NullableString get location => $_getN(5);
  @$pb.TagNumber(6)
  set location($9.NullableString v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasLocation() => $_has(5);
  @$pb.TagNumber(6)
  void clearLocation() => clearField(6);
  @$pb.TagNumber(6)
  $9.NullableString ensureLocation() => $_ensure(5);

  @$pb.TagNumber(7)
  $9.NullableString get email => $_getN(6);
  @$pb.TagNumber(7)
  set email($9.NullableString v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasEmail() => $_has(6);
  @$pb.TagNumber(7)
  void clearEmail() => clearField(7);
  @$pb.TagNumber(7)
  $9.NullableString ensureEmail() => $_ensure(6);

  @$pb.TagNumber(8)
  $9.NullableString get phone => $_getN(7);
  @$pb.TagNumber(8)
  set phone($9.NullableString v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasPhone() => $_has(7);
  @$pb.TagNumber(8)
  void clearPhone() => clearField(8);
  @$pb.TagNumber(8)
  $9.NullableString ensurePhone() => $_ensure(7);

  @$pb.TagNumber(9)
  $9.NullableString get profileImage => $_getN(8);
  @$pb.TagNumber(9)
  set profileImage($9.NullableString v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasProfileImage() => $_has(8);
  @$pb.TagNumber(9)
  void clearProfileImage() => clearField(9);
  @$pb.TagNumber(9)
  $9.NullableString ensureProfileImage() => $_ensure(8);

  @$pb.TagNumber(10)
  $9.NullableString get headerImage => $_getN(9);
  @$pb.TagNumber(10)
  set headerImage($9.NullableString v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasHeaderImage() => $_has(9);
  @$pb.TagNumber(10)
  void clearHeaderImage() => clearField(10);
  @$pb.TagNumber(10)
  $9.NullableString ensureHeaderImage() => $_ensure(9);

  @$pb.TagNumber(11)
  $9.NullableTimestamp get birthDate => $_getN(10);
  @$pb.TagNumber(11)
  set birthDate($9.NullableTimestamp v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasBirthDate() => $_has(10);
  @$pb.TagNumber(11)
  void clearBirthDate() => clearField(11);
  @$pb.TagNumber(11)
  $9.NullableTimestamp ensureBirthDate() => $_ensure(10);

  @$pb.TagNumber(12)
  $9.NullableTimestamp get registrationTimestamp => $_getN(11);
  @$pb.TagNumber(12)
  set registrationTimestamp($9.NullableTimestamp v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasRegistrationTimestamp() => $_has(11);
  @$pb.TagNumber(12)
  void clearRegistrationTimestamp() => clearField(12);
  @$pb.TagNumber(12)
  $9.NullableTimestamp ensureRegistrationTimestamp() => $_ensure(11);

  @$pb.TagNumber(13)
  $9.NullableTimestamp get lastLoginTimestamp => $_getN(12);
  @$pb.TagNumber(13)
  set lastLoginTimestamp($9.NullableTimestamp v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasLastLoginTimestamp() => $_has(12);
  @$pb.TagNumber(13)
  void clearLastLoginTimestamp() => clearField(13);
  @$pb.TagNumber(13)
  $9.NullableTimestamp ensureLastLoginTimestamp() => $_ensure(12);

  @$pb.TagNumber(14)
  $9.NullableString get ip => $_getN(13);
  @$pb.TagNumber(14)
  set ip($9.NullableString v) { setField(14, v); }
  @$pb.TagNumber(14)
  $core.bool hasIp() => $_has(13);
  @$pb.TagNumber(14)
  void clearIp() => clearField(14);
  @$pb.TagNumber(14)
  $9.NullableString ensureIp() => $_ensure(13);
}

class LoginRequest extends $pb.GeneratedMessage {
  factory LoginRequest({
    $core.String? login,
    $core.String? password,
  }) {
    final $result = create();
    if (login != null) {
      $result.login = login;
    }
    if (password != null) {
      $result.password = password;
    }
    return $result;
  }
  LoginRequest._() : super();
  factory LoginRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LoginRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'user'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'login')
    ..aOS(2, _omitFieldNames ? '' : 'password')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoginRequest clone() => LoginRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoginRequest copyWith(void Function(LoginRequest) updates) => super.copyWith((message) => updates(message as LoginRequest)) as LoginRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LoginRequest create() => LoginRequest._();
  LoginRequest createEmptyInstance() => create();
  static $pb.PbList<LoginRequest> createRepeated() => $pb.PbList<LoginRequest>();
  @$core.pragma('dart2js:noInline')
  static LoginRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginRequest>(create);
  static LoginRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get login => $_getSZ(0);
  @$pb.TagNumber(1)
  set login($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLogin() => $_has(0);
  @$pb.TagNumber(1)
  void clearLogin() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);
}

class LoginResponse extends $pb.GeneratedMessage {
  factory LoginResponse({
    UserModel? user,
  }) {
    final $result = create();
    if (user != null) {
      $result.user = user;
    }
    return $result;
  }
  LoginResponse._() : super();
  factory LoginResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LoginResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'user'), createEmptyInstance: create)
    ..aOM<UserModel>(1, _omitFieldNames ? '' : 'user', subBuilder: UserModel.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoginResponse clone() => LoginResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoginResponse copyWith(void Function(LoginResponse) updates) => super.copyWith((message) => updates(message as LoginResponse)) as LoginResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LoginResponse create() => LoginResponse._();
  LoginResponse createEmptyInstance() => create();
  static $pb.PbList<LoginResponse> createRepeated() => $pb.PbList<LoginResponse>();
  @$core.pragma('dart2js:noInline')
  static LoginResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginResponse>(create);
  static LoginResponse? _defaultInstance;

  @$pb.TagNumber(1)
  UserModel get user => $_getN(0);
  @$pb.TagNumber(1)
  set user(UserModel v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);
  @$pb.TagNumber(1)
  UserModel ensureUser() => $_ensure(0);
}

class RegisterRequest extends $pb.GeneratedMessage {
  factory RegisterRequest({
    $core.String? login,
    $core.String? password,
    $core.String? name,
    $core.String? surname,
    $core.String? email,
    $core.String? phone,
    $7.Timestamp? birthDate,
  }) {
    final $result = create();
    if (login != null) {
      $result.login = login;
    }
    if (password != null) {
      $result.password = password;
    }
    if (name != null) {
      $result.name = name;
    }
    if (surname != null) {
      $result.surname = surname;
    }
    if (email != null) {
      $result.email = email;
    }
    if (phone != null) {
      $result.phone = phone;
    }
    if (birthDate != null) {
      $result.birthDate = birthDate;
    }
    return $result;
  }
  RegisterRequest._() : super();
  factory RegisterRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegisterRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RegisterRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'user'), createEmptyInstance: create)
    ..aOS(2, _omitFieldNames ? '' : 'login')
    ..aOS(3, _omitFieldNames ? '' : 'password')
    ..aOS(4, _omitFieldNames ? '' : 'name')
    ..aOS(5, _omitFieldNames ? '' : 'surname')
    ..aOS(6, _omitFieldNames ? '' : 'email')
    ..aOS(7, _omitFieldNames ? '' : 'phone')
    ..aOM<$7.Timestamp>(8, _omitFieldNames ? '' : 'birthDate', subBuilder: $7.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RegisterRequest clone() => RegisterRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RegisterRequest copyWith(void Function(RegisterRequest) updates) => super.copyWith((message) => updates(message as RegisterRequest)) as RegisterRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RegisterRequest create() => RegisterRequest._();
  RegisterRequest createEmptyInstance() => create();
  static $pb.PbList<RegisterRequest> createRepeated() => $pb.PbList<RegisterRequest>();
  @$core.pragma('dart2js:noInline')
  static RegisterRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RegisterRequest>(create);
  static RegisterRequest? _defaultInstance;

  @$pb.TagNumber(2)
  $core.String get login => $_getSZ(0);
  @$pb.TagNumber(2)
  set login($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasLogin() => $_has(0);
  @$pb.TagNumber(2)
  void clearLogin() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(3)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(3)
  void clearPassword() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(4)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(4)
  void clearName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get surname => $_getSZ(3);
  @$pb.TagNumber(5)
  set surname($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasSurname() => $_has(3);
  @$pb.TagNumber(5)
  void clearSurname() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get email => $_getSZ(4);
  @$pb.TagNumber(6)
  set email($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasEmail() => $_has(4);
  @$pb.TagNumber(6)
  void clearEmail() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get phone => $_getSZ(5);
  @$pb.TagNumber(7)
  set phone($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(7)
  $core.bool hasPhone() => $_has(5);
  @$pb.TagNumber(7)
  void clearPhone() => clearField(7);

  @$pb.TagNumber(8)
  $7.Timestamp get birthDate => $_getN(6);
  @$pb.TagNumber(8)
  set birthDate($7.Timestamp v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasBirthDate() => $_has(6);
  @$pb.TagNumber(8)
  void clearBirthDate() => clearField(8);
  @$pb.TagNumber(8)
  $7.Timestamp ensureBirthDate() => $_ensure(6);
}

class RegisterResponse extends $pb.GeneratedMessage {
  factory RegisterResponse({
    UserModel? user,
  }) {
    final $result = create();
    if (user != null) {
      $result.user = user;
    }
    return $result;
  }
  RegisterResponse._() : super();
  factory RegisterResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegisterResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RegisterResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'user'), createEmptyInstance: create)
    ..aOM<UserModel>(1, _omitFieldNames ? '' : 'user', subBuilder: UserModel.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RegisterResponse clone() => RegisterResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RegisterResponse copyWith(void Function(RegisterResponse) updates) => super.copyWith((message) => updates(message as RegisterResponse)) as RegisterResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RegisterResponse create() => RegisterResponse._();
  RegisterResponse createEmptyInstance() => create();
  static $pb.PbList<RegisterResponse> createRepeated() => $pb.PbList<RegisterResponse>();
  @$core.pragma('dart2js:noInline')
  static RegisterResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RegisterResponse>(create);
  static RegisterResponse? _defaultInstance;

  @$pb.TagNumber(1)
  UserModel get user => $_getN(0);
  @$pb.TagNumber(1)
  set user(UserModel v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);
  @$pb.TagNumber(1)
  UserModel ensureUser() => $_ensure(0);
}

class GetUserByTokenRequest extends $pb.GeneratedMessage {
  factory GetUserByTokenRequest() => create();
  GetUserByTokenRequest._() : super();
  factory GetUserByTokenRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserByTokenRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUserByTokenRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'user'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUserByTokenRequest clone() => GetUserByTokenRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUserByTokenRequest copyWith(void Function(GetUserByTokenRequest) updates) => super.copyWith((message) => updates(message as GetUserByTokenRequest)) as GetUserByTokenRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUserByTokenRequest create() => GetUserByTokenRequest._();
  GetUserByTokenRequest createEmptyInstance() => create();
  static $pb.PbList<GetUserByTokenRequest> createRepeated() => $pb.PbList<GetUserByTokenRequest>();
  @$core.pragma('dart2js:noInline')
  static GetUserByTokenRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserByTokenRequest>(create);
  static GetUserByTokenRequest? _defaultInstance;
}

class GetUserByTokenResponse extends $pb.GeneratedMessage {
  factory GetUserByTokenResponse({
    UserModel? user,
  }) {
    final $result = create();
    if (user != null) {
      $result.user = user;
    }
    return $result;
  }
  GetUserByTokenResponse._() : super();
  factory GetUserByTokenResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserByTokenResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUserByTokenResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'user'), createEmptyInstance: create)
    ..aOM<UserModel>(1, _omitFieldNames ? '' : 'user', subBuilder: UserModel.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUserByTokenResponse clone() => GetUserByTokenResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUserByTokenResponse copyWith(void Function(GetUserByTokenResponse) updates) => super.copyWith((message) => updates(message as GetUserByTokenResponse)) as GetUserByTokenResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUserByTokenResponse create() => GetUserByTokenResponse._();
  GetUserByTokenResponse createEmptyInstance() => create();
  static $pb.PbList<GetUserByTokenResponse> createRepeated() => $pb.PbList<GetUserByTokenResponse>();
  @$core.pragma('dart2js:noInline')
  static GetUserByTokenResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserByTokenResponse>(create);
  static GetUserByTokenResponse? _defaultInstance;

  @$pb.TagNumber(1)
  UserModel get user => $_getN(0);
  @$pb.TagNumber(1)
  set user(UserModel v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);
  @$pb.TagNumber(1)
  UserModel ensureUser() => $_ensure(0);
}

class GetProfileByIdRequest extends $pb.GeneratedMessage {
  factory GetProfileByIdRequest({
    $fixnum.Int64? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  GetProfileByIdRequest._() : super();
  factory GetProfileByIdRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetProfileByIdRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetProfileByIdRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'user'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetProfileByIdRequest clone() => GetProfileByIdRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetProfileByIdRequest copyWith(void Function(GetProfileByIdRequest) updates) => super.copyWith((message) => updates(message as GetProfileByIdRequest)) as GetProfileByIdRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetProfileByIdRequest create() => GetProfileByIdRequest._();
  GetProfileByIdRequest createEmptyInstance() => create();
  static $pb.PbList<GetProfileByIdRequest> createRepeated() => $pb.PbList<GetProfileByIdRequest>();
  @$core.pragma('dart2js:noInline')
  static GetProfileByIdRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetProfileByIdRequest>(create);
  static GetProfileByIdRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class GetProfileByIdResponse extends $pb.GeneratedMessage {
  factory GetProfileByIdResponse({
    UserModel? user,
  }) {
    final $result = create();
    if (user != null) {
      $result.user = user;
    }
    return $result;
  }
  GetProfileByIdResponse._() : super();
  factory GetProfileByIdResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetProfileByIdResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetProfileByIdResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'user'), createEmptyInstance: create)
    ..aOM<UserModel>(1, _omitFieldNames ? '' : 'user', subBuilder: UserModel.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetProfileByIdResponse clone() => GetProfileByIdResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetProfileByIdResponse copyWith(void Function(GetProfileByIdResponse) updates) => super.copyWith((message) => updates(message as GetProfileByIdResponse)) as GetProfileByIdResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetProfileByIdResponse create() => GetProfileByIdResponse._();
  GetProfileByIdResponse createEmptyInstance() => create();
  static $pb.PbList<GetProfileByIdResponse> createRepeated() => $pb.PbList<GetProfileByIdResponse>();
  @$core.pragma('dart2js:noInline')
  static GetProfileByIdResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetProfileByIdResponse>(create);
  static GetProfileByIdResponse? _defaultInstance;

  @$pb.TagNumber(1)
  UserModel get user => $_getN(0);
  @$pb.TagNumber(1)
  set user(UserModel v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => clearField(1);
  @$pb.TagNumber(1)
  UserModel ensureUser() => $_ensure(0);
}

class ValidateUserRequest extends $pb.GeneratedMessage {
  factory ValidateUserRequest({
    $core.String? login,
    $core.String? password,
    $core.String? name,
    $core.String? surname,
    $core.String? email,
    $core.String? phone,
  }) {
    final $result = create();
    if (login != null) {
      $result.login = login;
    }
    if (password != null) {
      $result.password = password;
    }
    if (name != null) {
      $result.name = name;
    }
    if (surname != null) {
      $result.surname = surname;
    }
    if (email != null) {
      $result.email = email;
    }
    if (phone != null) {
      $result.phone = phone;
    }
    return $result;
  }
  ValidateUserRequest._() : super();
  factory ValidateUserRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ValidateUserRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ValidateUserRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'user'), createEmptyInstance: create)
    ..aOS(2, _omitFieldNames ? '' : 'login')
    ..aOS(3, _omitFieldNames ? '' : 'password')
    ..aOS(4, _omitFieldNames ? '' : 'name')
    ..aOS(5, _omitFieldNames ? '' : 'surname')
    ..aOS(6, _omitFieldNames ? '' : 'email')
    ..aOS(7, _omitFieldNames ? '' : 'phone')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ValidateUserRequest clone() => ValidateUserRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ValidateUserRequest copyWith(void Function(ValidateUserRequest) updates) => super.copyWith((message) => updates(message as ValidateUserRequest)) as ValidateUserRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ValidateUserRequest create() => ValidateUserRequest._();
  ValidateUserRequest createEmptyInstance() => create();
  static $pb.PbList<ValidateUserRequest> createRepeated() => $pb.PbList<ValidateUserRequest>();
  @$core.pragma('dart2js:noInline')
  static ValidateUserRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ValidateUserRequest>(create);
  static ValidateUserRequest? _defaultInstance;

  @$pb.TagNumber(2)
  $core.String get login => $_getSZ(0);
  @$pb.TagNumber(2)
  set login($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasLogin() => $_has(0);
  @$pb.TagNumber(2)
  void clearLogin() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(3)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(3)
  void clearPassword() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(4)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(4)
  void clearName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get surname => $_getSZ(3);
  @$pb.TagNumber(5)
  set surname($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasSurname() => $_has(3);
  @$pb.TagNumber(5)
  void clearSurname() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get email => $_getSZ(4);
  @$pb.TagNumber(6)
  set email($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasEmail() => $_has(4);
  @$pb.TagNumber(6)
  void clearEmail() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get phone => $_getSZ(5);
  @$pb.TagNumber(7)
  set phone($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(7)
  $core.bool hasPhone() => $_has(5);
  @$pb.TagNumber(7)
  void clearPhone() => clearField(7);
}

class ValidateUserResponse extends $pb.GeneratedMessage {
  factory ValidateUserResponse({
    $core.bool? valid,
  }) {
    final $result = create();
    if (valid != null) {
      $result.valid = valid;
    }
    return $result;
  }
  ValidateUserResponse._() : super();
  factory ValidateUserResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ValidateUserResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ValidateUserResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'user'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'valid')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ValidateUserResponse clone() => ValidateUserResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ValidateUserResponse copyWith(void Function(ValidateUserResponse) updates) => super.copyWith((message) => updates(message as ValidateUserResponse)) as ValidateUserResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ValidateUserResponse create() => ValidateUserResponse._();
  ValidateUserResponse createEmptyInstance() => create();
  static $pb.PbList<ValidateUserResponse> createRepeated() => $pb.PbList<ValidateUserResponse>();
  @$core.pragma('dart2js:noInline')
  static ValidateUserResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ValidateUserResponse>(create);
  static ValidateUserResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get valid => $_getBF(0);
  @$pb.TagNumber(1)
  set valid($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValid() => $_has(0);
  @$pb.TagNumber(1)
  void clearValid() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
