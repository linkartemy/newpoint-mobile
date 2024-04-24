import 'package:json_annotation/json_annotation.dart';
import 'package:newpoint/domain/models/date_parser.dart';
import 'package:newpoint/domain/models/feed_element/feed_element.dart';
import 'package:newpoint/protos.dart';

part 'post.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Post implements FeedEntry {
  final int id;
  final int authorId;
  final String login;
  final String name;
  final String surname;
  final int profileImageId;
  final String content;
  final String? images;
  int likes;
  int shares;
  int comments;
  int views;
  bool liked;
  bool shared;
  bool bookmarked;
  @JsonKey(fromJson: parseDateFromString)
  final DateTime creationTimestamp;

  Post(
      {required this.id,
      required this.authorId,
      required this.login,
      required this.name,
      required this.surname,
      required this.profileImageId,
      required this.content,
      required this.images,
      required this.likes,
      required this.shares,
      required this.comments,
      required this.views,
      required this.liked,
      required this.shared,
      required this.bookmarked,
      required this.creationTimestamp});

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  factory Post.fromModel(PostModel postModel) => _$PostFromModel(postModel);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}
