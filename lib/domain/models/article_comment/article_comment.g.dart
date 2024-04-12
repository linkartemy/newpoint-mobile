part of 'article_comment.dart';

ArticleComment _$ArticleCommentFromJson(Map<String, dynamic> json) {
  return ArticleComment(
    id: json['id'] as int,
    articleId: json['post_id'] as int,
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

ArticleComment _$ArticleCommentFromModel(ArticleCommentModel commentModel) {
  return ArticleComment(
      id: commentModel.id.toInt(),
      articleId: commentModel.articleId.toInt(),
      userId: commentModel.userId.toInt(),
      login: commentModel.login,
      name: commentModel.name,
      surname: commentModel.surname,
      content: commentModel.content,
      likes: commentModel.likes,
      liked: commentModel.liked,
      creationTimestamp: commentModel.creationTimestamp.toDateTime());
}

Map<String, dynamic> _$ArticleCommentToJson(ArticleComment comment) => <String, dynamic>{
      'id': comment.id,
      'userId': comment.userId,
      'articleId': comment.articleId,
      'login': comment.login,
      'name': comment.name,
      'surname': comment.surname,
      'content': comment.content,
      'liked': comment.liked,
      'creation_timestamp': comment.creationTimestamp.toIso8601String(),
    };
