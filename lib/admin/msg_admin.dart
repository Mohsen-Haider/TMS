import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MsgAdmin extends StatefulWidget {
  const MsgAdmin({super.key});

  @override
  State<MsgAdmin> createState() => _MsgAdminState();
}

class _MsgAdminState extends State<MsgAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.green,
            child: Center(
        child: GestureDetector(
          onTap: () {
            FirebaseAuth.instance.signOut();
          },
          child: const Text('Sign out form MsgAdmin page'),),
      )
      ),
    );
  }
}