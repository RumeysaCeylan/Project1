import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project1/Models/User.dart';

class SignUpState extends StatefulWidget {
  @override
  State<SignUpState> createState() => _SignUpState();
}

class _SignUpState extends State<SignUpState> {
  var user = User.withoutId();
  var formKey = GlobalKey<FormState>();

  String mesaj = "SIGN UP";
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
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20.0),
                        buildFirstNameSignUp(),
                        SizedBox(
                          height: 20.0,
                        ),
                        buildSecondNameSignUp(),
                        SizedBox(
                          height: 20.0,
                        ),
                        buildEmailSignUp(),
                        SizedBox(
                          height: 20.0,
                        ),
                        buildPasswordSignUp(),
                        buildSignUpBtn(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
      backgroundColor: Colors.blue,
    );
  }

  Widget buildSignUpBtn() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 25.0,
      ),
      width: double.infinity,
      child: RaisedButton(
        elevation: 10.0,
        onPressed: () {
          saveUser();
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        color: Colors.white,
        child: Text(
          'SIGN UP',
          style: TextStyle(
            color: Colors.blue.shade900,
            letterSpacing: 2,
            fontSize: 18.0,
            // fontWeight: FontWeight.normal,
            // fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget buildFirstNameSignUp() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'First Name',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white54,
          ),
          height: 50.0,
          child: TextFormField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.supervised_user_circle_outlined,
                color: Colors.white,
              ),
              hintText: "İsminizi giriniz",
              hintStyle: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w100),
            ),
            validator: (value) {
              return value!.length > 2
                  ? null
                  : "Name must be at least 3 characters";
            },
            keyboardType: TextInputType.name,
            onChanged: (value) {
              user.firstName = value;
            },
          ),
        )
      ],
    );
  }

  Widget buildSecondNameSignUp() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Last Name',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white54,
          ),
          height: 50.0,
          child: TextFormField(
            keyboardType: TextInputType.name,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.supervised_user_circle_outlined,
                color: Colors.white,
              ),
              hintText: "Soy isminizi giriniz",
              hintStyle: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w100),
            ),
            validator: (value) {
              return value!.length > 2
                  ? null
                  : "Last Name must be at least 3 characters";
            },
            onChanged: (value) {
              user.lastName = value;
            },
          ),
        ),
      ],
    );
  }

  Widget buildEmailSignUp() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white54,
          ),
          height: 50.0,
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: "Email adresinizi giriniz",
              hintStyle: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w100),
            ),
            validator: (value) {
              return value!.contains(
                      RegExp(r'[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}'))
                  ? null
                  : "Invalid E-mail";
            },
            onChanged: (value) {
              user.email = value.trim();
            },
          ),
        )
      ],
    );
  }

  Widget buildPasswordSignUp() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white54,
          ),
          height: 50.0,
          child: TextFormField(
            obscureText: true, //****
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: "Şifrenizi oluşturunuz",
              hintStyle: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w100),
            ),
            validator: (value) {
              return value!.length > 2
                  ? null
                  : "Password must be at least 3 characters";
            },
            keyboardType: TextInputType.name,
            onChanged: (value) {
              print(value);
              user.password = value;
            },
          ),
        )
      ],
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
          Colors.blueAccent,
          Colors.white38,
          Colors.blue.shade900,
          Colors.lightBlue,
        ],
        stops: [0.1, 0.4, 0.7, 0.9],
      )),
    );
  }

  void saveUser() {
    print("deneme");

    print(user.firstName);
    print(user.lastName);
    print(user.email);
    print(user.password);
  }
}
