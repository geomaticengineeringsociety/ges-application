import 'package:flutter/material.dart';
import 'color and text/style.dart';

void navigatorpushandremove(BuildContext context, Widget widget) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => widget), (route) => false);
}

void notification(BuildContext context, String value) {
  var snackbar = SnackBar(
    content: Text(
      value,
      style: Userstyle.textstyle,
      textAlign: TextAlign.center,
    ),
    backgroundColor: UserColor.backgroundcolor,
    elevation: 1.0,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}
