import 'package:flutter/material.dart';
import '../color and text/style.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: UserColor.backgroundcolor,
          title: Text(
            'forget password',
            style: Userstyle.headerstyle,
          )),
    );
  }
}
