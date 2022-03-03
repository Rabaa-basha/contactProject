import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
class CreateContactPage extends StatefulWidget {

  const CreateContactPage({Key? key})
      : super(key: key);

  @override
  State<CreateContactPage> createState() => _CreateContactPageState();
}

class _CreateContactPageState extends State<CreateContactPage> {
  final firstName = new TextEditingController();
  final lastName = new TextEditingController();
  final phone = new TextEditingController();
  final email =  new TextEditingController();


  FirebaseAuth? auth;
  late User? user;
  late String uid;

  @override
  void initState(){
    auth = FirebaseAuth.instance;
    user = auth!.currentUser;
    uid = user!.uid;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Add contact"),
        backgroundColor: Colors.black54,

      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.black45,
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 70,
                constraints: const BoxConstraints(
                  maxHeight: double.infinity,
                ),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 3),
                        blurRadius: 5,
                        color: Colors.grey)
                  ],
                ),
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: firstName,
                        style: TextStyle(color: Colors. white),
                        obscureText: false,
                        enableSuggestions: true,
                        autocorrect: true,
                        decoration: const InputDecoration(
                            hintText: "First name",
                            hintStyle: TextStyle( color:     Colors.white),
                            border: InputBorder.none),
                      ),
                    ),

                  ],
                ),
              ),
              Container(
                height: 70,
                constraints: const BoxConstraints(
                  maxHeight: double.infinity,
                ),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 3),
                        blurRadius: 5,
                        color: Colors.grey)
                  ],
                ),
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: lastName,
                        style: TextStyle(color: Colors. white),
                        obscureText: false,
                        enableSuggestions: true,
                        autocorrect: true,
                        decoration: const InputDecoration(
                            hintText: "Last name",
                            hintStyle: TextStyle( color:     Colors.white),
                            border: InputBorder.none),
                      ),
                    ),

                  ],
                ),
              ),
              Container(
                height: 70,
                constraints: const BoxConstraints(
                  maxHeight: double.infinity,
                ),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 3),
                        blurRadius: 5,
                        color: Colors.grey)
                  ],
                ),
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: phone,
                        style: TextStyle(color: Colors. white),
                        obscureText: false,
                        enableSuggestions: true,
                        autocorrect: true,
                        decoration: const InputDecoration(
                            hintText: "Phone",
                            hintStyle: TextStyle( color:     Colors.white),
                            border: InputBorder.none),
                      ),
                    ),

                  ],
                ),
              ),
              Container(
                height: 70,
                constraints: const BoxConstraints(
                  maxHeight: double.infinity,
                ),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 3),
                        blurRadius: 5,
                        color: Colors.grey)
                  ],
                ),
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: email,
                        style: TextStyle(color: Colors. white),
                        obscureText: false,
                        enableSuggestions: true,
                        autocorrect: true,
                        decoration: const InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle( color:     Colors.white),
                            border: InputBorder.none),
                      ),
                    ),

                  ],
                ),
              ),

              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black45,
                      textStyle: const TextStyle(
                          fontSize: 20)
                  ),
                  onPressed: AddContact,
                  child: const Text("Add contact")
              ),


            ]

        ),
      ));
  }


  void AddContact() async{
    if((email.text != null) && (phone.text!= null) && (firstName.text!=null) && (lastName.text !=null)) {
      print("I am here");
      FirebaseFirestore.instance.collection('User').doc(uid).collection(
          'Contacts').add(
          {
            'FirstName': firstName.text.toString(),
            'LastName': lastName.text.toString(),
            'Phone': phone.text.toString(),
            'Email': email.text.toString()
          }

      );

    }
      Navigator.pop(context);
    }
  }

