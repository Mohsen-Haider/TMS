import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tms/user_auth/login_page.dart';

class HomeManager extends StatefulWidget {
  const HomeManager({super.key});

  @override
  State<HomeManager> createState() => _HomeManagerState();
}

class _HomeManagerState extends State<HomeManager> {
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
          child: const Text('Sign out form HomeManager page'),),
      )
      ),
    );
  }
}