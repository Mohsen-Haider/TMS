import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AccidentAdmin extends StatefulWidget {
  const AccidentAdmin({super.key});

  @override
  State<AccidentAdmin> createState() => _AccidentAdminState();
}

class _AccidentAdminState extends State<AccidentAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.blue,
            child: Center(
        child: GestureDetector(
          onTap: () {
            FirebaseAuth.instance.signOut();
          },
          child: const Text('Sign out form AccidentAdmin page'),),
      )
      ),
    );
  }
}