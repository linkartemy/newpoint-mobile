//
//  Generated code. Do not modify.
//  source: post.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use postModelDescriptor instead')
const PostModel$json = {
  '1': 'PostModel',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'author_id', '3': 2, '4': 1, '5': 3, '10': 'authorId'},
    {'1': 'login', '3': 3, '4': 1, '5': 9, '10': 'login'},
    {'1': 'name', '3': 4, '4': 1, '5': 9, '10': 'name'},
    {'1': 'surname', '3': 5, '4': 1, '5': 9, '10': 'surname'},
    {'1': 'profile_image_id', '3': 6, '4': 1, '5': 3, '10': 'profileImageId'},
    {'1': 'content', '3': 7, '4': 1, '5': 9, '10': 'content'},
    {'1': 'images', '3': 8, '4': 1, '5': 9, '10': 'images'},
    {'1': 'likes', '3': 9, '4': 1, '5': 5, '10': 'likes'},
    {'1': 'shares', '3': 10, '4': 1, '5': 5, '10': 'shares'},
    {'1': 'comments', '3': 11, '4': 1, '5': 5, '10': 'comments'},
    {'1': 'views', '3': 12, '4': 1, '5': 5, '10': 'views'},
    {'1': 'liked', '3': 13, '4': 1, '5': 8, '10': 'liked'},
    {'1': 'creation_timestamp', '3': 14, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'creationTimestamp'},
  ],
};

/// Descriptor for `PostModel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List postModelDescriptor = $convert.base64Decode(
    'CglQb3N0TW9kZWwSDgoCaWQYASABKANSAmlkEhsKCWF1dGhvcl9pZBgCIAEoA1IIYXV0aG9ySW'
    'QSFAoFbG9naW4YAyABKAlSBWxvZ2luEhIKBG5hbWUYBCABKAlSBG5hbWUSGAoHc3VybmFtZRgF'
    'IAEoCVIHc3VybmFtZRIoChBwcm9maWxlX2ltYWdlX2lkGAYgASgDUg5wcm9maWxlSW1hZ2VJZB'
    'IYCgdjb250ZW50GAcgASgJUgdjb250ZW50EhYKBmltYWdlcxgIIAEoCVIGaW1hZ2VzEhQKBWxp'
    'a2VzGAkgASgFUgVsaWtlcxIWCgZzaGFyZXMYCiABKAVSBnNoYXJlcxIaCghjb21tZW50cxgLIA'
    'EoBVIIY29tbWVudHMSFAoFdmlld3MYDCABKAVSBXZpZXdzEhQKBWxpa2VkGA0gASgIUgVsaWtl'
    'ZBJJChJjcmVhdGlvbl90aW1lc3RhbXAYDiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW'
    '1wUhFjcmVhdGlvblRpbWVzdGFtcA==');

@$core.Deprecated('Use addPostRequestDescriptor instead')
const AddPostRequest$json = {
  '1': 'AddPostRequest',
  '2': [
    {'1': 'author_id', '3': 1, '4': 1, '5': 3, '10': 'authorId'},
    {'1': 'content', '3': 2, '4': 1, '5': 9, '10': 'content'},
  ],
};

/// Descriptor for `AddPostRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addPostRequestDescriptor = $convert.base64Decode(
    'Cg5BZGRQb3N0UmVxdWVzdBIbCglhdXRob3JfaWQYASABKANSCGF1dGhvcklkEhgKB2NvbnRlbn'
    'QYAiABKAlSB2NvbnRlbnQ=');

@$core.Deprecated('Use addPostResponseDescriptor instead')
const AddPostResponse$json = {
  '1': 'AddPostResponse',
};

/// Descriptor for `AddPostResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addPostResponseDescriptor = $convert.base64Decode(
    'Cg9BZGRQb3N0UmVzcG9uc2U=');

@$core.Deprecated('Use getPostsRequestDescriptor instead')
const GetPostsRequest$json = {
  '1': 'GetPostsRequest',
};

/// Descriptor for `GetPostsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPostsRequestDescriptor = $convert.base64Decode(
    'Cg9HZXRQb3N0c1JlcXVlc3Q=');

@$core.Deprecated('Use getPostsResponseDescriptor instead')
const GetPostsResponse$json = {
  '1': 'GetPostsResponse',
  '2': [
    {'1': 'posts', '3': 1, '4': 3, '5': 11, '6': '.post.PostModel', '10': 'posts'},
  ],
};

/// Descriptor for `GetPostsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPostsResponseDescriptor = $convert.base64Decode(
    'ChBHZXRQb3N0c1Jlc3BvbnNlEiUKBXBvc3RzGAEgAygLMg8ucG9zdC5Qb3N0TW9kZWxSBXBvc3'
    'Rz');

@$core.Deprecated('Use getPostsByUserIdRequestDescriptor instead')
const GetPostsByUserIdRequest$json = {
  '1': 'GetPostsByUserIdRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 3, '10': 'userId'},
  ],
};

/// Descriptor for `GetPostsByUserIdRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPostsByUserIdRequestDescriptor = $convert.base64Decode(
    'ChdHZXRQb3N0c0J5VXNlcklkUmVxdWVzdBIXCgd1c2VyX2lkGAEgASgDUgZ1c2VySWQ=');

@$core.Deprecated('Use getPostsByUserIdResponseDescriptor instead')
const GetPostsByUserIdResponse$json = {
  '1': 'GetPostsByUserIdResponse',
  '2': [
    {'1': 'posts', '3': 1, '4': 3, '5': 11, '6': '.post.PostModel', '10': 'posts'},
  ],
};

