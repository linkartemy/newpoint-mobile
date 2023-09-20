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
  ],
};

/// Descriptor for `ImageModel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageModelDescriptor = $convert.base64Decode(
    'CgpJbWFnZU1vZGVsEg4KAmlkGAEgASgDUgJpZBISCgRkYXRhGAIgASgMUgRkYXRh');

@$core.Deprecated('Use getImageByIdRequestDescriptor instead')
const GetImageByIdRequest$json = {
  '1': 'GetImageByIdRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
  ],
};

/// Descriptor for `GetImageByIdRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getImageByIdRequestDescriptor = $convert.base64Decode(
    'ChNHZXRJbWFnZUJ5SWRSZXF1ZXN0Eg4KAmlkGAEgASgDUgJpZA==');

@$core.Deprecated('Use getImageByIdResponseDescriptor instead')
const GetImageByIdResponse$json = {
  '1': 'GetImageByIdResponse',
  '2': [
    {'1': 'image', '3': 1, '4': 1, '5': 11, '6': '.image.ImageModel', '10': 'image'},
  ],
};

/// Descriptor for `GetImageByIdResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getImageByIdResponseDescriptor = $convert.base64Decode(
    'ChRHZXRJbWFnZUJ5SWRSZXNwb25zZRInCgVpbWFnZRgBIAEoCzIRLmltYWdlLkltYWdlTW9kZW'
    'xSBWltYWdl');

@$core.Deprecated('Use addImageRequestDescriptor instead')
const AddImageRequest$json = {
  '1': 'AddImageRequest',
  '2': [
    {'1': 'data', '3': 1, '4': 1, '5': 12, '10': 'data'},
  ],
};

/// Descriptor for `AddImageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addImageRequestDescriptor = $convert.base64Decode(
    'Cg9BZGRJbWFnZVJlcXVlc3QSEgoEZGF0YRgBIAEoDFIEZGF0YQ==');

@$core.Deprecated('Use addImageResponseDescriptor instead')
const AddImageResponse$json = {
  '1': 'AddImageResponse',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
  ],
};

/// Descriptor for `AddImageResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addImageResponseDescriptor = $convert.base64Decode(
    'ChBBZGRJbWFnZVJlc3BvbnNlEg4KAmlkGAEgASgDUgJpZA==');

