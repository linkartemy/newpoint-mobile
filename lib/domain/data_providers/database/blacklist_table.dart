import 'package:newpoint/domain/data_providers/database/database_data_provider.dart';
import 'package:newpoint/domain/models/post_view_entry/post_view_entry.dart';
import 'package:sqflite/sqflite.dart';

class BlacklistTable {
  final tableName = 'blacklist';

  Future<void> createTable(Database database) async {
    await database.execute("""CREATE TABLE IF NOT EXISTS $tableName (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id BIGINT NOT NULL,
    creation_timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    );""");
  }

  Future<int> create({required int userId}) async {
    final database = await DatabaseDataProvider().database;
    return await database.rawInsert(
        """INSERT INTO $tableName (user_id, creation_timestamp) VALUES (?, CURRENT_TIMESTAMP)""",
        [userId]);
  }

  Future<List<int>> getAll() async {
    final database = await DatabaseDataProvider().database;
    return (await database.rawQuery("""SELECT * FROM $tableName"""))
        .map((map) => map["user_id"] as int)
        .toList();
  }

  Future<int> countByUserId({required int userId}) async {
    final database = await DatabaseDataProvider().database;
    return Sqflite.firstIntValue(await database.rawQuery(
        """SELECT COUNT(*) FROM $tableName WHERE user_id = ?""", [userId]))!;
  }

  Future<void> remove({required int userId}) async {
    final database = await DatabaseDataProvider().database;
    await database
        .rawDelete("""DELETE FROM $tableName WHERE user_id = ?""", [userId]);
  }

  Future<void> clear() async {
    final database = await DatabaseDataProvider().database;
    await database.execute(
        """DELETE FROM $tableName WHERE creation_timestamp < DATE('now', '-1 days');""");
  }
}
