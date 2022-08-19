import 'package:project1/Screens/Welcome.dart';
import 'package:project1/Services/UserServices.dart';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grock/grock.dart';
import 'package:project1/riverpod/popup.dart';

class LoginRiverpod extends ChangeNotifier {
  final service = UserService();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final box = GetStorage();

  void fetch(BuildContext context) {
    loadingPopup();
    service
        .verifyUser(email: email.text, password: password.text)
        .then((value) {
      if (value != null && value.message != "Login failed") {
        //box.write("email", value.email);
        log("Kaydedilen email => ${box.read("status")}");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => WelcomeState()));
      } else {
        Grock.back();
        Grock.snackBar(title: "Hata", description: "hatalı giriş");
      }
    });
  }
}
