import 'package:flutter/material.dart';
import 'package:social_network/widget/header.dart';
import 'package:social_network/widget/progress.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final usersRef = Firestore.instance.collection('users');

class TimeLine extends StatefulWidget {
  @override
  _TimeLineState createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {
  List<dynamic> users = [];
  @override
  void initState() {
    super.initState();
    getUsers();
    // getUserById();
    // createUser();
    // deleteUser();
  }

  createUser() {
    // usersRef.add({"username": "dfhjk", "postsCount": 33, "isAdmin": false}); //add with auto id
    usersRef.document().setData({
      "username": "bbbbbb",
      "postsCount": 33,
      "isAdmin": false
    }); //using custum id document("custum id")
  }

  var i = 0;
  updateUser() async {
    i++;
    final DocumentSnapshot doc =
        await usersRef.document("Iuc6FZWliwxTFs2RvG68").get();
    if (doc.exists) {
      doc.reference.updateData(
          {"username": "shaban $i", "postsCount": 33, "isAdmin": false});
    }
  }

  deleteUser() async {
    // usersRef.document("customId").delete();
    final DocumentSnapshot doc =
        await usersRef.document("B0XCluq6wVbcsLc7xJdX").get();
    if (doc.exists) {
      doc.reference.delete();
    }
  }

  getUsers() async {
    // GET ALL USERS
    // usersRef.getDocuments().then((QuerySnapshot snapshot) {
    //   snapshot.documents.forEach((DocumentSnapshot doc) {
    //     print(doc.data);
    //     print(doc.documentID);
    //     print(doc.exists);
    //   });
    // });
    final QuerySnapshot snapshot = await usersRef.getDocuments();

    setState(() {
      users = snapshot.documents;
    });
    // snapshot.documents.forEach((DocumentSnapshot doc) {
    //   print(doc.data);
    //   print(doc.documentID);
    //   print(doc.exists);
    // });

    //GET USERS WITH CONDITIONS
    // final QuerySnapshot snapshot = await usersRef
    //     // .where("postsCount", isGreaterThan: 3)
    //     // .where("username", isEqualTo: "abdalah")
    //     // .orderBy("postsCount", descending: true)
    //     .limit(1)
    //     .getDocuments();
    // snapshot.documents.forEach((DocumentSnapshot doc) {
    //   print(doc.data);
    //   print(doc.documentID);
    //   print(doc.exists);
    // });
  }

  getUserById() async {
    final String id = "qA8ZT0T4lJWXBBs6L9qs";
    // usersRef.document(id).get().then((DocumentSnapshot doc) {
    //   print(doc.data);
    //   print(doc.documentID);
    //   print(doc.exists);
    // });
    final DocumentSnapshot doc = await usersRef.document(id).get();
    print(doc.data);
    print(doc.documentID);
    print(doc.exists);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, isAppTitle: true),
      // body: FutureBuilder<QuerySnapshot>(
      //   future: usersRef.getDocuments(),
      //   builder: (context, snapshot) {
      //     if (!snapshot.hasData) {
      //       return circularProgress();
      //     }
      //     final List<Text> childern = snapshot.data.documents
      //         .map((doc) => Text(doc['username']))
      //         .toList();
      //     return Container(
      //       child: ListView(
      //         children: childern,
      //       ),
      //     );
      //   },
      // ),
      body: StreamBuilder<QuerySnapshot>(
        stream: usersRef.snapshots(),
        builder: (BuildContext context, snapshot) {
          if (!snapshot.hasData) {
            // return circularProgress();
            return linerProgress();
          }
          final List<Text> childern = snapshot.data.documents
              .map((doc) => Text(doc['username']))
              .toList();
          return Container(
            child: ListView(
              children: childern,
            ),
          );
        },
      ),
    );
  }
}
