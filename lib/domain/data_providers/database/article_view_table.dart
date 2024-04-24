import 'package:newpoint/domain/data_providers/database/database_data_provider.dart';
import 'package:newpoint/domain/models/post_view_entry/article_view_entry.dart';
import 'package:sqflite/sqflite.dart';

class ArticleViewEntryTable {
  final tableName = 'article_view_entry';

  Future<void> createTable(Database database) async {
    await database.execute("""CREATE TABLE IF NOT EXISTS $tableName (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id BIGINT NOT NULL,
    article_id BIGINT NOT NULL,
    creation_timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    );""");
  }

  Future<int> create({required int userId, required int articleId}) async {
    final database = await DatabaseDataProvider().database;
    return await database.rawInsert("""INSERT INTO $tableName (user_id, article_id, creation_timestamp) VALUES (?, ?, CURRENT_TIMESTAMP)""", [userId, articleId]);
  }

  Future<List<ArticleViewEntry>> getAllByUserId({required int userId}) async {
    final database = await DatabaseDataProvider().database;
    return (await database.rawQuery("""SELECT * FROM $tableName WHERE user_id = ?""", [userId])).map((view) => ArticleViewEntry.fromSqflite(view)).toList();
  }

  Future<void> clear() async {
    final database = await DatabaseDataProvider().database;
    await database.execute("""DELETE FROM $tableName WHERE creation_timestamp < DATE('now', '-1 days');""");
  }
}