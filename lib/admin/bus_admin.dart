import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BusAdmin extends StatefulWidget {
  const BusAdmin({super.key});

  @override
  State<BusAdmin> createState() => _BusAdminState();
}

class _BusAdminState extends State<BusAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.blue,
            child: Center(
        child: GestureDetector(
          onTap: () {
            FirebaseAuth.instance.signOut();
          },
          child: const Text('Sign out form BusAdmin page'),),
      )
      ),
    );
  }
}