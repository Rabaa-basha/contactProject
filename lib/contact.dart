import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContactPage extends StatefulWidget {
  final Snapshot;
  final docID;
  const ContactPage({Key? key, required this.Snapshot, required this.docID})
      : super(key: key);
  @override
  State<ContactPage> createState() => ContactPageState();
}

class ContactPageState extends State<ContactPage> {
  var Snapshot;
  var FriendID;
  String? FriendName ='';
  FirebaseAuth? auth;
  late User? user;
  late String uid;

  @override
  void initState() {
    auth = FirebaseAuth.instance;
    user = auth!.currentUser;
    uid = user!.uid;
    Snapshot = widget.Snapshot;
    FriendID = widget.docID;
    FriendName = widget.Snapshot['FirstName'];
    // _controller.jumpTo(_controller.position.maxScrollExtent);
//    Snapshot= widget.Snapshot.collection("messages").orderBy("time", "asc");
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  Text(FriendName!, ),
          backgroundColor: Colors.black54,

        ),
        body: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Text("First name: " + Snapshot['FirstName'])
                ],
              ),
              Row(
                children: [
                  Text("Last name: " + Snapshot['LastName'])
                ],
              ),

              Row(
                children: [
                  Text("Phone: " + Snapshot['Phone'])
                ],
              ),

              Row(
                children: [
                  Text("Email: " + Snapshot['Email'])
                ],
              )
            ],
          ),
        ));
  }
}
