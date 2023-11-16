import 'package:newpoint/domain/data_providers/database/database_data_provider.dart';
import 'package:newpoint/domain/models/post_view_entry/post_view_entry.dart';
import 'package:sqflite/sqflite.dart';

class PostViewEntryTable {
  final tableName = 'post_view_entry';

  Future<void> createTable(Database database) async {
    await database.execute("""CREATE TABLE IF NOT EXISTS $tableName (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id BIGINT NOT NULL,
    post_id BIGINT NOT NULL,
    creation_timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    );""");
  }

  Future<int> create({required int userId, required int postId}) async {
    final database = await DatabaseDataProvider().database;
    return await database.rawInsert("""INSERT INTO $tableName (user_id, post_id, creation_timestamp) VALUES (?, ?, CURRENT_TIMESTAMP)""", [userId, postId]);
  }

  Future<List<PostViewEntry>> getAllByUserId({required int userId}) async {
    final database = await DatabaseDataProvider().database;
    return (await database.rawQuery("""SELECT * FROM $tableName WHERE user_id = ?""", [userId])).map((view) => PostViewEntry.fromSqflite(view)).toList();
  }

  Future<void> clear() async {
    final database = await DatabaseDataProvider().database;
    await database.execute("""DELETE FROM $tableName WHERE creation_timestamp < DATE('now', '-1 days');""");
  }
}