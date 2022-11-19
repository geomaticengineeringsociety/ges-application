import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../color and text/style.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  GlobalKey<FormState> loginform = GlobalKey();
  TextEditingController emailcontroller = TextEditingController();
  String? email;
  String notice = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: UserColor.backgroundcolor,
          title: Text(
            'forget password',
            style: Userstyle.headerstyle,
          )),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: loginform,
            child: Column(
              children: [
                TextFormField(
                  controller: emailcontroller,
                  onChanged: (value) {
                    setState(() {
                      email = emailcontroller.text;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter valid gmail";
                    }
                    if (value.contains('@') == false) {
                      return "Please enter valid gmail";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      label: Text(
                        "Gmail",
                        textDirection: TextDirection.ltr,
                        style: Userstyle.textstyle,
                      )),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  notice,
                  style: const TextStyle(color: Colors.red),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, elevation: 10.0),
                    onPressed: () async {
                      if (loginform.currentState!.validate()) {
                        await FirebaseAuth.instance
                            .sendPasswordResetEmail(email: email!)
                            .then((value) {
                          setState(() {
                            notice = "please check your mail(spam folder)";
                          });
                        });
                      }
                    },
                    child: Text(
                      "Reset",
                      style: Userstyle.textstyle,
                    )),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          )),
    );
  }
}
