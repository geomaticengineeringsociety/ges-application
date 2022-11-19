import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../color and text/style.dart';
import '../../navigators.dart';

class AddBlog extends StatefulWidget {
  const AddBlog({super.key});

  @override
  State<AddBlog> createState() => _AddBlogState();
}

class _AddBlogState extends State<AddBlog> {
  GlobalKey<FormState> blogform = GlobalKey();
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  final currentuser = FirebaseAuth.instance.currentUser;
  // ignore: prefer_typing_uninitialized_variables
  var title;
  // ignore: prefer_typing_uninitialized_variables
  var description;
  var date = DateTime.now();
  CollectionReference blogs = FirebaseFirestore.instance.collection('Blogs');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          elevation: 0.0,
          backgroundColor: UserColor.backgroundcolor,
          centerTitle: true,
          title: Text(
            "Add Blog",
            style: Userstyle.headerstyle,
          )),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Form(
            key: blogform,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  style: Userstyle.textstyle,
                  controller: titlecontroller,
                  maxLines: null,
                  onChanged: (value) {
                    setState(() {
                      title = titlecontroller.text;
                    });
                  },
                  validator: ((value) {
                    if (value!.length <= 10) {
                      return "Please update about yourself";
                    }
                    return null;
                  }),
                  decoration: InputDecoration(
                      hintText: "Enter Title",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      label: Text(
                        "Title",
                        textDirection: TextDirection.ltr,
                        style: Userstyle.textstyle,
                      )),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  style: Userstyle.textstyle,
                  controller: descriptioncontroller,
                  onChanged: (value) {
                    setState(() {
                      description = descriptioncontroller.text;
                    });
                  },
                  maxLines: null,
                  validator: ((value) {
                    if (value!.length <= 10) {
                      return "Please update about yourself";
                    }
                    return null;
                  }),
                  decoration: InputDecoration(
                      hintText: "Enter Description",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      label: Text(
                        "Description",
                        textDirection: TextDirection.ltr,
                        style: Userstyle.textstyle,
                      )),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: UserColor.backgroundcolor),
                    onPressed: () {
                      if (blogform.currentState!.validate()) {
                        addblog();
                      }
                    },
                    child: Text(
                      "Add",
                      style: Userstyle.textstyle,
                    )),
              ],
            )),
      ),
    );
  }

  //adding blogs
  Future addblog() async {
    await blogs
        .add({
          'title': title,
          'description': description,
          'datetime': '${date.day}/${date.month}/${date.year}',
          'name': currentuser!.displayName,
          'photoURL': currentuser!.photoURL
        })
        .then((value) => notification(context, "Sucessfully Added"))
        .catchError((onError) {
          notification(context, "Error Occured");
        });
  }
}
