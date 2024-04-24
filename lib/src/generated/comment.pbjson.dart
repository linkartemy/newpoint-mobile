//
//  Generated code. Do not modify.
//  source: comment.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use commentModelDescriptor instead')
const CommentModel$json = {
  '1': 'CommentModel',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 3, '10': 'userId'},
    {'1': 'post_id', '3': 3, '4': 1, '5': 3, '10': 'postId'},
    {'1': 'login', '3': 4, '4': 1, '5': 9, '10': 'login'},
    {'1': 'name', '3': 5, '4': 1, '5': 9, '10': 'name'},
    {'1': 'surname', '3': 6, '4': 1, '5': 9, '10': 'surname'},
    {'1': 'content', '3': 7, '4': 1, '5': 9, '10': 'content'},
    {'1': 'likes', '3': 8, '4': 1, '5': 5, '10': 'likes'},
    {'1': 'liked', '3': 9, '4': 1, '5': 8, '10': 'liked'},
    {
      '1': 'creation_timestamp',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'creationTimestamp'
    },
  ],
};

/// Descriptor for `CommentModel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List commentModelDescriptor = $convert.base64Decode(
    'CgxDb21tZW50TW9kZWwSDgoCaWQYASABKANSAmlkEhcKB3VzZXJfaWQYAiABKANSBnVzZXJJZB'
    'IXCgdwb3N0X2lkGAMgASgDUgZwb3N0SWQSFAoFbG9naW4YBCABKAlSBWxvZ2luEhIKBG5hbWUY'
    'BSABKAlSBG5hbWUSGAoHc3VybmFtZRgGIAEoCVIHc3VybmFtZRIYCgdjb250ZW50GAcgASgJUg'
    'djb250ZW50EhQKBWxpa2VzGAggASgFUgVsaWtlcxIUCgVsaWtlZBgJIAEoCFIFbGlrZWQSSQoS'
    'Y3JlYXRpb25fdGltZXN0YW1wGAogASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIRY3'
    'JlYXRpb25UaW1lc3RhbXA=');

@$core.Deprecated('Use getCommentsByPostIdRequestDescriptor instead')
const GetCommentsByPostIdRequest$json = {
  '1': 'GetCommentsByPostIdRequest',
  '2': [
    {'1': 'post_id', '3': 1, '4': 1, '5': 3, '10': 'postId'},
    {'1': 'last_comment_id', '3': 2, '4': 1, '5': 3, '10': 'lastCommentId'},
  ],
};

/// Descriptor for `GetCommentsByPostIdRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCommentsByPostIdRequestDescriptor =
    $convert.base64Decode(
        'ChpHZXRDb21tZW50c0J5UG9zdElkUmVxdWVzdBIXCgdwb3N0X2lkGAEgASgDUgZwb3N0SWQSJg'
        'oPbGFzdF9jb21tZW50X2lkGAIgASgDUg1sYXN0Q29tbWVudElk');

@$core.Deprecated('Use getCommentsByPostIdResponseDescriptor instead')
const GetCommentsByPostIdResponse$json = {
  '1': 'GetCommentsByPostIdResponse',
  '2': [
    {
      '1': 'comments',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.comment.CommentModel',
      '10': 'comments'
    },
  ],
};

/// Descriptor for `GetCommentsByPostIdResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCommentsByPostIdResponseDescriptor =
    $convert.base64Decode(
        'ChtHZXRDb21tZW50c0J5UG9zdElkUmVzcG9uc2USMQoIY29tbWVudHMYASADKAsyFS5jb21tZW'
        '50LkNvbW1lbnRNb2RlbFIIY29tbWVudHM=');

@$core.Deprecated('Use getCommentByIdRequestDescriptor instead')
const GetCommentByIdRequest$json = {
  '1': 'GetCommentByIdRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
  ],
};

/// Descriptor for `GetCommentByIdRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCommentByIdRequestDescriptor = $convert
    .base64Decode('ChVHZXRDb21tZW50QnlJZFJlcXVlc3QSDgoCaWQYASABKANSAmlk');

@$core.Deprecated('Use getCommentByIdResponseDescriptor instead')
const GetCommentByIdResponse$json = {
  '1': 'GetCommentByIdResponse',
  '2': [
    {
      '1': 'comment',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.comment.CommentModel',
      '10': 'comment'
    },
  ],
};

/// Descriptor for `GetCommentByIdResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCommentByIdResponseDescriptor =
    $convert.base64Decode(
        'ChZHZXRDb21tZW50QnlJZFJlc3BvbnNlEi8KB2NvbW1lbnQYASABKAsyFS5jb21tZW50LkNvbW'
        '1lbnRNb2RlbFIHY29tbWVudA==');

