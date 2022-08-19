import 'dart:convert';

class UserModel {
  UserModel({
    required this.email,
    required this.password,
  });

  String email;
  String password;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      email: json["email"].toString(), password: json["password"].toString());

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;

    return data;
  }
}
