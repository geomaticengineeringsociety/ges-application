import 'package:flutter/material.dart';
import 'loginwithgmail.dart';
import '../../color and text/style.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: null,
      child: Scaffold(
        backgroundColor: UserColor.backgroundcolor,
        appBar: AppBar(
          backgroundColor: UserColor.backgroundcolor,
          elevation: 0.0,
          centerTitle: true,
          titleTextStyle: Userstyle.headerstyle,
          title: const Text(
            "Login",
          ),
        ),
        body: const LoginGmail(),
      ),
    );
  }
}
