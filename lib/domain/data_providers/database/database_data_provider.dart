import 'package:newpoint/domain/data_providers/database/article_view_table.dart';
import 'package:newpoint/domain/data_providers/database/blacklist_table.dart';
import 'package:newpoint/domain/data_providers/database/image_table.dart';
import 'package:newpoint/domain/data_providers/database/post_view_table.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseDataProvider {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initialize();
    return _database!;
  }

  Future<String> get fullPath async {
    const name = 'newpoint.db';
    final path = await getDatabasesPath();
    return join(path, name);
  }

  Future<Database> _initialize() async {
    final path = await fullPath;
    var database = await openDatabase(path,
        version: 1, onCreate: create, singleInstance: true);
    return database;
  }

  Future<void> create(Database database, int version) async {
    await ArticleViewEntryTable().createTable(database);
    await PostViewEntryTable().createTable(database);
    await ImageTable().createTable(database);
    await BlacklistTable().createTable(database);
  }

  Future<void> clearTables() async {
    await ArticleViewEntryTable().clear();
    await PostViewEntryTable().clear();
    await ImageTable().clear();
  }

  Future<void> deleteDatabase() async =>
      databaseFactory.deleteDatabase(await fullPath);
}
