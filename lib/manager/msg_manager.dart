import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MsgManager extends StatefulWidget {
  const MsgManager({super.key});

  @override
  State<MsgManager> createState() => _MsgManagerState();
}

class _MsgManagerState extends State<MsgManager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.green,
            child: Center(
        child: GestureDetector(
          onTap: () {
            FirebaseAuth.instance.signOut();
          },
          child: const Text('Sign out form MsgManager page'),),
      )
      ),
    );
  }
}