/// Descriptor for `GetPostsByUserIdResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPostsByUserIdResponseDescriptor = $convert.base64Decode(
    'ChhHZXRQb3N0c0J5VXNlcklkUmVzcG9uc2USJQoFcG9zdHMYASADKAsyDy5wb3N0LlBvc3RNb2'
    'RlbFIFcG9zdHM=');

@$core.Deprecated('Use getPostByIdRequestDescriptor instead')
const GetPostByIdRequest$json = {
  '1': 'GetPostByIdRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
  ],
};

/// Descriptor for `GetPostByIdRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPostByIdRequestDescriptor = $convert.base64Decode(
    'ChJHZXRQb3N0QnlJZFJlcXVlc3QSDgoCaWQYASABKANSAmlk');

@$core.Deprecated('Use getPostByIdResponseDescriptor instead')
const GetPostByIdResponse$json = {
  '1': 'GetPostByIdResponse',
  '2': [
    {'1': 'post', '3': 1, '4': 1, '5': 11, '6': '.post.PostModel', '10': 'post'},
  ],
};

/// Descriptor for `GetPostByIdResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPostByIdResponseDescriptor = $convert.base64Decode(
    'ChNHZXRQb3N0QnlJZFJlc3BvbnNlEiMKBHBvc3QYASABKAsyDy5wb3N0LlBvc3RNb2RlbFIEcG'
    '9zdA==');

@$core.Deprecated('Use likePostRequestDescriptor instead')
const LikePostRequest$json = {
  '1': 'LikePostRequest',
  '2': [
    {'1': 'post_id', '3': 1, '4': 1, '5': 3, '10': 'postId'},
  ],
};

/// Descriptor for `LikePostRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List likePostRequestDescriptor = $convert.base64Decode(
    'Cg9MaWtlUG9zdFJlcXVlc3QSFwoHcG9zdF9pZBgBIAEoA1IGcG9zdElk');

@$core.Deprecated('Use likePostResponseDescriptor instead')
const LikePostResponse$json = {
  '1': 'LikePostResponse',
  '2': [
    {'1': 'liked', '3': 1, '4': 1, '5': 8, '10': 'liked'},
  ],
};

/// Descriptor for `LikePostResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List likePostResponseDescriptor = $convert.base64Decode(
    'ChBMaWtlUG9zdFJlc3BvbnNlEhQKBWxpa2VkGAEgASgIUgVsaWtlZA==');

@$core.Deprecated('Use unLikePostRequestDescriptor instead')
const UnLikePostRequest$json = {
  '1': 'UnLikePostRequest',
  '2': [
    {'1': 'post_id', '3': 1, '4': 1, '5': 3, '10': 'postId'},
  ],
};

/// Descriptor for `UnLikePostRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List unLikePostRequestDescriptor = $convert.base64Decode(
    'ChFVbkxpa2VQb3N0UmVxdWVzdBIXCgdwb3N0X2lkGAEgASgDUgZwb3N0SWQ=');

@$core.Deprecated('Use unLikePostResponseDescriptor instead')
const UnLikePostResponse$json = {
  '1': 'UnLikePostResponse',
  '2': [
    {'1': 'liked', '3': 1, '4': 1, '5': 8, '10': 'liked'},
  ],
};

/// Descriptor for `UnLikePostResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List unLikePostResponseDescriptor = $convert.base64Decode(
    'ChJVbkxpa2VQb3N0UmVzcG9uc2USFAoFbGlrZWQYASABKAhSBWxpa2Vk');

@$core.Deprecated('Use sharePostRequestDescriptor instead')
const SharePostRequest$json = {
  '1': 'SharePostRequest',
  '2': [
    {'1': 'post_id', '3': 1, '4': 1, '5': 3, '10': 'postId'},
  ],
};

/// Descriptor for `SharePostRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sharePostRequestDescriptor = $convert.base64Decode(
    'ChBTaGFyZVBvc3RSZXF1ZXN0EhcKB3Bvc3RfaWQYASABKANSBnBvc3RJZA==');

@$core.Deprecated('Use sharePostResponseDescriptor instead')
const SharePostResponse$json = {
  '1': 'SharePostResponse',
  '2': [
    {'1': 'shared', '3': 1, '4': 1, '5': 8, '10': 'shared'},
  ],
};

/// Descriptor for `SharePostResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sharePostResponseDescriptor = $convert.base64Decode(
    'ChFTaGFyZVBvc3RSZXNwb25zZRIWCgZzaGFyZWQYASABKAhSBnNoYXJlZA==');

@$core.Deprecated('Use addPostViewRequestDescriptor instead')
const AddPostViewRequest$json = {
  '1': 'AddPostViewRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 3, '10': 'userId'},
    {'1': 'post_id', '3': 2, '4': 1, '5': 3, '10': 'postId'},
  ],
};

/// Descriptor for `AddPostViewRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addPostViewRequestDescriptor = $convert.base64Decode(
    'ChJBZGRQb3N0Vmlld1JlcXVlc3QSFwoHdXNlcl9pZBgBIAEoA1IGdXNlcklkEhcKB3Bvc3RfaW'
    'QYAiABKANSBnBvc3RJZA==');

@$core.Deprecated('Use addPostViewResponseDescriptor instead')
const AddPostViewResponse$json = {
  '1': 'AddPostViewResponse',
  '2': [
    {'1': 'views', '3': 1, '4': 1, '5': 3, '10': 'views'},
  ],
};

/// Descriptor for `AddPostViewResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addPostViewResponseDescriptor = $convert.base64Decode(
    'ChNBZGRQb3N0Vmlld1Jlc3BvbnNlEhQKBXZpZXdzGAEgASgDUgV2aWV3cw==');

