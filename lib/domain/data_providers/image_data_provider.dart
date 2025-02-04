import 'dart:typed_data';

import 'package:newpoint/domain/data_providers/database/image_table.dart';

class ImageDataProvider {
  final imageTable = ImageTable();

  Future<void> create({required int imageId, required Uint8List data}) async {
    await imageTable.create(imageId: imageId, data: data);
  }

  Future<bool> imageExists(int id) async {
    return await imageTable.countByImageId(imageId: id) > 0;
  }

  Future<Uint8List> getImageById(int id) async {
    return await imageTable.getByImageId(imageId: id);
  }
}
