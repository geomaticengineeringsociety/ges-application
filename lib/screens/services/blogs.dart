import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../../color and text/style.dart';
import 'detailviewblog.dart';

import '../../firebase_options.dart';

class Blogs extends StatefulWidget {
  const Blogs({super.key});

  @override
  State<Blogs> createState() => _BlogsState();
}

class _BlogsState extends State<Blogs> {
  var firebase = Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final Stream<QuerySnapshot> blogsStream =
      FirebaseFirestore.instance.collection('Blogs').snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: blogsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Something Went Wrong",
                style: Userstyle.textstyle,
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          }
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return Container(
                margin: const EdgeInsets.all(2.0),
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Color.fromARGB(193, 226, 225, 225)))),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => DetailView(
                                data['datetime'],
                                data['description'],
                                data['name'],
                                data['photoURL'],
                                data['title']))));
                  },
                  title: Text(
                    data['title'],
                    style: Userstyle.textstyle,
                  ),
                  subtitle: Text(
                    data['name'],
                    style: Userstyle.subtitletilestyle,
                  ),
                  trailing: Text(
                    data['datetime'],
                    style: Userstyle.subtitletilestyle,
                  ),
                  leading: ClipOval(
                      child: Image.network(
                    data['photoURL'],
                    fit: BoxFit.cover,
                    width: 50.0,
                    height: 50.0,
                  )),
                ),
              );
            }).toList(),
          );

          // Container(
          //   child: ListView.builder(
          //       itemCount: 20,
          //       itemBuilder: ((context, index) => ListTile(
          //             onTap: () {},
          //             title: Text(
          //               "Blog Title",
          //               style: Userstyle.textstyle,
          //             ),
          //             subtitle: Text(
          //               "Author name",
          //               style: Userstyle.subtitletilestyle,
          //             ),
          //             trailing: Text(
          //               "2022/10/01",
          //               style: Userstyle.subtitletilestyle,
          //             ),
          //             leading: ClipOval(
          //                 child: Image.asset(
          //               "user.png",
          //               fit: BoxFit.cover,
          //               width: 50.0,
          //               height: 50.0,
          //             )),
          //           ))),
          // );
        });
  }

  //retriving user information through uid
}
