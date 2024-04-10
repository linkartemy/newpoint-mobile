import 'dart:typed_data';

import 'package:newpoint/domain/data_providers/database/blacklist_table.dart';
import 'package:newpoint/domain/data_providers/database/image_table.dart';

class BlacklistDataProvider {
  final blacklistTable = BlacklistTable();

  Future<void> create({required int userId}) async {
    if (await userExists(userId)) {
      return;
    }
    await blacklistTable.create(userId: userId);
  }

  Future<bool> userExists(int userId) async {
    return await blacklistTable.countByUserId(userId: userId) > 0;
  }

  Future<List<int>> getAll() async {
    return await blacklistTable.getAll();
  }

  Future<void> remove(int userId) async {
    await blacklistTable.remove(userId: userId);
  }
}
