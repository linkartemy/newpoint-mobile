import 'package:json_annotation/json_annotation.dart';
import 'package:newpoint/domain/models/date_parser.dart';
import 'package:newpoint/protos.dart';

part 'article_comment.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ArticleComment {
  final int id;
  final int articleId;
  final int userId;
  final String login;
  final String name;
  final String surname;
  final String content;
  int likes;
  bool liked;
  @JsonKey(fromJson: parseDateFromString)
  final DateTime creationTimestamp;

  ArticleComment({
    required this.id,
    required this.articleId,
    required this.userId,
    required this.login,
    required this.name,
    required this.surname,
    required this.content,
    required this.likes,
    required this.liked,
    required this.creationTimestamp,
  });

  factory ArticleComment.fromJson(Map<String, dynamic> json) =>
      _$ArticleCommentFromJson(json);
  factory ArticleComment.fromModel(ArticleCommentModel commentModel) =>
      _$ArticleCommentFromModel(commentModel);

  Map<String, dynamic> toJson() => _$ArticleCommentToJson(this);
}
