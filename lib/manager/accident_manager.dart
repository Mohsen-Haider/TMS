import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AccidentManager extends StatefulWidget {
  const AccidentManager({super.key});

  @override
  State<AccidentManager> createState() => _AccidentManagerState();
}

class _AccidentManagerState extends State<AccidentManager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.blue,
            child: Center(
        child: GestureDetector(
          onTap: () {
            FirebaseAuth.instance.signOut();
          },
          child: const Text('Sign out form AccidentManager page'),),
      )
      ),
    );
  }
}