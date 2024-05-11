// ignore_for_file: prefer_const_constructors
import 'package:tms/global/loading.dart';
import 'package:tms/global/toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tms/user_auth/login_page.dart';
// import 'dart:convert';

//Note:In order to use setState method you have to make sure the widget is stateful 
//and the method is async and use await for the api call .

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('Welcome To Home buddy', style: TextStyle(fontWeight: FontWeight.bold),),),
          SizedBox(height: 30,),

          GestureDetector(
            onTap: () {              
              _createData(UserModel(username:'mohsen', address:'al qurayyah', age:22, id: null,));
              showToast(message: 'Data created successfully', wtime: 4, bgcolor: Colors.green);
            },
            child: Container(
              height: 45,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: Text('Create data', style: TextStyle(color: Colors.white),),),
            ),
          ),
          SizedBox(height: 30,),

          StreamBuilder<List<UserModel>>(
            stream: _readData(),
            builder: (context, snapshot) {
              if(snapshot.connectionState==ConnectionState.waiting){
                // return LoadingWidget(backgroundColor: Colors.blue); 
                return Center(child: CircularProgressIndicator(),);
              }
              // if(snapshot.data!.isEmpty){
              //   return Center(child: Text('No data found'),);
              // }
              if (snapshot.hasData && snapshot.data!.isEmpty) {
                return Center(child: Text('No data found'));
              }
              final users = snapshot.data;
              return Padding(padding: EdgeInsets.all(8),
              child: Column(
                children: users?.map((user){
              return ListTile(
                    leading: GestureDetector(
                      onTap: () {
                        _deleteData(user.id!);
                      },
                      child: Icon(Icons.delete),
                      ),
                      trailing: GestureDetector(
                        onTap: (){
                          _updateData(
                            UserModel(
                              id: user.id,
                              username: 'Mohsen Abbas',
                              address: 'new Address',
                              // if I created a method for updating data I should first check if
                              // the value is null if so the previous value will be in the field of the new value
                            )
                          );
                        },
                        child: Icon(Icons.update),
                      ),
                      title: Text(user.username??'No Data 3'),
                      subtitle: Text(user.address??'No Data 3'),
                  );
                }).toList()??[],
                
                ),);
            }
          ),
          
          SizedBox(height: 30,),

          GestureDetector(
            onTap: (){
              FirebaseAuth.instance.signOut();
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
              showToast(message: 'successfully signed out', wtime: 4, bgcolor: Colors.blue);
            },
            child: Container(
              height: 45,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: Text('Sign out', style: TextStyle(color: Colors.white),),),
            ),

          ),
        ],

      ),
    );
  }

  void _updateData(UserModel userModel) async{
      setState(() {
        // _isSigning=true;
    // Show the loading widget
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Loading();
      },
    );
      });
    
    final userCollection = FirebaseFirestore.instance.collection("users");
    final newData = UserModel(
      id: userModel.id,
      username: userModel.username,
      address: userModel.address,
      age: userModel.age
    ).toJson();

     await userCollection.doc(userModel.id).update(newData);

        setState(() {
      // _isSigning=false;      
      Navigator.of(context).pop();
    });
  }

// void _updateData(UserModel userModel) {
  void _deleteData(String id) {
    final userCollection = FirebaseFirestore.instance.collection("users");

    userCollection.doc(id).delete();
  }
}
  

// Create Data Section

  void _createData(UserModel userModel){
     final userCollection = FirebaseFirestore.instance.collection("users");
     String id = userCollection.doc().id;

     final newUser = UserModel(
      id:id,
      username: userModel.username,
      address: userModel.address,
      age: userModel.age,
     ).toJson();
     userCollection.doc(id).set(newUser);
}

class UserModel{
  final String? id;
  final String? username;
  final String? address;
  final int? age;

  UserModel({required this.id,this.username,this.address,this.age});


  static UserModel fromSnapshot(DocumentSnapshot<Map<String,dynamic>>snapshot){
    return UserModel(
      id: snapshot['id'],
      username: snapshot['username'],
      address: snapshot['address'],
      age: snapshot['age'],
    );
  }
  // I can modify this method to make it put 'Unknown' if the data were missing 
  //   static UserModel fromSnapshot(DocumentSnapshot<Map<String,dynamic>>snapshot){
  //     final data =snapshot.data();
  //   return UserModel(
  //     id: snapshot['id'],
  //     username: data?['username'] ??'Unknown',
  //     address: data?['address'] ??'Unknown',
  //     age: data?['age'] ?? 0,
  //   );
  // }
  // 
    Map<String,dynamic>toJson(){
    return{
      "id": id,
      "username": username,
      "address": address,
      "age": age,
    };
}

}
// Create Data Section  End

// Read data

Stream<List<UserModel>> _readData() {
  final userCollection = FirebaseFirestore.instance.collection("users");
  return userCollection.snapshots().map(
    (querySnapshot) => querySnapshot.docs
        .map((e) => UserModel.fromSnapshot(e))
        .toList(),
  );
}
// _____________
// Future<void> fetchData(userId) async {
//   QuerySnapshot querySnapshot =
//       await FirebaseFirestore.instance.collection('users').get();

//   // Process the retrieved documents
//   querySnapshot.docs.forEach((doc) {
//     // Decode the JSON data
//     Map<String, dynamic> data = jsonDecode(doc.data().toString());

//     // Now you can access the fields in the `data` map
//     var name = data['name'];
//     var age = data['age'];

//     // Do whatever you need with the decoded data
//     // ...
//   });
// }

// Future<String> getUserRole(String userId) async {
//   DocumentSnapshot docSnapshot = await FirebaseFirestore.instance.collection('users').doc(userId).get();

//   // Access the 'role' field from the retrieved document
//   if (docSnapshot.exists) {
//     Map<String, dynamic> data = docSnapshot.data();
//     var role = data['role'];

//     // Return the user role
//     return role;
//   } else {
//     // User document doesn't exist
//     return null;
//   }
// }

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
