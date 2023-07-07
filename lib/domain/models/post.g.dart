part of 'post.dart';

Post _$PostFromJson(Map<String, dynamic> json) {
  return Post(
    id: json['id'] as int,
    authorId: json['author_id'] as int,
    login: json['login'] as String,
    name: json['name'] as String,
    surname: json['surname'] as String,
    content: json['content'] as String,
    images: json['images'] as String?,
    creationTimestamp: parsePostDateFromString(json['creation_timestamp'] as String?)!,
  );
}

Map<String, dynamic> _$PostToJson(Post post) => <String, dynamic>{
  'id': post.id,
  'author_id': post.authorId,
  'login': post.login,
  'name': post.name,
  'surname': post.surname,
  'content': post.content,
  'images': post.images,
  'creation_timestamp': post.creationTimestamp.toIso8601String(),
};