import 'package:json_annotation/json_annotation.dart';
import 'package:newpoint/domain/models/nullable_parser.dart';
import 'package:newpoint/protos.dart';
import 'package:newpoint/src/generated/google/protobuf/timestamp.pb.dart';

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
  int profileImageId;
  int headerImageId;
  final DateTime? birthDate;
  final DateTime? registrationTimestamp;
  final DateTime? lastLoginTimestamp;
  final int followers;
  final int following;

  User(
      {required this.id,
      required this.login,
      required this.name,
      required this.surname,
      required this.description,
      required this.location,
      required this.email,
      required this.phone,
      required this.profileImageId,
      required this.headerImageId,
      required this.birthDate,
      required this.registrationTimestamp,
      required this.lastLoginTimestamp,
      required this.followers,
      required this.following});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.fromModel(UserModel userModel) => _$UserFromModel(userModel);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
