import 'dart:convert';

class UserModel {
  UserModel({
    required this.message,
  });

  String message;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(message: json["Message"].toString());
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Message'] = message;

    return data;
  }
}
