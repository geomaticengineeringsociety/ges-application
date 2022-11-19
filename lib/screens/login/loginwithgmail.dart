import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import '../../color and text/style.dart';
import '../../navigators.dart';
import 'loginlogic.dart';
import '../profile/updateprofile.dart';

class LoginGmail extends StatefulWidget {
  const LoginGmail({super.key});

  @override
  State<LoginGmail> createState() => _LoginGmailState();
}

class _LoginGmailState extends State<LoginGmail> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10.0,
          ),
          // Center(
          //   child: Image.asset(
          //     'ges.png',
          //     height: 320.0,
          //     width: 300.0,
          //   ),
          // ),
          const SizedBox(
            height: 10.0,
          ),
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
            height: 20.0,
          ),
          ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  elevation: 10.0,
                  minimumSize: const Size(50, 50),
                  backgroundColor: Colors.white,
                  shadowColor: Colors.black),
              onPressed: () {
                LoginWithMail()
                    .googlelogin()
                    .then((value) =>
                        navigatorpushandremove(context, const UpdateProfile()))
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
          const SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.copyright,
                size: 15.0,
                color: Colors.grey,
              ),
              Text(
                "Geomatic Engineering Society",
                style: Userstyle.subtitletilestyle,
              ),
            ],
          ),
          Text(
            "2022",
            style: Userstyle.subtitletilestyle,
          ),
        ],
      ),
    );
  }
}
