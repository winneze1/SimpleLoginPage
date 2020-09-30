import 'package:flutter/material.dart';
import 'package:simplelogin/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPass = false;
  TextEditingController _userController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  var _userNameError = "User Name is not right";
  var _passError = "Password must be greater than 6";
  var _userInvalid = false;
  var _passInvalid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Container(
                width: 70,
                height: 70,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFD8D8D8),
                ),
                child: FlutterLogo(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: Text(
                "Hello\nWelcomback",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: TextField(
                controller: _userController,
                style: TextStyle(fontSize: 18, color: Colors.black),
                decoration: InputDecoration(
                  labelText: "User Name",
                  errorText: _userInvalid ? _userNameError : null,
                  labelStyle: TextStyle(color: Color(0xff888888), fontSize: 15),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: [
                  TextField(
                    controller: _passController,
                    obscureText: !_showPass,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    decoration: InputDecoration(
                      labelText: "Password",
                      errorText: _passInvalid ? _passError : null,
                      labelStyle:
                          TextStyle(color: Color(0xff888888), fontSize: 15),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      ShowPassword();
                    },
                    child: Text(
                      _showPass ? "HIDE" : "SHOW",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Text(
                      "SIGN IN",
                      style: TextStyle(fontSize: 16),
                    ),
                    onPressed: () {
                      SignInClick();
                    }),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: Container(
                height: 40,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "NEW USER?",
                          style: TextStyle(color: Color(0xFF888888)),
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(0, 0, 5, 0)),
                        Text(
                          "SIGN UP",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Text(
                      "FORGOT PASSWORD",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void ShowPassword() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  void SignInClick() {
    setState(() {
      if (_userController.text.length < 6 ||
          !_userController.text.contains("@") ||
          _userController.text.isEmpty) {
        _userInvalid = true;
      } else {
        _userInvalid = false;
      }
      if (_passController.text.length < 6 || _passController.text.isEmpty) {
        _passInvalid = true;
      } else {
        _passInvalid = false;
      }

      if (!_userInvalid && !_passInvalid) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ));
      }
    });
  }
}
