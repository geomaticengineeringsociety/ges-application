import 'package:flutter/material.dart';
import '../../color and text/style.dart';
import '../../forget_password/forgetpassword_ui.dart';
import '../../navigators.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> loginform = GlobalKey();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10.0),
      child: Form(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10.0,
          ),
          Image.asset(
            'user.png',
            height: 120.0,
            width: 300.0,
          ),
          TextFormField(
            onChanged: (vaue) {},
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
            height: 20.0,
          ),
          TextFormField(
            onChanged: (vaue) {},
            controller: passwordcontroller,
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
                backgroundColor: Colors.white70,
              ),
              onPressed: () {
                navigatorpushandremove(context, const ForgetPassword());
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
                  onPressed: () {},
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
                  onPressed: () {},
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
}
