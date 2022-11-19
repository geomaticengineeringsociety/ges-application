import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../color and text/style.dart';
import '../../navigators.dart';
import '../login/login.dart';
import '../login/loginlogic.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final user = FirebaseAuth.instance.currentUser;
  CollectionReference users =
      FirebaseFirestore.instance.collection('aboutyourself');
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(user!.uid).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            notification(context, "Error Occured");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            notification(context, "Sorry No data available");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(color: Colors.black));
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Scaffold(
                appBar: AppBar(
                  elevation: 0.0,
                  backgroundColor: UserColor.backgroundcolor,
                  title: Center(
                    child: Text(
                      "Profile",
                      style: Userstyle.headerstyle,
                    ),
                  ),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(user!.photoURL.toString()),
                      Center(
                        child: Text(
                          "User Profile${user!.displayName}",
                          style: Userstyle.textstyle,
                        ),
                      ),
                      Center(
                          child: Text(
                        "User Profile${user!.email}",
                        style: Userstyle.textstyle,
                      )),
                      Center(
                          child: Text(
                        "User Profile${data['about']}",
                        style: Userstyle.textstyle,
                      )),
                      ElevatedButton(
                          onPressed: () {
                            LoginWithMail()
                                .logout()
                                .then((value) => navigatorpushandremove(
                                    context, const Login()))
                                .then((value) => notification(
                                    context, "Sucessfully Logout"));
                          },
                          child: const Text("Logout"))
                    ],
                  ),
                ));
          }
          return const Center(
            child: CircularProgressIndicator(color: Colors.black),
          );
        });
  }
}
