// ignore_for_file: prefer_const_constructors, unused_local_variable, avoid_print, use_build_context_synchronously, prefer_final_fields
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tms/global/toast.dart';

class FirebaseAuthService{
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(String email, String password) async {
    try{
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return credential.user;
    }on FirebaseAuthException catch(e){
      if(e.code=='email-already-in-use'){
        showToast(message:'The email address is already in use.',wtime:10 ,bgcolor:Colors.amber);
      }else{
        showToast(message:'Some error occured: ${e.code}',wtime:10 ,bgcolor: Colors.blue );
      }
    }
    return null;
  }

    Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try{
      UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    }on FirebaseAuthException catch(e){
      if(e.code=='user-not-found'|| e.code=='wrong-password'){
        showToast(message:'Invalid email or password',wtime:10 , bgcolor: Colors.blue );
      }else{
        showToast(message:'Some error occured: ${e.code}',wtime:10 ,bgcolor:Colors.blue);
      }
    }
    return null;
  }

}