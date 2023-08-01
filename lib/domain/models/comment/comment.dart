import 'package:json_annotation/json_annotation.dart';
import 'package:newpoint/domain/models/date_parser.dart';
import 'package:newpoint/protos.dart';

part 'comment.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Comment {
  final int id;
  final int postId;
  final int userId;
  final String login;
  final String name;
  final String surname;
  final String content;
  int likes;
  bool liked;
  @JsonKey(fromJson: parsePostDateFromString)
  final DateTime creationTimestamp;

  Comment({
    required this.id,
    required this.postId,
    required this.userId,
    required this.login,
    required this.name,
    required this.surname,
    required this.content,
    required this.likes,
    required this.liked,
    required this.creationTimestamp,
  });

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
  factory Comment.fromModel(CommentModel commentModel) =>
      _$CommentFromModel(commentModel);

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
