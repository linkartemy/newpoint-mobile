import 'package:json_annotation/json_annotation.dart';
import 'package:newpoint/domain/models/date_parser.dart';

part 'post_view_entry.g.dart';

class PostViewEntry {
  final int id;
  final int userId;
  final int postId;
  @JsonKey(fromJson: parseDateFromString)
  final DateTime creationTimestamp;

  PostViewEntry({
    required this.id,
    required this.userId,
    required this.postId,
    required this.creationTimestamp,
  });

  factory PostViewEntry.fromSqflite(Map<String, dynamic> map) => _$PostViewEntryFromSqfliteDatabase(map);
}