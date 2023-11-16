part of 'post_view_entry.dart';

PostViewEntry _$PostViewEntryFromSqfliteDatabase(Map<String, dynamic> map) => PostViewEntry(
    id: map['id']?.toInt() ?? 0,
    userId: map['user_id']?.toInt() ?? 0,
    postId: map['post_id']?.toInt() ?? 0,
    creationTimestamp: DateTime.parse(map['creation_timestamp'])
  );