import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RoutesAdmin extends StatefulWidget {
  const RoutesAdmin({super.key});

  @override
  State<RoutesAdmin> createState() => _RoutesAdminState();
}

class _RoutesAdminState extends State<RoutesAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.grey,
            child: Center(
        child: GestureDetector(
          onTap: () {
            FirebaseAuth.instance.signOut();
          },
          child: const Text('Sign out form RoutesAdmin page'),),
      )
      ),
    );
  }
}