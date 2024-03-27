//
//  Generated code. Do not modify.
//  source: code.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use addEmailVerificationCodeRequestDescriptor instead')
const AddEmailVerificationCodeRequest$json = {
  '1': 'AddEmailVerificationCodeRequest',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
  ],
};

/// Descriptor for `AddEmailVerificationCodeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addEmailVerificationCodeRequestDescriptor = $convert.base64Decode(
    'Ch9BZGRFbWFpbFZlcmlmaWNhdGlvbkNvZGVSZXF1ZXN0EhQKBWVtYWlsGAEgASgJUgVlbWFpbA'
    '==');

@$core.Deprecated('Use addEmailVerificationCodeResponseDescriptor instead')
const AddEmailVerificationCodeResponse$json = {
  '1': 'AddEmailVerificationCodeResponse',
  '2': [
    {'1': 'sent', '3': 1, '4': 1, '5': 8, '10': 'sent'},
  ],
};

/// Descriptor for `AddEmailVerificationCodeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addEmailVerificationCodeResponseDescriptor = $convert.base64Decode(
    'CiBBZGRFbWFpbFZlcmlmaWNhdGlvbkNvZGVSZXNwb25zZRISCgRzZW50GAEgASgIUgRzZW50');

@$core.Deprecated('Use verifyEmailVerificationCodeRequestDescriptor instead')
const VerifyEmailVerificationCodeRequest$json = {
  '1': 'VerifyEmailVerificationCodeRequest',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    {'1': 'code', '3': 2, '4': 1, '5': 9, '10': 'code'},
  ],
};

/// Descriptor for `VerifyEmailVerificationCodeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyEmailVerificationCodeRequestDescriptor = $convert.base64Decode(
    'CiJWZXJpZnlFbWFpbFZlcmlmaWNhdGlvbkNvZGVSZXF1ZXN0EhQKBWVtYWlsGAEgASgJUgVlbW'
    'FpbBISCgRjb2RlGAIgASgJUgRjb2Rl');

@$core.Deprecated('Use verifyEmailVerificationCodeResponseDescriptor instead')
const VerifyEmailVerificationCodeResponse$json = {
  '1': 'VerifyEmailVerificationCodeResponse',
  '2': [
    {'1': 'verified', '3': 1, '4': 1, '5': 8, '10': 'verified'},
  ],
};

/// Descriptor for `VerifyEmailVerificationCodeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyEmailVerificationCodeResponseDescriptor = $convert.base64Decode(
    'CiNWZXJpZnlFbWFpbFZlcmlmaWNhdGlvbkNvZGVSZXNwb25zZRIaCgh2ZXJpZmllZBgBIAEoCF'
    'IIdmVyaWZpZWQ=');

@$core.Deprecated('Use addPhoneVerificationCodeRequestDescriptor instead')
const AddPhoneVerificationCodeRequest$json = {
  '1': 'AddPhoneVerificationCodeRequest',
  '2': [
    {'1': 'phone', '3': 1, '4': 1, '5': 9, '10': 'phone'},
  ],
};

/// Descriptor for `AddPhoneVerificationCodeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addPhoneVerificationCodeRequestDescriptor = $convert.base64Decode(
    'Ch9BZGRQaG9uZVZlcmlmaWNhdGlvbkNvZGVSZXF1ZXN0EhQKBXBob25lGAEgASgJUgVwaG9uZQ'
    '==');

@$core.Deprecated('Use addPhoneVerificationCodeResponseDescriptor instead')
const AddPhoneVerificationCodeResponse$json = {
  '1': 'AddPhoneVerificationCodeResponse',
  '2': [
    {'1': 'sent', '3': 1, '4': 1, '5': 8, '10': 'sent'},
  ],
};

/// Descriptor for `AddPhoneVerificationCodeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addPhoneVerificationCodeResponseDescriptor = $convert.base64Decode(
    'CiBBZGRQaG9uZVZlcmlmaWNhdGlvbkNvZGVSZXNwb25zZRISCgRzZW50GAEgASgIUgRzZW50');

@$core.Deprecated('Use verifyPhoneVerificationCodeRequestDescriptor instead')
const VerifyPhoneVerificationCodeRequest$json = {
  '1': 'VerifyPhoneVerificationCodeRequest',
  '2': [
    {'1': 'phone', '3': 1, '4': 1, '5': 9, '10': 'phone'},
    {'1': 'code', '3': 2, '4': 1, '5': 9, '10': 'code'},
  ],
};

