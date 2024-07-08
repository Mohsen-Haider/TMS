// ignore_for_file: prefer_const_constructors, unused_local_variable, avoid_print, use_build_context_synchronously, prefer_final_fields
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tms/user_auth/login_page.dart';
import 'package:tms/global/toast.dart';
// import 'package:tms/user_auth/home_page.dart';
import 'package:tms/global/form_widgets/from_container_widget.dart';
import 'package:tms/user_auth/firebase_auth_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tms/user_nav.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {

  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passowrdController = TextEditingController();

  @override

  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passowrdController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignUp'),
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
               Text('Sign Up',style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold,),),
               SizedBox(height: 30,),
               FromContainerWidget(
                controller: _usernameController,
                hintText: "Username",
                isPasswordField: false,
               ),
               SizedBox(height: 10,),
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
                  onTap: _signUp,
                  child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration: 
                    BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  child: Center(child: Text('Sign Up',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
                                 ),
                ),

                SizedBox(height: 20,),

               Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    SizedBox(width: 5,),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
                      },
                      child: Center(child: Text('Login',style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),)),
                    ),

                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }



  void _signUp() async {
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passowrdController.text;
    User? user = await _auth.signUpWithEmailAndPassword(email, password);
    if (FirebaseAuth.instance.currentUser != null) {
    //  print('USER ID FROM THE SIGNUP METHOD: ${FirebaseAuth.instance.currentUser?.uid}');
     String uid='';
     uid= FirebaseAuth.instance.currentUser!.uid;
    //  print('User Id from the variable uid: $uid');
    //  Here I should call create profile method
    // _createData(UserModel(username:'mohsen', address:'al qurayyah', age:22, id: null, uid: uid,));
    createEmployee(
    UserModel(
    name: 'John Doe',
    address: '123 Main Street',
    dateOfBirth: DateTime(1990, 1, 1),
    cpr: '1234567890',
    role: 'driver',
    phone: '123-456-7890',
    email: 'johndoe@example.com',
    gender: 'Male',
    qualification: 'Bachelor Degree',
    status: 'Active',
    supervisorId: 'supervisor123',
    emergencyName: 'Emergency Contact',
    emergencyphone: '987-654-3210',
    licenseExpiry: DateTime(2025, 12, 31),
    id: null,
    uid: uid,
      )
    );
    }

    if(user != null){
      showToast(message: 'User successfully created', wtime: 4, bgcolor: Colors.green);
      // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
      Get.to(() => const UserNav());
    }else{
      showToast(message: 'Some error happened', wtime: 4, bgcolor: Colors.amber);
      
    }

  }
}
// ___________________

// Create Data Section

void createEmployee(UserModel userModel){
    final userCollection = FirebaseFirestore.instance.collection("users");
    String id = userCollection.doc().id; // we can get a random id from this code
    String uid= FirebaseAuth.instance.currentUser!.uid;
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
    userCollection.doc(uid).set(newUser);
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
