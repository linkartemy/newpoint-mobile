//
//  Generated code. Do not modify.
//  source: user.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use userModelDescriptor instead')
const UserModel$json = {
  '1': 'UserModel',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'login', '3': 2, '4': 1, '5': 9, '10': 'login'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'surname', '3': 4, '4': 1, '5': 9, '10': 'surname'},
    {'1': 'description', '3': 5, '4': 1, '5': 11, '6': '.NullableString', '10': 'description'},
    {'1': 'location', '3': 6, '4': 1, '5': 11, '6': '.NullableString', '10': 'location'},
    {'1': 'email', '3': 7, '4': 1, '5': 11, '6': '.NullableString', '10': 'email'},
    {'1': 'phone', '3': 8, '4': 1, '5': 11, '6': '.NullableString', '10': 'phone'},
    {'1': 'profile_image_id', '3': 9, '4': 1, '5': 3, '10': 'profileImageId'},
    {'1': 'header_image_id', '3': 10, '4': 1, '5': 3, '10': 'headerImageId'},
    {'1': 'birth_date', '3': 11, '4': 1, '5': 11, '6': '.NullableTimestamp', '10': 'birthDate'},
    {'1': 'registration_timestamp', '3': 12, '4': 1, '5': 11, '6': '.NullableTimestamp', '10': 'registrationTimestamp'},
    {'1': 'last_login_timestamp', '3': 13, '4': 1, '5': 11, '6': '.NullableTimestamp', '10': 'lastLoginTimestamp'},
    {'1': 'ip', '3': 14, '4': 1, '5': 11, '6': '.NullableString', '10': 'ip'},
    {'1': 'followers', '3': 15, '4': 1, '5': 5, '10': 'followers'},
    {'1': 'following', '3': 16, '4': 1, '5': 5, '10': 'following'},
  ],
};

/// Descriptor for `UserModel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userModelDescriptor = $convert.base64Decode(
    'CglVc2VyTW9kZWwSDgoCaWQYASABKANSAmlkEhQKBWxvZ2luGAIgASgJUgVsb2dpbhISCgRuYW'
    '1lGAMgASgJUgRuYW1lEhgKB3N1cm5hbWUYBCABKAlSB3N1cm5hbWUSMQoLZGVzY3JpcHRpb24Y'
    'BSABKAsyDy5OdWxsYWJsZVN0cmluZ1ILZGVzY3JpcHRpb24SKwoIbG9jYXRpb24YBiABKAsyDy'
    '5OdWxsYWJsZVN0cmluZ1IIbG9jYXRpb24SJQoFZW1haWwYByABKAsyDy5OdWxsYWJsZVN0cmlu'
    'Z1IFZW1haWwSJQoFcGhvbmUYCCABKAsyDy5OdWxsYWJsZVN0cmluZ1IFcGhvbmUSKAoQcHJvZm'
    'lsZV9pbWFnZV9pZBgJIAEoA1IOcHJvZmlsZUltYWdlSWQSJgoPaGVhZGVyX2ltYWdlX2lkGAog'
    'ASgDUg1oZWFkZXJJbWFnZUlkEjEKCmJpcnRoX2RhdGUYCyABKAsyEi5OdWxsYWJsZVRpbWVzdG'
    'FtcFIJYmlydGhEYXRlEkkKFnJlZ2lzdHJhdGlvbl90aW1lc3RhbXAYDCABKAsyEi5OdWxsYWJs'
    'ZVRpbWVzdGFtcFIVcmVnaXN0cmF0aW9uVGltZXN0YW1wEkQKFGxhc3RfbG9naW5fdGltZXN0YW'
    '1wGA0gASgLMhIuTnVsbGFibGVUaW1lc3RhbXBSEmxhc3RMb2dpblRpbWVzdGFtcBIfCgJpcBgO'
    'IAEoCzIPLk51bGxhYmxlU3RyaW5nUgJpcBIcCglmb2xsb3dlcnMYDyABKAVSCWZvbGxvd2Vycx'
    'IcCglmb2xsb3dpbmcYECABKAVSCWZvbGxvd2luZw==');

