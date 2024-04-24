import 'package:json_annotation/json_annotation.dart';
import 'package:newpoint/domain/models/date_parser.dart';

part 'article_view_entry.g.dart';

class ArticleViewEntry {
  final int id;
  final int userId;
  final int articleId;
  @JsonKey(fromJson: parseDateFromString)
  final DateTime creationTimestamp;

  ArticleViewEntry({
    required this.id,
    required this.userId,
    required this.articleId,
    required this.creationTimestamp,
  });

  factory ArticleViewEntry.fromSqflite(Map<String, dynamic> map) =>
      _$ArticleViewEntryFromSqfliteDatabase(map);
}
