import 'package:json_annotation/json_annotation.dart';
import 'package:newpoint/protos.dart';
import 'package:newpoint/src/generated/google/protobuf/timestamp.pb.dart';
import 'package:fixnum/src/int64.dart';

part 'user.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class User {
  final int id;
  final String login;
  final String name;
  final String surname;
  final String? description;
  final String? location;
  final String? email;
  final String? phone;
  final String? profileImage;
  final String? headerImage;
  final DateTime? birthDate;
  final DateTime? registrationTimestamp;
  final DateTime? lastLoginTimestamp;

  User({
    required this.id,
    required this.login,
    required this.name,
    required this.surname,
    required this.description,
    required this.location,
    required this.email,
    required this.phone,
    required this.profileImage,
    required this.headerImage,
    required this.birthDate,
    required this.registrationTimestamp,
    required this.lastLoginTimestamp,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  factory User.fromModel(UserModel userModel) => _$UserFromModel(userModel);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
