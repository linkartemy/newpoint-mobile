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

@$core.Deprecated('Use addEmailCodeRequestDescriptor instead')
const AddEmailCodeRequest$json = {
  '1': 'AddEmailCodeRequest',
  '2': [
    {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
  ],
};

/// Descriptor for `AddEmailCodeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addEmailCodeRequestDescriptor = $convert.base64Decode(
    'ChNBZGRFbWFpbENvZGVSZXF1ZXN0EhQKBWVtYWlsGAIgASgJUgVlbWFpbA==');

@$core.Deprecated('Use addEmailCodeResponseDescriptor instead')
const AddEmailCodeResponse$json = {
  '1': 'AddEmailCodeResponse',
  '2': [
    {'1': 'sent', '3': 1, '4': 1, '5': 8, '10': 'sent'},
  ],
};

/// Descriptor for `AddEmailCodeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addEmailCodeResponseDescriptor = $convert.base64Decode(
    'ChRBZGRFbWFpbENvZGVSZXNwb25zZRISCgRzZW50GAEgASgIUgRzZW50');

@$core.Deprecated('Use verifyEmailCodeRequestDescriptor instead')
const VerifyEmailCodeRequest$json = {
  '1': 'VerifyEmailCodeRequest',
  '2': [
    {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    {'1': 'code', '3': 3, '4': 1, '5': 9, '10': 'code'},
  ],
};

/// Descriptor for `VerifyEmailCodeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyEmailCodeRequestDescriptor = $convert.base64Decode(
    'ChZWZXJpZnlFbWFpbENvZGVSZXF1ZXN0EhQKBWVtYWlsGAIgASgJUgVlbWFpbBISCgRjb2RlGA'
    'MgASgJUgRjb2Rl');

@$core.Deprecated('Use verifyEmailCodeResponseDescriptor instead')
const VerifyEmailCodeResponse$json = {
  '1': 'VerifyEmailCodeResponse',
  '2': [
    {'1': 'verified', '3': 1, '4': 1, '5': 8, '10': 'verified'},
  ],
};

/// Descriptor for `VerifyEmailCodeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyEmailCodeResponseDescriptor = $convert.base64Decode(
    'ChdWZXJpZnlFbWFpbENvZGVSZXNwb25zZRIaCgh2ZXJpZmllZBgBIAEoCFIIdmVyaWZpZWQ=');

