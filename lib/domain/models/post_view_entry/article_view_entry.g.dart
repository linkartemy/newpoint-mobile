part of 'article_view_entry.dart';

ArticleViewEntry _$ArticleViewEntryFromSqfliteDatabase(
        Map<String, dynamic> map) =>
    ArticleViewEntry(
        id: map['id']?.toInt() ?? 0,
        userId: map['user_id']?.toInt() ?? 0,
        articleId: map['article_id']?.toInt() ?? 0,
        creationTimestamp: DateTime.parse(map['creation_timestamp']));
