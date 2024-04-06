import 'dart:convert';
import 'dart:typed_data';

import 'package:newpoint/domain/data_providers/database/database_data_provider.dart';
import 'package:sqflite/sqflite.dart';

class ImageTable {
  final tableName = 'image';

  Future<void> createTable(Database database) async {
    await database.execute("""CREATE TABLE IF NOT EXISTS $tableName (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    image_id BIGINT NOT NULL,
    data VARCHAR(255) NOT NULL,
    creation_timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    );""");
  }

  Future<int> create({required int imageId, required Uint8List data}) async {
    final database = await DatabaseDataProvider().database;
    return await database.rawInsert(
        """INSERT INTO $tableName (image_id, data, creation_timestamp) VALUES (?, ?, CURRENT_TIMESTAMP)""",
        [imageId, base64Encode(data)]);
  }

  Future<int> countByImageId({required int imageId}) async {
    final database = await DatabaseDataProvider().database;
    return Sqflite.firstIntValue(await database.rawQuery(
        """SELECT COUNT(*) FROM $tableName WHERE image_id = ?""", [imageId]))!;
  }

  Future<Uint8List> getByImageId({required int imageId}) async {
    final database = await DatabaseDataProvider().database;
    return (await database.rawQuery(
            """SELECT * FROM $tableName WHERE image_id = ?""", [imageId]))
        .map((map) =>
            const Base64Decoder().convert(map["data"]?.toString() ?? ""))
        .first;
  }

  Future<void> clear() async {
    final database = await DatabaseDataProvider().database;
    await database.execute(
        """DELETE FROM $tableName WHERE creation_timestamp < DATE('now', '-7 days');""");
  }
}
