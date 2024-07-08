// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tms/user_auth/login_page.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({super.key});

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
            FirebaseAuth.instance.signOut();
            Get.offAll(()=>const LoginPage());
            },
          ),
        ],
      ),
      body: Container(color: Colors.orange,
            child: Center(
                    child: Text('Sign out form HomeAdmin page'),
                    ),
      )
    );
  }
}


// Future<String?> getLastId() async {
//   String uid;
//   FirebaseAuth.instance.authStateChanges().listen((User? user)
//   {if (user != null) {print(user.uid);        uid=user.uid;}});


//   DocumentSnapshot docSnapshot =
//       await FirebaseFirestore.instance.collection('users').doc(uid).get();
//   // Access the 'role' field from the retrieved document
//   if (docSnapshot.exists) {
//     Map<String, dynamic>? data = docSnapshot.data() as Map<String, dynamic>?;
//     if (data != null) {
//       var currentId = data['currentId'];
//       // Return the currentId
//       return currentId;
//     }
//   }
//   // User document doesn't exist or data is null
//   return null;
// }