//
//  Generated code. Do not modify.
//  source: image.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use imageModelDescriptor instead')
const ImageModel$json = {
  '1': 'ImageModel',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'data', '3': 2, '4': 1, '5': 12, '10': 'data'},
    {'1': 'bucket_name', '3': 3, '4': 1, '5': 9, '10': 'bucketName'},
    {'1': 'name', '3': 4, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `ImageModel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageModelDescriptor = $convert.base64Decode(
    'CgpJbWFnZU1vZGVsEg4KAmlkGAEgASgDUgJpZBISCgRkYXRhGAIgASgMUgRkYXRhEh8KC2J1Y2'
    'tldF9uYW1lGAMgASgJUgpidWNrZXROYW1lEhIKBG5hbWUYBCABKAlSBG5hbWU=');

@$core.Deprecated('Use getImageByIdRequestDescriptor instead')
const GetImageByIdRequest$json = {
  '1': 'GetImageByIdRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
  ],
};

/// Descriptor for `GetImageByIdRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getImageByIdRequestDescriptor = $convert
    .base64Decode('ChNHZXRJbWFnZUJ5SWRSZXF1ZXN0Eg4KAmlkGAEgASgDUgJpZA==');

@$core.Deprecated('Use getImageByIdResponseDescriptor instead')
const GetImageByIdResponse$json = {
  '1': 'GetImageByIdResponse',
  '2': [
    {
      '1': 'image',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.image.ImageModel',
      '10': 'image'
    },
  ],
};

/// Descriptor for `GetImageByIdResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getImageByIdResponseDescriptor = $convert.base64Decode(
    'ChRHZXRJbWFnZUJ5SWRSZXNwb25zZRInCgVpbWFnZRgBIAEoCzIRLmltYWdlLkltYWdlTW9kZW'
    'xSBWltYWdl');
