import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tms/admin/admin_nav.dart';
import 'package:tms/driver/driver_nav.dart';
import 'package:tms/global/loading.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tms/manager/manager_nav.dart';
import 'package:tms/supervisor/supervisor_nav.dart';
import 'package:tms/user_auth/login_page.dart';

// import 'package:permission_handler/permission_handler.dart';
class UserNav extends StatefulWidget {
  const UserNav({super.key});

  @override
  State<UserNav> createState() => _UserNavState();
}

class _UserNavState extends State<UserNav> {

  @override
  void initState() {
  FirebaseAuth.instance.authStateChanges().listen((User? user) async {
    if (user == null) {
      Get.to(() => const LoginPage());
    } else {
      String? uRole = await getUserRole(user.uid);
      if (uRole == 'admin') {
         Get.offAll(() => const AdminNav());
        //  The Get.offAll method replaces all the existing routes with the new route, removing the back arrow from the app bar. This ensures that when you navigate to the AdminNav page, there won't be a previous page to go back to, and the back arrow will not be displayed in the app bar.
      } else if (uRole == 'manager') {
       Get.offAll(() => const ManagerNav());
      } else if (uRole == 'supervisor') {
       Get.offAll(() => const SupervisorNav());
      } else if (uRole == 'driver') {
       Get.offAll(() => const DriverNav());
      } else {
       Get.offAll(() => const LoginPage());
      }
    }
  });
  super.initState();
}
  @override
  Widget build(BuildContext context) {
    return const Loading();
  }
}
Future<String?> getUserRole(String userId) async {
  DocumentSnapshot docSnapshot =
      await FirebaseFirestore.instance.collection('users').doc(userId).get();

  // Access the 'role' field from the retrieved document
  if (docSnapshot.exists) {
    Map<String, dynamic>? data = docSnapshot.data() as Map<String, dynamic>?;

    if (data != null) {
      var role = data['role'];
      // Return the user role
      return role;
    }
  }
  // User document doesn't exist or data is null
  return null;
}