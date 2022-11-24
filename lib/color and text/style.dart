import 'package:flutter/cupertino.dart';

//declaring color and textstyle
class UserColor {
  static var backgroundcolor = const Color.fromRGBO(255, 255, 255, 1);
  static var textwithbackgroundcolor = const Color.fromRGBO(0, 0, 0, 1);
}

class Userstyle {
  static var headerstyle = TextStyle(
    color: UserColor.textwithbackgroundcolor,
    letterSpacing: 1.0,
    fontSize: 20.0,
  );

  // GoogleFonts.lora(
  //   color: UserColor.textwithbackgroundcolor,
  //   fontWeight: FontWeight.bold,
  //   letterSpacing: 1.0,
  //   fontSize: 20.0,
  // );
  static var textstyle = TextStyle(
      color: UserColor.textwithbackgroundcolor,
      letterSpacing: 1.0,
      fontSize: 15);

  // GoogleFonts.lora(
  //     color: UserColor.textwithbackgroundcolor,
  //     letterSpacing: 1.0,
  //     fontSize: 15);
  static var textbuttomstyle = const TextStyle(
      color: Color.fromARGB(255, 113, 0, 0), letterSpacing: 1.0, fontSize: 15);

  // GoogleFonts.lora(
  //     color: const Color.fromARGB(255, 113, 0, 0),
  //     letterSpacing: 1.0,
  //     fontSize: 15);
  static var headercardstyle = TextStyle(
    color: UserColor.textwithbackgroundcolor,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.0,
    fontSize: 15.0,
  );

  // GoogleFonts.lora(
  //   color: UserColor.textwithbackgroundcolor,
  //   fontWeight: FontWeight.bold,
  //   letterSpacing: 1.0,
  //   fontSize: 15.0,
  // );
  static var subtitletilestyle = const TextStyle(
    color: Color.fromARGB(255, 179, 179, 179),
    fontWeight: FontWeight.bold,
    letterSpacing: 1.0,
    fontSize: 10.0,
  );

  // GoogleFonts.lora(
  //   color: const Color.fromARGB(255, 179, 179, 179),
  //   fontWeight: FontWeight.bold,
  //   letterSpacing: 1.0,
  //   fontSize: 10.0,
  // );
  static var blogheaderstyle = TextStyle(
    color: UserColor.textwithbackgroundcolor,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.0,
    fontSize: 19.0,
  );

  // GoogleFonts.lora(
  //   color: UserColor.textwithbackgroundcolor,
  //   fontWeight: FontWeight.bold,
  //   letterSpacing: 1.0,
  //   fontSize: 19.0,
  // );
}

class UserTextFieldStyle {}
