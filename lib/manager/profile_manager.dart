import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileManager extends StatefulWidget {
  const ProfileManager({super.key});

  @override
  State<ProfileManager> createState() => _ProfileManagerState();
}

class _ProfileManagerState extends State<ProfileManager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.pink,
            child: Center(
        child: GestureDetector(
          onTap: () {
            FirebaseAuth.instance.signOut();
          },
          child: const Text('Sign out form ProfileManager page'),),
      )
      ),
    );
  }
}