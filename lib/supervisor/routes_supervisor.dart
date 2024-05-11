import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RoutesSupervisor extends StatefulWidget {
  const RoutesSupervisor({super.key});

  @override
  State<RoutesSupervisor> createState() => _RoutesSupervisorState();
}

class _RoutesSupervisorState extends State<RoutesSupervisor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.grey,
            child: Center(
        child: GestureDetector(
          onTap: () {
            FirebaseAuth.instance.signOut();
          },
          child: const Text('Sign out form RoutesSupervisor page'),),
      )
      ),
    );
  }
}