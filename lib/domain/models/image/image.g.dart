part of 'image.dart';

Image _$ImageFromJson(Map<String, dynamic> json) {
  return Image(
    id: json['id'] as int,
    data: json['data'] as List<int>,
    name: json['name'],
  );
}

Image _$ImageFromModel(ImageModel imageModel) {
  return Image(
      id: imageModel.id.toInt(), data: imageModel.data, name: imageModel.name);
}

Map<String, dynamic> _$ImageToJson(Image image) => <String, dynamic>{
      'id': image.id,
      'data': image.data,
    };
