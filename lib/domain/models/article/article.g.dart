part of 'article.dart';

Article _$ArticleFromJson(Map<String, dynamic> json) {
  return Article(
    id: json['id'] as int,
    authorId: json['author_id'] as int,
    login: json['login'] as String,
    name: json['name'] as String,
    surname: json['surname'] as String,
    profileImageId: json['profile_image_id'] as int,
    title: json['title'] as String,
    content: json['content'] as String,
    images: json['images'] as String?,
    likes: json['likes'] as int,
    shares: json['shares'] as int,
    comments: json['comments'] as int,
    views: json['views'] as int,
    liked: json['liked'] as bool,
    creationTimestamp:
        parseDateFromString(json['creation_timestamp'] as String?)!,
  );
}

Article _$ArticleFromModel(ArticleModel articleModel) {
  return Article(
      id: articleModel.id.toInt(),
      authorId: articleModel.authorId.toInt(),
      login: articleModel.login,
      name: articleModel.name,
      surname: articleModel.surname,
      profileImageId: articleModel.profileImageId.toInt(),
      title: articleModel.title,
      content: articleModel.content,
      images: articleModel.images,
      likes: articleModel.likes,
      shares: articleModel.shares,
      comments: articleModel.comments,
      views: articleModel.views,
      liked: articleModel.liked,
      creationTimestamp:
          articleModel.creationTimestamp.toDateTime(toLocal: true));
}

Map<String, dynamic> _$ArticleToJson(Article article) => <String, dynamic>{
      'id': article.id,
      'author_id': article.authorId,
      'login': article.login,
      'name': article.name,
      'surname': article.surname,
      'profile_image_id': article.profileImageId,
      'title': article.title,
      'content': article.content,
      'images': article.images,
      'likes': article.likes,
      'shares': article.shares,
      'comments': article.comments,
      'views': article.views,
      'liked': article.liked,
      'creation_timestamp': article.creationTimestamp.toIso8601String(),
    };

extension NullableArticleParser on NullableArticle {
  ArticleModel? parseNullable() {
    return hasData() ? data : null;
  }
}