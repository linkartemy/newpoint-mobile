import 'package:json_annotation/json_annotation.dart';
import 'package:newpoint/protos.dart';

part 'user.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class User {
  final int id;
  final String login;
  final String name;
  final String surname;
  final String email;
  final String phone;
  final String? image;

  User({
    required this.id,
    required this.login,
    required this.name,
    required this.surname,
    required this.email,
    required this.phone,
    required this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  factory User.fromModel(UserModel userModel) => _$UserFromModel(userModel);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