@$core.Deprecated('Use addCommentRequestDescriptor instead')
const AddCommentRequest$json = {
  '1': 'AddCommentRequest',
  '2': [
    {'1': 'post_id', '3': 1, '4': 1, '5': 3, '10': 'postId'},
    {'1': 'content', '3': 2, '4': 1, '5': 9, '10': 'content'},
  ],
};

/// Descriptor for `AddCommentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addCommentRequestDescriptor = $convert.base64Decode(
    'ChFBZGRDb21tZW50UmVxdWVzdBIXCgdwb3N0X2lkGAEgASgDUgZwb3N0SWQSGAoHY29udGVudB'
    'gCIAEoCVIHY29udGVudA==');

@$core.Deprecated('Use addCommentResponseDescriptor instead')
const AddCommentResponse$json = {
  '1': 'AddCommentResponse',
  '2': [
    {'1': 'added', '3': 1, '4': 1, '5': 8, '10': 'added'},
  ],
};

/// Descriptor for `AddCommentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addCommentResponseDescriptor = $convert
    .base64Decode('ChJBZGRDb21tZW50UmVzcG9uc2USFAoFYWRkZWQYASABKAhSBWFkZGVk');

@$core.Deprecated('Use deleteCommentRequestDescriptor instead')
const DeleteCommentRequest$json = {
  '1': 'DeleteCommentRequest',
  '2': [
    {'1': 'comment_id', '3': 1, '4': 1, '5': 3, '10': 'commentId'},
  ],
};

/// Descriptor for `DeleteCommentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteCommentRequestDescriptor = $convert.base64Decode(
    'ChREZWxldGVDb21tZW50UmVxdWVzdBIdCgpjb21tZW50X2lkGAEgASgDUgljb21tZW50SWQ=');

@$core.Deprecated('Use deleteCommentResponseDescriptor instead')
const DeleteCommentResponse$json = {
  '1': 'DeleteCommentResponse',
  '2': [
    {'1': 'deleted', '3': 1, '4': 1, '5': 8, '10': 'deleted'},
  ],
};

/// Descriptor for `DeleteCommentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteCommentResponseDescriptor =
    $convert.base64Decode(
        'ChVEZWxldGVDb21tZW50UmVzcG9uc2USGAoHZGVsZXRlZBgBIAEoCFIHZGVsZXRlZA==');

@$core.Deprecated('Use likeCommentRequestDescriptor instead')
const LikeCommentRequest$json = {
  '1': 'LikeCommentRequest',
  '2': [
    {'1': 'comment_id', '3': 1, '4': 1, '5': 3, '10': 'commentId'},
  ],
};

/// Descriptor for `LikeCommentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List likeCommentRequestDescriptor =
    $convert.base64Decode(
        'ChJMaWtlQ29tbWVudFJlcXVlc3QSHQoKY29tbWVudF9pZBgBIAEoA1IJY29tbWVudElk');

@$core.Deprecated('Use likeCommentResponseDescriptor instead')
const LikeCommentResponse$json = {
  '1': 'LikeCommentResponse',
  '2': [
    {'1': 'liked', '3': 1, '4': 1, '5': 8, '10': 'liked'},
  ],
};

/// Descriptor for `LikeCommentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List likeCommentResponseDescriptor =
    $convert.base64Decode(
        'ChNMaWtlQ29tbWVudFJlc3BvbnNlEhQKBWxpa2VkGAEgASgIUgVsaWtlZA==');

@$core.Deprecated('Use unLikeCommentRequestDescriptor instead')
const UnLikeCommentRequest$json = {
  '1': 'UnLikeCommentRequest',
  '2': [
    {'1': 'comment_id', '3': 1, '4': 1, '5': 3, '10': 'commentId'},
  ],
};

/// Descriptor for `UnLikeCommentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List unLikeCommentRequestDescriptor = $convert.base64Decode(
    'ChRVbkxpa2VDb21tZW50UmVxdWVzdBIdCgpjb21tZW50X2lkGAEgASgDUgljb21tZW50SWQ=');

@$core.Deprecated('Use unLikeCommentResponseDescriptor instead')
const UnLikeCommentResponse$json = {
  '1': 'UnLikeCommentResponse',
  '2': [
    {'1': 'liked', '3': 1, '4': 1, '5': 8, '10': 'liked'},
  ],
};

/// Descriptor for `UnLikeCommentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List unLikeCommentResponseDescriptor =
    $convert.base64Decode(
        'ChVVbkxpa2VDb21tZW50UmVzcG9uc2USFAoFbGlrZWQYASABKAhSBWxpa2Vk');
