import 'package:flutter/material.dart';

void navigatorpushandremove(BuildContext context, Widget widget) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => widget), (route) => false);
}

void notification(BuildContext context, String value) {
  var snackbar = SnackBar(
    content: Text(
      value,
      textAlign: TextAlign.center,
    ),
    elevation: 1.0,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}
