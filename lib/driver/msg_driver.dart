import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MsgDriver extends StatefulWidget {
  const MsgDriver({super.key});

  @override
  State<MsgDriver> createState() => _MsgDriverState();
}

class _MsgDriverState extends State<MsgDriver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.green,
            child: Center(
        child: GestureDetector(
          onTap: () {
            FirebaseAuth.instance.signOut();
          },
          child: const Text('Sign out form MsgDriver page'),),
      )
      ),
    );
  }
}