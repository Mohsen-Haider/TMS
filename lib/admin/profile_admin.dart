import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileAdmin extends StatefulWidget {
  const ProfileAdmin({super.key});

  @override
  State<ProfileAdmin> createState() => _ProfileAdminState();
}

class _ProfileAdminState extends State<ProfileAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.pink,
            child: Center(
        child: GestureDetector(
          onTap: () {
            FirebaseAuth.instance.signOut();
          },
          child: const Text('Sign out form ProfileAdmin page'),),
      )
      ),
    );
  }
}