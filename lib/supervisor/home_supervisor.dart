import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tms/user_auth/login_page.dart';

class HomeSupervisor extends StatefulWidget {
  const HomeSupervisor({super.key});

  @override
  State<HomeSupervisor> createState() => _HomeSupervisorState();
}

class _HomeSupervisorState extends State<HomeSupervisor> {
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
          child: const Text('Sign out form HomeSupervisor page'),),
      )
      ),
    );
  }
}