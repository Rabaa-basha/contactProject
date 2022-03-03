import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'contact.dart';
import 'create_contact.dart';
import 'update_contact.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  late Stream<QuerySnapshot>? usersNormalView;
  late Stream<QuerySnapshot>? usersSortedView;
  FirebaseAuth? auth;
  late User? user;
  late String uid;
  @override
  void initState() {
    auth = FirebaseAuth.instance;
    user = auth!.currentUser;
    uid = user!.uid;
    usersNormalView = FirebaseFirestore.instance
        .collection('User')
        .doc(uid)
        .collection("Contacts")
        .snapshots();
    usersSortedView = FirebaseFirestore.instance
        .collection('User')
        .doc(uid)
        .collection("Contacts")
        .orderBy('FirstName', descending: false)
        .snapshots();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot>? chosenStream = usersNormalView;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts List"),
        backgroundColor: Colors.black54,
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: [
              IconButton(
                  icon: const Icon(Icons.logout, color: Colors.red),
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.pop(context);
                  }),
              IconButton(
                icon: const Icon(Icons.add, color: Colors.black),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateContactPage()),
                  );
                },
              ),
              IconButton(
                  icon: const Icon(Icons.sort, color: Colors.black),
                  onPressed: () {
                    chosenStream = usersSortedView;
                  }),
            ],
          ),
          Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: chosenStream,
                  builder: (
                    BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot,
                  ) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong  ${snapshot.error}');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text('Loading');
                    }

                    final data = snapshot.requireData;
                    return ListView.builder(
                        itemCount: data.size,
                        itemBuilder: (context, index) {
                          var id = data.docs[index].id;
                          return Material(
                            child: InkWell(
                              child: Container(
                                child: Row(children: <Widget>[
                                  Icon(Icons.face_rounded),
                                  Container(
                                    child: Text(
                                      ' ${data.docs[index]['FirstName']}  ${data.docs[index]['LastName']}',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete,
                                        color: Colors.red),
                                    onPressed: () {
                                      FirebaseFirestore.instance
                                          .collection('User')
                                          .doc(uid)
                                          .collection('Contacts')
                                          .doc(id)
                                          .delete();
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.edit,
                                        color: Colors.blue),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                UpdateContactPage(
                                                    Snapshot: data.docs[index],
                                                    docID: id)),
                                      );
                                    },
                                  ),
                                ]),
                                padding: EdgeInsets.all(20.0),
                                margin: EdgeInsets.all(20.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Colors.black38,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ContactPage(
                                          Snapshot: data.docs[index],
                                          docID: id)),
                                );
                              },
                            ),
                          );
                          //return Text('Date: ${data.docs[index]['date']}\n Start time: ${data.docs[index]['Start time']}\n End Time: ${data.docs[index]['End time']}\n Status: ${data.docs[index]['Status']}');
                        });
                  }))
        ],
      ),
    );
  }
}
