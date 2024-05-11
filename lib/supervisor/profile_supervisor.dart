import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileSupervisor extends StatefulWidget {
  const ProfileSupervisor({super.key});

  @override
  State<ProfileSupervisor> createState() => _ProfileSupervisorState();
}

class _ProfileSupervisorState extends State<ProfileSupervisor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.pink,
            child: Center(
        child: GestureDetector(
          onTap: () {
            FirebaseAuth.instance.signOut();
          },
          child: const Text('Sign out form ProfileSupervisor page'),),
      )
      ),
    );
  }
}