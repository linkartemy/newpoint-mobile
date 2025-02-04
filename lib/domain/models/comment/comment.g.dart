part of 'comment.dart';

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return Comment(
    id: json['id'] as int,
    postId: json['post_id'] as int,
    userId: json['user_id'] as int,
    login: json['login'] as String,
    name: json['name'] as String,
    surname: json['surname'] as String,
    content: json['content'] as String,
    likes: json['likes'] as int,
    liked: json['liked'] as bool,
    creationTimestamp:
        parseDateFromString(json['creation_timestamp'] as String?)!,
  );
}

Comment _$CommentFromModel(CommentModel commentModel) {
  return Comment(
      id: commentModel.id.toInt(),
      postId: commentModel.postId.toInt(),
      userId: commentModel.userId.toInt(),
      login: commentModel.login,
      name: commentModel.name,
      surname: commentModel.surname,
      content: commentModel.content,
      likes: commentModel.likes,
      liked: commentModel.liked,
      creationTimestamp: commentModel.creationTimestamp.toDateTime());
}

Map<String, dynamic> _$CommentToJson(Comment comment) => <String, dynamic>{
      'id': comment.id,
      'userId': comment.userId,
      'postId': comment.postId,
      'login': comment.login,
      'name': comment.name,
      'surname': comment.surname,
      'content': comment.content,
      'liked': comment.liked,
      'creation_timestamp': comment.creationTimestamp.toIso8601String(),
    };
