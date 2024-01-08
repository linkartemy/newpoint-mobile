part of 'user.dart';

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as int,
    login: json['login'] as String,
    name: json['name'] as String,
    surname: json['surname'] as String,
    description: json['description'] as String,
    location: json['location'] as String,
    email: json['email'] as String,
    phone: json['phone'] as String,
    profileImageId: json['profile_image_id'] as int,
    headerImageId: json['header_image_id'] as int,
    birthDate: json['birth_date'] as DateTime?,
    registrationTimestamp: json['registration_timestamp'] as DateTime?,
    lastLoginTimestamp: json['last_login_timestamp'] as DateTime?,
  );
}

User _$UserFromModel(UserModel userModel) {
  return User(
    id: userModel.id.toInt(),
    login: userModel.login,
    name: userModel.name,
    surname: userModel.surname,
    description: userModel.description.parseNullable(),
    location: userModel.location.parseNullable(),
    email: userModel.email.parseNullable(),
    phone: userModel.phone.parseNullable(),
    profileImageId: userModel.profileImageId.toInt(),
    headerImageId: userModel.headerImageId.toInt(),
    birthDate: userModel.birthDate.parseNullable()?.toDateTime(),
    registrationTimestamp:
        userModel.registrationTimestamp.parseNullable()?.toDateTime(),
    lastLoginTimestamp:
        userModel.lastLoginTimestamp.parseNullable()?.toDateTime(),
  );
}

Map<String, dynamic> _$UserToJson(User user) => <String, dynamic>{
      'id': user.id,
      'login': user.login,
      'name': user.name,
      'surname': user.surname,
      'email': user.email,
      'phone': user.phone,
      'profile_image_id': user.profileImageId,
      'header_image_id': user.headerImageId,
    };

extension NullableStringParser on NullableString {
  String? parseNullable() {
    return hasData() ? data : null;
  }
}

extension NullableTimestampParser on NullableTimestamp {
  Timestamp? parseNullable() {
    return hasData() ? data : null;
  }
}

extension DateTimeToTimestamp on DateTime {
  Timestamp toTimestamp() {
    return Timestamp.fromDateTime(this);
  }
}