@$core.Deprecated('Use loginRequestDescriptor instead')
const LoginRequest$json = {
  '1': 'LoginRequest',
  '2': [
    {'1': 'login', '3': 1, '4': 1, '5': 9, '10': 'login'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `LoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginRequestDescriptor = $convert.base64Decode(
    'CgxMb2dpblJlcXVlc3QSFAoFbG9naW4YASABKAlSBWxvZ2luEhoKCHBhc3N3b3JkGAIgASgJUg'
    'hwYXNzd29yZA==');

@$core.Deprecated('Use loginResponseDescriptor instead')
const LoginResponse$json = {
  '1': 'LoginResponse',
  '2': [
    {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.user.UserModel', '10': 'user'},
  ],
};

/// Descriptor for `LoginResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginResponseDescriptor = $convert.base64Decode(
    'Cg1Mb2dpblJlc3BvbnNlEiMKBHVzZXIYASABKAsyDy51c2VyLlVzZXJNb2RlbFIEdXNlcg==');

@$core.Deprecated('Use registerRequestDescriptor instead')
const RegisterRequest$json = {
  '1': 'RegisterRequest',
  '2': [
    {'1': 'login', '3': 1, '4': 1, '5': 9, '10': 'login'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'surname', '3': 4, '4': 1, '5': 9, '10': 'surname'},
    {'1': 'email', '3': 5, '4': 1, '5': 9, '10': 'email'},
    {'1': 'phone', '3': 6, '4': 1, '5': 9, '10': 'phone'},
    {'1': 'birth_date', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'birthDate'},
  ],
};

/// Descriptor for `RegisterRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerRequestDescriptor = $convert.base64Decode(
    'Cg9SZWdpc3RlclJlcXVlc3QSFAoFbG9naW4YASABKAlSBWxvZ2luEhoKCHBhc3N3b3JkGAIgAS'
    'gJUghwYXNzd29yZBISCgRuYW1lGAMgASgJUgRuYW1lEhgKB3N1cm5hbWUYBCABKAlSB3N1cm5h'
    'bWUSFAoFZW1haWwYBSABKAlSBWVtYWlsEhQKBXBob25lGAYgASgJUgVwaG9uZRI5CgpiaXJ0aF'
    '9kYXRlGAcgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJYmlydGhEYXRl');

@$core.Deprecated('Use registerResponseDescriptor instead')
const RegisterResponse$json = {
  '1': 'RegisterResponse',
  '2': [
    {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.user.UserModel', '10': 'user'},
  ],
};

/// Descriptor for `RegisterResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerResponseDescriptor = $convert.base64Decode(
    'ChBSZWdpc3RlclJlc3BvbnNlEiMKBHVzZXIYASABKAsyDy51c2VyLlVzZXJNb2RlbFIEdXNlcg'
    '==');

@$core.Deprecated('Use getUserByTokenRequestDescriptor instead')
const GetUserByTokenRequest$json = {
  '1': 'GetUserByTokenRequest',
};

/// Descriptor for `GetUserByTokenRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserByTokenRequestDescriptor = $convert.base64Decode(
    'ChVHZXRVc2VyQnlUb2tlblJlcXVlc3Q=');

@$core.Deprecated('Use getUserByTokenResponseDescriptor instead')
const GetUserByTokenResponse$json = {
  '1': 'GetUserByTokenResponse',
  '2': [
    {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.user.UserModel', '10': 'user'},
  ],
};

/// Descriptor for `GetUserByTokenResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserByTokenResponseDescriptor = $convert.base64Decode(
    'ChZHZXRVc2VyQnlUb2tlblJlc3BvbnNlEiMKBHVzZXIYASABKAsyDy51c2VyLlVzZXJNb2RlbF'
    'IEdXNlcg==');

@$core.Deprecated('Use getProfileByIdRequestDescriptor instead')
const GetProfileByIdRequest$json = {
  '1': 'GetProfileByIdRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
  ],
};

/// Descriptor for `GetProfileByIdRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getProfileByIdRequestDescriptor = $convert.base64Decode(
    'ChVHZXRQcm9maWxlQnlJZFJlcXVlc3QSDgoCaWQYASABKANSAmlk');

