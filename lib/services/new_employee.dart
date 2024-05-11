import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class NewEmployee extends StatefulWidget {
  const NewEmployee({super.key});

  @override
  State<NewEmployee> createState() => _NewEmployeeState();
}

class _NewEmployeeState extends State<NewEmployee> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

// Create Data Section

void createEmployee(UserModel userModel){
    final userCollection = FirebaseFirestore.instance.collection("users");
    String id = userCollection.doc().id; // we can get a random id from this code
    final newUser = UserModel(
      id: id,
      uid: userModel.uid,
      name: userModel.name,
      address: userModel.address,
      dateOfBirth: userModel.dateOfBirth,
      cpr: userModel.cpr,
      role: userModel.role,
      phone: userModel.phone,
      email: userModel.email,
      gender: userModel.gender,
      qualification: userModel.qualification,
      status: userModel.status,
      supervisorId: userModel.supervisorId,
      emergencyName: userModel.emergencyName,
      emergencyphone: userModel.emergencyphone,
      licenseExpiry: userModel.licenseExpiry,
    ).toJson();
    userCollection.doc(id).set(newUser);
}

class UserModel{
  final String? id;
  final String? uid;
  final String? name;
  final String? cpr;
  final String? role;
  final String? phone;
  final String? email;
  final DateTime? dateOfBirth;
  final String? gender;
  final String? address;
  final String? qualification;
  final String? status;
  final String? supervisorId;
  final String? emergencyName;
  final String? emergencyphone;
  final DateTime? licenseExpiry;

  // UserModel({required this.id,required this.uid,this.name,this.address,this.dateOfBirth});
UserModel({
    required this.id,
    required this.uid,
    this.name,
    this.cpr,
    this.role,
    this.phone,
    this.email,
    this.dateOfBirth,
    this.gender,
    this.address,
    this.qualification,
    this.status,
    this.supervisorId,
    this.emergencyName,
    this.emergencyphone,
    this.licenseExpiry,
});


static UserModel fromSnapshot(DocumentSnapshot<Map<String,dynamic>>snapshot){
  return UserModel(
    id: snapshot['id'],
    uid: snapshot['uid'],
    name: snapshot['username'],
    address: snapshot['address'],
    dateOfBirth: snapshot['age'],
    cpr: snapshot['cpr'],
    role: snapshot['role'],
    phone: snapshot['phone'],
    email: snapshot['email'],
    gender: snapshot['gender'],
    qualification: snapshot['qualification'],
    status: snapshot['status'],
    supervisorId: snapshot['supervisorId'],
    emergencyName: snapshot['emergencyName'],
    emergencyphone: snapshot['emergencyphone'],
    licenseExpiry: snapshot['licenseExpiry'],
  );
}

Map<String,dynamic>toJson(){
  return{
    "id": id,
    "uid": uid,
    "username": name,
    "address": address,
    "age": dateOfBirth,
    "cpr": cpr,
    "role": role,
    "phone": phone,
    "email": email,
    "gender": gender,
    "qualification": qualification,
    "status": status,
    "supervisorId": supervisorId,
    "emergencyName": emergencyName,
    "emergencyphone": emergencyphone,
    "licenseExpiry": licenseExpiry,
  };
}

}