import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RoutesManager extends StatefulWidget {
  const RoutesManager({super.key});

  @override
  State<RoutesManager> createState() => _RoutesManagerState();
}

class _RoutesManagerState extends State<RoutesManager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.grey,
            child: Center(
        child: GestureDetector(
          onTap: () {
            FirebaseAuth.instance.signOut();
          },
          child: const Text('Sign out form RoutesManager page'),),
      )
      ),
    );
  }
}