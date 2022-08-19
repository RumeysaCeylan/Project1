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
    final response = await http.post(
      Uri.parse(base),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );
    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      log("Gelen Response => ${response.body}");
      print(jsonDecode(response.body));

      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create login. ${response.statusCode}');
    }
  }
}
