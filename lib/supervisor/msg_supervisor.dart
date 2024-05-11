import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MsgSupervisor extends StatefulWidget {
  const MsgSupervisor({super.key});

  @override
  State<MsgSupervisor> createState() => _MsgSupervisorState();
}

class _MsgSupervisorState extends State<MsgSupervisor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.green,
            child: Center(
        child: GestureDetector(
          onTap: () {
            FirebaseAuth.instance.signOut();
          },
          child: const Text('Sign out form MsgSupervisor page'),),
      )
      ),
    );
  }
}