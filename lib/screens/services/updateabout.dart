import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../color and text/style.dart';
import '../../navigators.dart';

class UpdateYourself extends StatefulWidget {
  const UpdateYourself({super.key});

  @override
  State<UpdateYourself> createState() => _UpdateYourselfState();
}

class _UpdateYourselfState extends State<UpdateYourself> {
  GlobalKey<FormState> updateform = GlobalKey();
  TextEditingController yourselfcontroller = TextEditingController();

  final currentuser = FirebaseAuth.instance.currentUser;
  CollectionReference aboutyourself =
      FirebaseFirestore.instance.collection('users');

  // ignore: prefer_typing_uninitialized_variables
  var about;
  @override
  void dispose() {
    yourselfcontroller.dispose();
    super.dispose();
  }

  void clear() {
    yourselfcontroller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UserColor.backgroundcolor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: UserColor.backgroundcolor,
        elevation: 0.0,
        centerTitle: true,
        titleTextStyle: Userstyle.headerstyle,
        title: const Text(
          "Update",
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: updateform,
            child: Column(
              children: [
                Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(currentuser!.photoURL.toString()),
                          fit: BoxFit.fill)),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    style: Userstyle.textstyle,
                    controller: yourselfcontroller,
                    maxLines: null,
                    onChanged: (value) {
                      setState(() {
                        about = yourselfcontroller.text;
                      });
                    },
                    validator: ((value) {
                      if (value!.length <= 10) {
                        return "Please update about yourself";
                      }
                      return null;
                    }),
                    decoration: InputDecoration(
                        hintText: "About your carrier and achievements",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        label: Text(
                          "About Yourself",
                          textDirection: TextDirection.ltr,
                          style: Userstyle.textstyle,
                        )),
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: UserColor.backgroundcolor),
                    onPressed: () {
                      if (updateform.currentState!.validate()) {
                        updateUser();
                        clear();
                      }
                    },
                    child: Text(
                      "Update",
                      style: Userstyle.textstyle,
                    )),
              ],
            )),
      ),
    );
  }

  Future<void> updateUser() {
    return aboutyourself
        .doc(currentuser!.uid)
        .update({'about': about})
        .then((value) => notification(context, "Updated Sucessfully"))
        .catchError((error) => notification(context, "Please try again later"));
  }
}
