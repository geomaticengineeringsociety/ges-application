import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginWithMail {
  GoogleSignIn googlesignin = GoogleSignIn();
  Future<UserCredential?> googlelogin() async {
    try {
      final googleUser = await googlesignin.signIn();
      final googleAuth = await googleUser!.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      return FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      return null;
    }
  }

  Future logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
