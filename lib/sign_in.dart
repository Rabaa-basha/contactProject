import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'contacts_list.dart';
import 'sign_up.dart';
class SignInPage extends StatefulWidget {

  const SignInPage({Key? key})
      : super(key: key);
  @override
  State<SignInPage> createState() => SignInState();
}

class SignInState extends State<SignInPage> {
  final emailSeCURE = new TextEditingController();
  final passwordSeCuRE = new TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;



  void _Login() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: emailSeCURE.text,
          password: passwordSeCuRE.text
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }

    if (FirebaseAuth.instance.currentUser! != null) {

    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const ListPage()),
    );

  }
  }


  @override
  void initState(){
//    if (FirebaseAuth.instance.currentUser! != null) {
//
//      Navigator.push(
//        context,
//        MaterialPageRoute(builder: (context) => const ListPage()),
//      );
//
//    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text("Contacts app", ),
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
                      IconButton(
                          icon: Icon(Icons.email , color: Colors.white,), onPressed: () {}),
                      Expanded(
                        child: TextField(
                          controller: emailSeCURE,
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
                      IconButton(
                          icon: Icon(Icons.password , color: Colors.white,), onPressed: () {}),
                      Expanded(
                        child: TextField(
                          controller: passwordSeCuRE,
                          style: TextStyle(color: Colors. white),
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: const InputDecoration(
                              hintText: "Password",
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
                    onPressed: _Login,
                    child: const Text("Sign In")
                ),

                Row(
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            textStyle: const TextStyle(
                                fontSize: 20)
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpPage()),
                          );
                        },
                        child: const Text("Sign Up")
                    ),
                  ],
                )
              ]

          ),
        ));
  }
}