@$core.Deprecated('Use getProfileByIdResponseDescriptor instead')
const GetProfileByIdResponse$json = {
  '1': 'GetProfileByIdResponse',
  '2': [
    {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.user.UserModel', '10': 'user'},
  ],
};

/// Descriptor for `GetProfileByIdResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getProfileByIdResponseDescriptor = $convert.base64Decode(
    'ChZHZXRQcm9maWxlQnlJZFJlc3BvbnNlEiMKBHVzZXIYASABKAsyDy51c2VyLlVzZXJNb2RlbF'
    'IEdXNlcg==');

@$core.Deprecated('Use validateUserRequestDescriptor instead')
const ValidateUserRequest$json = {
  '1': 'ValidateUserRequest',
  '2': [
    {'1': 'login', '3': 1, '4': 1, '5': 9, '10': 'login'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'surname', '3': 4, '4': 1, '5': 9, '10': 'surname'},
    {'1': 'email', '3': 5, '4': 1, '5': 9, '10': 'email'},
    {'1': 'phone', '3': 6, '4': 1, '5': 9, '10': 'phone'},
  ],
};

/// Descriptor for `ValidateUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List validateUserRequestDescriptor = $convert.base64Decode(
    'ChNWYWxpZGF0ZVVzZXJSZXF1ZXN0EhQKBWxvZ2luGAEgASgJUgVsb2dpbhIaCghwYXNzd29yZB'
    'gCIAEoCVIIcGFzc3dvcmQSEgoEbmFtZRgDIAEoCVIEbmFtZRIYCgdzdXJuYW1lGAQgASgJUgdz'
    'dXJuYW1lEhQKBWVtYWlsGAUgASgJUgVlbWFpbBIUCgVwaG9uZRgGIAEoCVIFcGhvbmU=');

@$core.Deprecated('Use validateUserResponseDescriptor instead')
const ValidateUserResponse$json = {
  '1': 'ValidateUserResponse',
  '2': [
    {'1': 'valid', '3': 1, '4': 1, '5': 8, '10': 'valid'},
  ],
};

/// Descriptor for `ValidateUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List validateUserResponseDescriptor = $convert.base64Decode(
    'ChRWYWxpZGF0ZVVzZXJSZXNwb25zZRIUCgV2YWxpZBgBIAEoCFIFdmFsaWQ=');

@$core.Deprecated('Use updateProfileRequestDescriptor instead')
const UpdateProfileRequest$json = {
  '1': 'UpdateProfileRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'surname', '3': 2, '4': 1, '5': 9, '10': 'surname'},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    {'1': 'location', '3': 4, '4': 1, '5': 9, '10': 'location'},
    {'1': 'birth_date', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'birthDate'},
  ],
};

/// Descriptor for `UpdateProfileRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateProfileRequestDescriptor = $convert.base64Decode(
    'ChRVcGRhdGVQcm9maWxlUmVxdWVzdBISCgRuYW1lGAEgASgJUgRuYW1lEhgKB3N1cm5hbWUYAi'
    'ABKAlSB3N1cm5hbWUSIAoLZGVzY3JpcHRpb24YAyABKAlSC2Rlc2NyaXB0aW9uEhoKCGxvY2F0'
    'aW9uGAQgASgJUghsb2NhdGlvbhI5CgpiaXJ0aF9kYXRlGAUgASgLMhouZ29vZ2xlLnByb3RvYn'
    'VmLlRpbWVzdGFtcFIJYmlydGhEYXRl');

@$core.Deprecated('Use updateProfileResponseDescriptor instead')
const UpdateProfileResponse$json = {
  '1': 'UpdateProfileResponse',
  '2': [
    {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.user.UserModel', '10': 'user'},
  ],
};

/// Descriptor for `UpdateProfileResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateProfileResponseDescriptor = $convert.base64Decode(
    'ChVVcGRhdGVQcm9maWxlUmVzcG9uc2USIwoEdXNlchgBIAEoCzIPLnVzZXIuVXNlck1vZGVsUg'
    'R1c2Vy');

