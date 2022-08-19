import 'dart:convert';

class UserModel {
  UserModel({
    required this.message,
    //required this.status,
  });

  String message;
  //int status;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        message: json["Message"].toString() //status: json["Status"]
        );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Message'] = message;
    //data['Status'] = status;

    return data;
  }
}
