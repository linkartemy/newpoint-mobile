import 'package:json_annotation/json_annotation.dart';
import 'package:newpoint/protos.dart';

part 'image.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Image {
  final int id;
  final List<int>? data;
  final String name;

  Image({
    required this.id,
    required this.data,
    required this.name,
  });

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
  factory Image.fromModel(ImageModel imageModel) =>
      _$ImageFromModel(imageModel);

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}
