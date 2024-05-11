import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RoutesDriver extends StatefulWidget {
  const RoutesDriver({super.key});

  @override
  State<RoutesDriver> createState() => _RoutesDriverState();
}

class _RoutesDriverState extends State<RoutesDriver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.grey,
            child: Center(
        child: GestureDetector(
          onTap: () {
            FirebaseAuth.instance.signOut();
          },
          child: const Text('Sign out form RoutesDriver page'),),
      )
      ),
    );
  }
}