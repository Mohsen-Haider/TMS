import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tms/user_auth/login_page.dart';

class HomeDriver extends StatefulWidget {
  const HomeDriver({super.key});

  @override
  State<HomeDriver> createState() => _HomeDriverState();
}

class _HomeDriverState extends State<HomeDriver> {
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
        child: GestureDetector(
          onTap: () {
            FirebaseAuth.instance.signOut();
            Get.offAll(()=>const LoginPage());
          },
          child: const Text('Sign out form HomeDriver page'),),
      )
      ),
    );
  }
}