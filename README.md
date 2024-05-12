# tms

A new Flutter project.

## Getting Started 
<h1>The packages that I have installed</h1>
<p>
flutter pub add firebase_core

dart pub global activate flutterfire_cli

npm install -g firebase-tools

firebase login

firebase projects:list

firebase login:ci

// this code to choose the service 
firebase init

flutterfire configure

flutter pub add firebase_auth

flutter pub add firebase_storage

flutter pub add cloud_firestore

flutter pub add permission_handler

flutter pub add fluttertoast

flutter pub add flutter_spinkit

flutter pub add flutter_slidable

flutter pub add get

flutter pub add firebase_database

flutter pub add easy_stepper

flutter run

</p>

<h2> After install the packages  </h2>
<p>
 <!-- Add this to main.dart -->

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

</p>

<h1>android permissions</h1>
<!--Note:Add permissions in file:///D:/My%20Flutter%20apps/app2/android/app/src/main/AndroidManifest.xml -->
<p>

<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
<uses-permission android:name="android.permission.CAMERA"/>
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
<uses-permission android:name="android.permission.BLUETOOTH"/>
<uses-permission android:name="android.permission.BLUETOOTH_ADMIN"/>
 </p>

 <h1>To use permission handler</h1>

 <p>
 <!-- install : flutter pub add permission_handler -->
<!-- add :  import 'package:permission_handler/permission_handler.dart'; -->

// Check if location permission is granted
if (await Permission.location.isGranted) {
  // The location permission is already granted
  // or the user just granted it.
} else {
  // Request the location permission
  var status = await Permission.location.request();
  if (status.isGranted) {
    // The location permission has been granted.
  } else {
    // The location permission has been denied.
  }
}
 </p>