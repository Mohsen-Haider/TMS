import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AccidentSupervisor extends StatefulWidget {
  const AccidentSupervisor({super.key});

  @override
  State<AccidentSupervisor> createState() => _AccidentSupervisorState();
}

class _AccidentSupervisorState extends State<AccidentSupervisor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.blue,
            child: Center(
        child: GestureDetector(
          onTap: () {
            FirebaseAuth.instance.signOut();
          },
          child: const Text('Sign out form AccidentSupervisor page'),),
      )
      ),
    );
  }
}