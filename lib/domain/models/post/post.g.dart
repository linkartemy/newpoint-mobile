part of 'post.dart';

Post _$PostFromJson(Map<String, dynamic> json) {
  return Post(
      id: json['id'] as int,
      authorId: json['author_id'] as int,
      login: json['login'] as String,
      name: json['name'] as String,
      surname: json['surname'] as String,
      profileImageId: json['profile_image_id'] as int,
      content: json['content'] as String,
      images: json['images'] as String?,
      likes: json['likes'] as int,
      shares: json['shares'] as int,
      comments: json['comments'] as int,
      views: json['views'] as int,
      liked: json['liked'] as bool,
      shared: json['shared'] as bool,
      bookmarked: json['bookmarked'] as bool,
      creationTimestamp:
          parseDateFromString(json['creation_timestamp'] as String?)!);
}

Post _$PostFromModel(PostModel postModel) {
  return Post(
      id: postModel.id.toInt(),
      authorId: postModel.authorId.toInt(),
      login: postModel.login,
      name: postModel.name,
      surname: postModel.surname,
      profileImageId: postModel.profileImageId.toInt(),
      content: postModel.content,
      images: postModel.images,
      likes: postModel.likes,
      shares: postModel.shares,
      comments: postModel.comments,
      views: postModel.views,
      liked: postModel.liked,
      shared: postModel.shared,
      bookmarked: postModel.bookmarked,
      creationTimestamp: postModel.creationTimestamp.toDateTime(toLocal: true));
}

Map<String, dynamic> _$PostToJson(Post post) => <String, dynamic>{
      'id': post.id,
      'author_id': post.authorId,
      'login': post.login,
      'name': post.name,
      'surname': post.surname,
      'profile_image_id': post.profileImageId,
      'content': post.content,
      'images': post.images,
      'likes': post.likes,
      'shares': post.shares,
      'comments': post.comments,
      'views': post.views,
      'liked': post.liked,
      'shared': post.shared,
      'bookmarked': post.bookmarked,
      'creation_timestamp': post.creationTimestamp.toIso8601String()
    };
