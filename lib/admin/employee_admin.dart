import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tms/admin/pages/create_employee_admin.dart';
import 'package:tms/user_auth/login_page.dart';

class EmployeeAdmin extends StatefulWidget {
  const EmployeeAdmin({super.key});

  @override
  State<EmployeeAdmin> createState() => _EmployeeAdminState();
}
  
class _EmployeeAdminState extends State<EmployeeAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.grey,
            child: Center(
        child: GestureDetector(
          onTap: () {
            FirebaseAuth.instance.signOut();
            // Get.offAll(()=> const LoginPage()); for every page I think we should add this so the user cannot go back after signing out 
          },
          child: const Text('Sign out form EmployeeAdmin page'),),
      ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.to(()=> const CreateEmployeeAdmin());
      },
      backgroundColor: Colors.lightBlue,
      foregroundColor: Colors.white,
      shape: const CircleBorder(),
      child: const Icon(Icons.person_add),
      ),
    );
  }
}
