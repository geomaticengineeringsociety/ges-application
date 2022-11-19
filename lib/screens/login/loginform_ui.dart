import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ges/forget_password/forgetpassword.dart';
import 'package:ges/screens/profile/updateprofile.dart';
import 'package:password_strength/password_strength.dart';
import '../../color and text/style.dart';
import '../../navigators.dart';
import 'package:ges/screens/login/signup.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> loginform = GlobalKey();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  String? email;
  String? password;
  double strength = 0.0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10.0),
      child: Form(
          key: loginform,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100.0,
                child: AnimatedTextKit(
                  animatedTexts: [
                    RotateAnimatedText("A CLUB",
                        textStyle: Userstyle.textstyle,
                        duration: const Duration(seconds: 1)),
                    RotateAnimatedText("A SOCIETY",
                        textStyle: Userstyle.textstyle,
                        duration: const Duration(seconds: 1)),
                    RotateAnimatedText("A FAMILY",
                        textStyle: Userstyle.textstyle,
                        duration: const Duration(seconds: 1))
                  ],
                  isRepeatingAnimation: true,
                  repeatForever: true,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter value";
                  }
                  if (EmailValidator.validate(value) == false) {
                    return "Please enter valid mail";
                  }
                  return null;
                },
                controller: emailcontroller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    label: Text(
                      "Email",
                      textDirection: TextDirection.ltr,
                      style: Userstyle.textstyle,
                    )),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: passwordcontroller,
                onChanged: (value) {
                  strength = estimatePasswordStrength(value);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter value";
                  }
                  if (strength < 0.3) {
                    return "Please enter strong password";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    label: Text(
                      "Password",
                      textDirection: TextDirection.ltr,
                      style: Userstyle.textstyle,
                    )),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, elevation: 10.0),
                  onPressed: () {
                    if (loginform.currentState!.validate()) {
                      email = emailcontroller.text;
                      password = passwordcontroller.text;
                      signin();
                    }
                  },
                  child: Text(
                    "Login",
                    style: Userstyle.textstyle,
                  )),
              Text(
                "OR",
                style: Userstyle.textstyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Dont have account ?",
                    style: Userstyle.textstyle,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUp()));
                      },
                      child: Text(
                        "click here",
                        style: Userstyle.textbuttomstyle,
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Forget password ?",
                    style: Userstyle.textstyle,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ForgetPassword()));
                      },
                      child: Text(
                        "click here",
                        style: Userstyle.textbuttomstyle,
                      )),
                ],
              ),
            ],
          )),
    );
  }

  void signin() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!)
          .then((value) async {
        navigatorpushandremove(context, const UpdateProfile());
        return value;
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        messsage("No user found for that email");
      } else if (e.code == 'wrong-password') {
        messsage('Wrong password');
      }
    }
  }

  void messsage(String message) {
    var snackbar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
