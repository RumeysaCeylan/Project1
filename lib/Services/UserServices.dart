import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:project1/Models/UserModel.dart';
import 'package:project1/Models/User.dart';

class UserService {
  final String base = "http://10.0.2.2:8000/login";

  Future<UserModel> verifyUser(
      {required String email, required String password}) async {
    Map<String, dynamic> json = {"email": email, "password": password};

    var response = await http.post(base, body: json);
    if (response.statusCode == 200) {
      log("Gelen Response => ${response.body}");
      print(jsonDecode(response.body));
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw ("Bir sorun oluştu ${response.statusCode}");
    }
  }
}
//rumeysaceylan@gmail.com