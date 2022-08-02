import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project1/Models/User.dart';
import 'package:project1/Screens/SignUpPage.dart';

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String mesaj = "LOGIN";
  bool remembermeBtn = false;
  var formKey = GlobalKey<FormState>();

  User user = User.withoutId();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
        backgroundColor: Colors.black45,
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          key: formKey,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Stack(
              children: <Widget>[
                backGroundLogin(),
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
                          "LOGIN",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'OpenSans',
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 30.0),
                        buildEmailLogin(),
                        SizedBox(
                          height: 30.0,
                        ),
                        buildPasswordLogin(),
                        buildForgotLogin(context),
                        buildRemembermeBtn(),
                        buildLoginBtn(),
                        buildSignUpBtn(context),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
      backgroundColor: Colors.deepOrangeAccent,
    );
  }

  Widget buildSignUpBtn(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SignUpState()),
        );
      },
      child: RichText(
          text: TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t have an Account?  ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: 'Sign Up',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      )),
    );
  }

  Widget buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 25.0,
      ),
      width: double.infinity,
      child: RaisedButton(
        elevation: 10.0,
        onPressed: () async {
          save();
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        color: Colors.white,
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Colors.deepOrange,
            letterSpacing: 2,
            fontSize: 18.0,
            // fontWeight: FontWeight.normal,
            // fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  void save() {
    print("deneme");
    if (user.firstName.isEmpty) {
      print("dsfmldfl");
    }
    print(user.firstName);
    print(user.lastName);
    print(user.email);
    print(user.password);
  }

  Widget buildRemembermeBtn() {
    return Container(
      height: 20.0,
      child: Row(
        children: [
          Theme(
              data: ThemeData(unselectedWidgetColor: Colors.white),
              child: Checkbox(
                value: remembermeBtn,
                checkColor: Colors.blueAccent,
                activeColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    remembermeBtn = value!;
                    print(value);
                  });
                },
              )),
          Text(
            'Remember Me',
            style: TextStyle(
                color: Colors.white70,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget buildForgotLogin(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  title: const Text('Yeniden şifre oluştur'),
                  content: const Text('Emailinize kod gönderilecek'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('OK'),
                    ),
                  ],
                )),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Forgot Password ? ',
          style: TextStyle(color: Colors.white70),
        ),
      ),
    );
  }

  Widget buildEmailLogin() {
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

  Widget buildPasswordLogin() {
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
              hintText: "Şifrenizi giriniz",
              hintStyle: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w100),
            ),
            validator: (value) {
              return value!.length > 5
                  ? null
                  : "Password must be at least 6 characters";
            },
            onChanged: (value) {
              user.password = value.trim();
            },
          ),
        )
      ],
    );
  }

  Widget backGroundLogin() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.deepOrangeAccent,
          Colors.white38,
          Colors.redAccent,
          Colors.red,
        ],
        stops: [0.1, 0.4, 0.7, 0.9],
      )),
    );
  }
}
