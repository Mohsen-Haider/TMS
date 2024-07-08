// ignore_for_file: prefer_const_constructors, prefer_final_fields, avoid_print, use_build_context_synchronously
import 'package:get/get.dart';
import 'package:tms/global/loading.dart';
import 'package:tms/global/toast.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tms/user_auth/reset_password.dart';
import 'package:tms/user_auth/sign_up_page.dart';
import 'package:tms/global/form_widgets/from_container_widget.dart';
import 'package:tms/user_auth/firebase_auth_services.dart';
import 'package:tms/user_nav.dart';
// import 'package:permission_handler/permission_handler.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
    if (user == null) {
      print('init State signed out');
    } else {
      print('init State signed in');
      Get.to(()=> const UserNav());
    }
  });
    super.initState();
  }

  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passowrdController = TextEditingController();

  @override

  void dispose() {
    _emailController.dispose();
    _passowrdController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.blue,
        elevation: 5,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text('Login',style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold,),),
               SizedBox(height: 30,),
               FromContainerWidget(
                controller: _emailController,
                hintText: "Email",
                isPasswordField: false,
               ),
               SizedBox(height: 10,),
               FromContainerWidget(
                controller: _passowrdController,
                hintText: "Password",
                isPasswordField: true,
               ),

                SizedBox(height: 30,),
                GestureDetector(
                  onTap:_signIn,
                  child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration: 
                    BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  child: Center(child: Text('Login',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
                                 ),
                ),

               SizedBox(height: 20,),

               Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Forgot password?",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                    SizedBox(width: 5,),
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage())); // we replaced this in order to remove the arrow of going back '<---'
                        // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SignUpPage()), (route) => false);
                        Get.offAll(()=>const ResetPassword());

                      },
                      child: Center(child: Text('Reset password',style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),)),
                    ),

                  ],
                ),

            ],
          ),
        ),
      ),
    );
  }

    void _signIn() async {
      setState(() {
    // Show the loading widget
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Loading();
      },
    );
      });
    String email = _emailController.text;
    String password = _passowrdController.text;
    User? user = await _auth.signInWithEmailAndPassword(email, password);

    setState(() {
      Navigator.of(context).pop();
    });
    if(user != null){
  FirebaseAuth.instance.authStateChanges().listen((User? user) async {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
      Get.to(()=> const UserNav());
    }
  });
      showToast(message: 'User successfully signedIn', wtime: 4, bgcolor: Colors.blue);
    }
    else{showToast(message: 'Some error happened', wtime: 4, bgcolor: Colors.red); }

  }

}
