import 'package:flutter/material.dart';
import 'package:ges/screens/login/loginform_ui.dart';
import '../../navigators.dart';
import '../profile/updateprofile.dart';
import 'loginlogic.dart';
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  'ges.png',
                  height: 220.0,
                  width: 220.0,
                ),
              ),
              const LoginForm(),
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      elevation: 10.0,
                      minimumSize: const Size(20, 40),
                      backgroundColor: Colors.white,
                      shadowColor: Colors.black),
                  onPressed: () {
                    LoginWithMail()
                        .googlelogin()
                        .then((value) => navigatorpushandremove(
                            context, const UpdateProfile()))
                        .catchError((onError) {
                      return null;
                    });
                  },
                  icon: const Icon(
                    Icons.mail,
                    color: Colors.black,
                  ),
                  label: Text(
                    "Login with gmail",
                    style: Userstyle.textstyle,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