@$core.Deprecated('Use updateProfileImageRequestDescriptor instead')
const UpdateProfileImageRequest$json = {
  '1': 'UpdateProfileImageRequest',
  '2': [
    {'1': 'data', '3': 1, '4': 1, '5': 12, '10': 'data'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `UpdateProfileImageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateProfileImageRequestDescriptor = $convert.base64Decode(
    'ChlVcGRhdGVQcm9maWxlSW1hZ2VSZXF1ZXN0EhIKBGRhdGEYASABKAxSBGRhdGESEgoEbmFtZR'
    'gCIAEoCVIEbmFtZQ==');

@$core.Deprecated('Use updateProfileImageResponseDescriptor instead')
const UpdateProfileImageResponse$json = {
  '1': 'UpdateProfileImageResponse',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
  ],
};

/// Descriptor for `UpdateProfileImageResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateProfileImageResponseDescriptor = $convert.base64Decode(
    'ChpVcGRhdGVQcm9maWxlSW1hZ2VSZXNwb25zZRIOCgJpZBgBIAEoA1ICaWQ=');

@$core.Deprecated('Use changeEmailRequestDescriptor instead')
const ChangeEmailRequest$json = {
  '1': 'ChangeEmailRequest',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
  ],
};

/// Descriptor for `ChangeEmailRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List changeEmailRequestDescriptor = $convert.base64Decode(
    'ChJDaGFuZ2VFbWFpbFJlcXVlc3QSFAoFZW1haWwYASABKAlSBWVtYWls');

@$core.Deprecated('Use changeEmailResponseDescriptor instead')
const ChangeEmailResponse$json = {
  '1': 'ChangeEmailResponse',
  '2': [
    {'1': 'changed', '3': 1, '4': 1, '5': 8, '10': 'changed'},
  ],
};

/// Descriptor for `ChangeEmailResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List changeEmailResponseDescriptor = $convert.base64Decode(
    'ChNDaGFuZ2VFbWFpbFJlc3BvbnNlEhgKB2NoYW5nZWQYASABKAhSB2NoYW5nZWQ=');

@$core.Deprecated('Use changePasswordRequestDescriptor instead')
const ChangePasswordRequest$json = {
  '1': 'ChangePasswordRequest',
  '2': [
    {'1': 'current_password', '3': 1, '4': 1, '5': 9, '10': 'currentPassword'},
    {'1': 'new_password', '3': 2, '4': 1, '5': 9, '10': 'newPassword'},
  ],
};

/// Descriptor for `ChangePasswordRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List changePasswordRequestDescriptor = $convert.base64Decode(
    'ChVDaGFuZ2VQYXNzd29yZFJlcXVlc3QSKQoQY3VycmVudF9wYXNzd29yZBgBIAEoCVIPY3Vycm'
    'VudFBhc3N3b3JkEiEKDG5ld19wYXNzd29yZBgCIAEoCVILbmV3UGFzc3dvcmQ=');

@$core.Deprecated('Use changePasswordResponseDescriptor instead')
const ChangePasswordResponse$json = {
  '1': 'ChangePasswordResponse',
  '2': [
    {'1': 'changed', '3': 1, '4': 1, '5': 8, '10': 'changed'},
  ],
};

/// Descriptor for `ChangePasswordResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List changePasswordResponseDescriptor = $convert.base64Decode(
    'ChZDaGFuZ2VQYXNzd29yZFJlc3BvbnNlEhgKB2NoYW5nZWQYASABKAhSB2NoYW5nZWQ=');

@$core.Deprecated('Use verifyPasswordRequestDescriptor instead')
const VerifyPasswordRequest$json = {
  '1': 'VerifyPasswordRequest',
  '2': [
    {'1': 'password', '3': 1, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `VerifyPasswordRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyPasswordRequestDescriptor = $convert.base64Decode(
    'ChVWZXJpZnlQYXNzd29yZFJlcXVlc3QSGgoIcGFzc3dvcmQYASABKAlSCHBhc3N3b3Jk');

@$core.Deprecated('Use verifyPasswordResponseDescriptor instead')
const VerifyPasswordResponse$json = {
  '1': 'VerifyPasswordResponse',
  '2': [
    {'1': 'verified', '3': 1, '4': 1, '5': 8, '10': 'verified'},
  ],
};

/// Descriptor for `VerifyPasswordResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyPasswordResponseDescriptor = $convert.base64Decode(
    'ChZWZXJpZnlQYXNzd29yZFJlc3BvbnNlEhoKCHZlcmlmaWVkGAEgASgIUgh2ZXJpZmllZA==');

@$core.Deprecated('Use followRequestDescriptor instead')
const FollowRequest$json = {
  '1': 'FollowRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 3, '10': 'userId'},
  ],
};

/// Descriptor for `FollowRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List followRequestDescriptor = $convert.base64Decode(
    'Cg1Gb2xsb3dSZXF1ZXN0EhcKB3VzZXJfaWQYASABKANSBnVzZXJJZA==');

@$core.Deprecated('Use followResponseDescriptor instead')
const FollowResponse$json = {
  '1': 'FollowResponse',
  '2': [
    {'1': 'following', '3': 1, '4': 1, '5': 8, '10': 'following'},
  ],
};

/// Descriptor for `FollowResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List followResponseDescriptor = $convert.base64Decode(
    'Cg5Gb2xsb3dSZXNwb25zZRIcCglmb2xsb3dpbmcYASABKAhSCWZvbGxvd2luZw==');

