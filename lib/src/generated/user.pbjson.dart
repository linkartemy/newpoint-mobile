//
//  Generated code. Do not modify.
//  source: user.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
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
    {'1': 'image', '3': 5, '4': 1, '5': 9, '10': 'image'},
    {'1': 'email', '3': 6, '4': 1, '5': 9, '10': 'email'},
    {'1': 'phone', '3': 7, '4': 1, '5': 9, '10': 'phone'},
    {
      '1': 'birth_date',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'birthDate'
    },
    {
      '1': 'last_login_timestamp',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'lastLoginTimestamp'
    },
    {'1': 'ip', '3': 10, '4': 1, '5': 9, '10': 'ip'},
    {
      '1': 'registration_timestamp',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'registrationTimestamp'
    },
  ],
};

/// Descriptor for `UserModel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userModelDescriptor = $convert.base64Decode(
    'CglVc2VyTW9kZWwSDgoCaWQYASABKANSAmlkEhQKBWxvZ2luGAIgASgJUgVsb2dpbhISCgRuYW'
    '1lGAMgASgJUgRuYW1lEhgKB3N1cm5hbWUYBCABKAlSB3N1cm5hbWUSFAoFaW1hZ2UYBSABKAlS'
    'BWltYWdlEhQKBWVtYWlsGAYgASgJUgVlbWFpbBIUCgVwaG9uZRgHIAEoCVIFcGhvbmUSOQoKYm'
    'lydGhfZGF0ZRgIIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCWJpcnRoRGF0ZRJM'
    'ChRsYXN0X2xvZ2luX3RpbWVzdGFtcBgJIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbX'
    'BSEmxhc3RMb2dpblRpbWVzdGFtcBIOCgJpcBgKIAEoCVICaXASUQoWcmVnaXN0cmF0aW9uX3Rp'
    'bWVzdGFtcBgLIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSFXJlZ2lzdHJhdGlvbl'
    'RpbWVzdGFtcA==');

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
    {
      '1': 'user',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.user.UserModel',
      '10': 'user'
    },
  ],
};

/// Descriptor for `LoginResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginResponseDescriptor = $convert.base64Decode(
    'Cg1Mb2dpblJlc3BvbnNlEiMKBHVzZXIYASABKAsyDy51c2VyLlVzZXJNb2RlbFIEdXNlcg==');

@$core.Deprecated('Use registerRequestDescriptor instead')
const RegisterRequest$json = {
  '1': 'RegisterRequest',
  '2': [
    {'1': 'login', '3': 2, '4': 1, '5': 9, '10': 'login'},
    {'1': 'password', '3': 3, '4': 1, '5': 9, '10': 'password'},
    {'1': 'name', '3': 4, '4': 1, '5': 9, '10': 'name'},
    {'1': 'surname', '3': 5, '4': 1, '5': 9, '10': 'surname'},
    {'1': 'email', '3': 6, '4': 1, '5': 9, '10': 'email'},
    {'1': 'phone', '3': 7, '4': 1, '5': 9, '10': 'phone'},
    {
      '1': 'birth_date',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'birthDate'
    },
  ],
};

/// Descriptor for `RegisterRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerRequestDescriptor = $convert.base64Decode(
    'Cg9SZWdpc3RlclJlcXVlc3QSFAoFbG9naW4YAiABKAlSBWxvZ2luEhoKCHBhc3N3b3JkGAMgAS'
    'gJUghwYXNzd29yZBISCgRuYW1lGAQgASgJUgRuYW1lEhgKB3N1cm5hbWUYBSABKAlSB3N1cm5h'
    'bWUSFAoFZW1haWwYBiABKAlSBWVtYWlsEhQKBXBob25lGAcgASgJUgVwaG9uZRI5CgpiaXJ0aF'
    '9kYXRlGAggASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJYmlydGhEYXRl');

@$core.Deprecated('Use registerResponseDescriptor instead')
const RegisterResponse$json = {
  '1': 'RegisterResponse',
  '2': [
    {
      '1': 'user',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.user.UserModel',
      '10': 'user'
    },
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
final $typed_data.Uint8List getUserByTokenRequestDescriptor =
    $convert.base64Decode('ChVHZXRVc2VyQnlUb2tlblJlcXVlc3Q=');

@$core.Deprecated('Use getUserByTokenResponseDescriptor instead')
const GetUserByTokenResponse$json = {
  '1': 'GetUserByTokenResponse',
  '2': [
    {
      '1': 'user',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.user.UserModel',
      '10': 'user'
    },
  ],
};

/// Descriptor for `GetUserByTokenResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserByTokenResponseDescriptor =
    $convert.base64Decode(
        'ChZHZXRVc2VyQnlUb2tlblJlc3BvbnNlEiMKBHVzZXIYASABKAsyDy51c2VyLlVzZXJNb2RlbF'
        'IEdXNlcg==');
