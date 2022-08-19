import 'dart:convert';

import 'package:project1/Models/User.dart';

class User {
  int id = 0;
  String firstName = "";
  String lastName = "";
  String email = "";
  String password = "";
  String status = "";
  User.withoutId() {}
  User(
      {required lastName,
      required firstName,
      required id,
      required email,
      required password}) {}
  int get getId {
    return this.id;
  }

  void set setId(int id) {
    this.id = id;
  }

  String get getFirstName {
    return this.firstName;
  }

  void set setFirstName(String firstName) {
    this.firstName = firstName;
  }

  String get getLastName {
    return this.lastName;
  }

  void set setLastName(String lastName) {
    this.lastName = lastName;
  }

  String get getEmail {
    return this.firstName;
  }

  void set setEmail(String email) {
    this.email = email;
  }

  String get getPassword {
    return this.password;
  }

  void set setPassword(String password) {
    this.password = password;
  }
}
