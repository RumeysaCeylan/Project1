import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project1/Models/User.dart';
import 'package:project1/Models/UserModel.dart';

class WelcomeState extends StatefulWidget {
  @override
  State<WelcomeState> createState() => _WelcomeState();
}

class _WelcomeState extends State<WelcomeState> {
  var user = User.withoutId();
  var formKey = GlobalKey<FormState>();
  String mesaj = "WELCOME";
  bool remembermeBtn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
        backgroundColor: Colors.black45,
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            key: formKey,
            onTap: () => FocusScope.of(context).unfocus(),
            child: Stack(
              children: <Widget>[
                backGroundSignUp(),
                Container(
                  height: double.infinity,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          mesaj,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'OpenSans',
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20.0),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
      backgroundColor: Colors.greenAccent,
    );
  }

  Widget backGroundSignUp() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.greenAccent,
          Colors.white38,
          Colors.green.shade900,
          Colors.lightGreenAccent,
        ],
        stops: [0.1, 0.4, 0.7, 0.9],
      )),
    );
  }
}
