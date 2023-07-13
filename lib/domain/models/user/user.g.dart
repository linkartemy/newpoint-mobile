part of 'user.dart';

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as int,
    login: json['login'] as String,
    name: json['name'] as String,
    surname: json['surname'] as String,
    email: json['email'] as String,
    phone: json['phone'] as String,
    image: json['image'] as String?,
  );
}

Map<String, dynamic> _$UserToJson(User user) => <String, dynamic>{
  'id': user.id,
  'login': user.login,
  'name': user.name,
  'surname': user.surname,
  'email': user.email,
  'phone': user.phone,
  'image': user.image,
};