/// Descriptor for `VerifyPhoneVerificationCodeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyPhoneVerificationCodeRequestDescriptor = $convert.base64Decode(
    'CiJWZXJpZnlQaG9uZVZlcmlmaWNhdGlvbkNvZGVSZXF1ZXN0EhQKBXBob25lGAEgASgJUgVwaG'
    '9uZRISCgRjb2RlGAIgASgJUgRjb2Rl');

@$core.Deprecated('Use verifyPhoneVerificationCodeResponseDescriptor instead')
const VerifyPhoneVerificationCodeResponse$json = {
  '1': 'VerifyPhoneVerificationCodeResponse',
  '2': [
    {'1': 'verified', '3': 1, '4': 1, '5': 8, '10': 'verified'},
  ],
};

/// Descriptor for `VerifyPhoneVerificationCodeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyPhoneVerificationCodeResponseDescriptor = $convert.base64Decode(
    'CiNWZXJpZnlQaG9uZVZlcmlmaWNhdGlvbkNvZGVSZXNwb25zZRIaCgh2ZXJpZmllZBgBIAEoCF'
    'IIdmVyaWZpZWQ=');

@$core.Deprecated('Use addPasswordChangeVerificationCodeRequestDescriptor instead')
const AddPasswordChangeVerificationCodeRequest$json = {
  '1': 'AddPasswordChangeVerificationCodeRequest',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 11, '6': '.NullableString', '10': 'email'},
    {'1': 'phone', '3': 2, '4': 1, '5': 11, '6': '.NullableString', '10': 'phone'},
  ],
};

/// Descriptor for `AddPasswordChangeVerificationCodeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addPasswordChangeVerificationCodeRequestDescriptor = $convert.base64Decode(
    'CihBZGRQYXNzd29yZENoYW5nZVZlcmlmaWNhdGlvbkNvZGVSZXF1ZXN0EiUKBWVtYWlsGAEgAS'
    'gLMg8uTnVsbGFibGVTdHJpbmdSBWVtYWlsEiUKBXBob25lGAIgASgLMg8uTnVsbGFibGVTdHJp'
    'bmdSBXBob25l');

@$core.Deprecated('Use addPasswordChangeVerificationCodeResponseDescriptor instead')
const AddPasswordChangeVerificationCodeResponse$json = {
  '1': 'AddPasswordChangeVerificationCodeResponse',
  '2': [
    {'1': 'sent', '3': 1, '4': 1, '5': 8, '10': 'sent'},
  ],
};

/// Descriptor for `AddPasswordChangeVerificationCodeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addPasswordChangeVerificationCodeResponseDescriptor = $convert.base64Decode(
    'CilBZGRQYXNzd29yZENoYW5nZVZlcmlmaWNhdGlvbkNvZGVSZXNwb25zZRISCgRzZW50GAEgAS'
    'gIUgRzZW50');

@$core.Deprecated('Use verifyPasswordChangeVerificationCodeRequestDescriptor instead')
const VerifyPasswordChangeVerificationCodeRequest$json = {
  '1': 'VerifyPasswordChangeVerificationCodeRequest',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 11, '6': '.NullableString', '10': 'email'},
    {'1': 'phone', '3': 2, '4': 1, '5': 11, '6': '.NullableString', '10': 'phone'},
    {'1': 'code', '3': 3, '4': 1, '5': 9, '10': 'code'},
  ],
};

/// Descriptor for `VerifyPasswordChangeVerificationCodeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyPasswordChangeVerificationCodeRequestDescriptor = $convert.base64Decode(
    'CitWZXJpZnlQYXNzd29yZENoYW5nZVZlcmlmaWNhdGlvbkNvZGVSZXF1ZXN0EiUKBWVtYWlsGA'
    'EgASgLMg8uTnVsbGFibGVTdHJpbmdSBWVtYWlsEiUKBXBob25lGAIgASgLMg8uTnVsbGFibGVT'
    'dHJpbmdSBXBob25lEhIKBGNvZGUYAyABKAlSBGNvZGU=');

@$core.Deprecated('Use verifyPasswordChangeVerificationCodeResponseDescriptor instead')
const VerifyPasswordChangeVerificationCodeResponse$json = {
  '1': 'VerifyPasswordChangeVerificationCodeResponse',
  '2': [
    {'1': 'verified', '3': 1, '4': 1, '5': 8, '10': 'verified'},
  ],
};

/// Descriptor for `VerifyPasswordChangeVerificationCodeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyPasswordChangeVerificationCodeResponseDescriptor = $convert.base64Decode(
    'CixWZXJpZnlQYXNzd29yZENoYW5nZVZlcmlmaWNhdGlvbkNvZGVSZXNwb25zZRIaCgh2ZXJpZm'
    'llZBgBIAEoCFIIdmVyaWZpZWQ=');

