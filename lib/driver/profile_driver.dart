import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileDriver extends StatefulWidget {
  const ProfileDriver({super.key});

  @override
  State<ProfileDriver> createState() => _ProfileDriverState();
}

class _ProfileDriverState extends State<ProfileDriver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.pink,
            child: Center(
        child: GestureDetector(
          onTap: () {
            FirebaseAuth.instance.signOut();
          },
          child: const Text('Sign out form ProfileDriver page'),),
      )
      ),
    );
  }
}