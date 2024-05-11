import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AccidentDriver extends StatefulWidget {
  const AccidentDriver({super.key});

  @override
  State<AccidentDriver> createState() => _AccidentDriverState();
}

class _AccidentDriverState extends State<AccidentDriver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.blue,
            child: Center(
        child: GestureDetector(
          onTap: () {
            FirebaseAuth.instance.signOut();
          },
          child: const Text('Sign out form AccidentDriver page'),),
      )
      ),
    );
  }
}