@$core.Deprecated('Use isFollowingRequestDescriptor instead')
const IsFollowingRequest$json = {
  '1': 'IsFollowingRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 3, '10': 'userId'},
  ],
};

/// Descriptor for `IsFollowingRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List isFollowingRequestDescriptor = $convert.base64Decode(
    'ChJJc0ZvbGxvd2luZ1JlcXVlc3QSFwoHdXNlcl9pZBgBIAEoA1IGdXNlcklk');

@$core.Deprecated('Use isFollowingResponseDescriptor instead')
const IsFollowingResponse$json = {
  '1': 'IsFollowingResponse',
  '2': [
    {'1': 'following', '3': 1, '4': 1, '5': 8, '10': 'following'},
  ],
};

/// Descriptor for `IsFollowingResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List isFollowingResponseDescriptor = $convert.base64Decode(
    'ChNJc0ZvbGxvd2luZ1Jlc3BvbnNlEhwKCWZvbGxvd2luZxgBIAEoCFIJZm9sbG93aW5n');

@$core.Deprecated('Use getTwoFactorByTokenRequestDescriptor instead')
const GetTwoFactorByTokenRequest$json = {
  '1': 'GetTwoFactorByTokenRequest',
  '2': [
    {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
  ],
};

/// Descriptor for `GetTwoFactorByTokenRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTwoFactorByTokenRequestDescriptor = $convert.base64Decode(
    'ChpHZXRUd29GYWN0b3JCeVRva2VuUmVxdWVzdBIUCgV0b2tlbhgBIAEoCVIFdG9rZW4=');

@$core.Deprecated('Use getTwoFactorByTokenResponseDescriptor instead')
const GetTwoFactorByTokenResponse$json = {
  '1': 'GetTwoFactorByTokenResponse',
  '2': [
    {'1': 'enabled', '3': 1, '4': 1, '5': 8, '10': 'enabled'},
  ],
};

/// Descriptor for `GetTwoFactorByTokenResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTwoFactorByTokenResponseDescriptor = $convert.base64Decode(
    'ChtHZXRUd29GYWN0b3JCeVRva2VuUmVzcG9uc2USGAoHZW5hYmxlZBgBIAEoCFIHZW5hYmxlZA'
    '==');

@$core.Deprecated('Use updateTwoFactorRequestDescriptor instead')
const UpdateTwoFactorRequest$json = {
  '1': 'UpdateTwoFactorRequest',
  '2': [
    {'1': 'enabled', '3': 1, '4': 1, '5': 8, '10': 'enabled'},
  ],
};

/// Descriptor for `UpdateTwoFactorRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateTwoFactorRequestDescriptor = $convert.base64Decode(
    'ChZVcGRhdGVUd29GYWN0b3JSZXF1ZXN0EhgKB2VuYWJsZWQYASABKAhSB2VuYWJsZWQ=');

@$core.Deprecated('Use updateTwoFactorResponseDescriptor instead')
const UpdateTwoFactorResponse$json = {
  '1': 'UpdateTwoFactorResponse',
  '2': [
    {'1': 'updated', '3': 1, '4': 1, '5': 8, '10': 'updated'},
  ],
};

/// Descriptor for `UpdateTwoFactorResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateTwoFactorResponseDescriptor = $convert.base64Decode(
    'ChdVcGRhdGVUd29GYWN0b3JSZXNwb25zZRIYCgd1cGRhdGVkGAEgASgIUgd1cGRhdGVk');

