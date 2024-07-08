import 'package:flutter/material.dart';
import 'package:tms/global/form_widgets/from_container_widget.dart';
// import 'package:easy_stepper/easy_stepper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tms/global/toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tms/user_auth/firebase_auth_services.dart';
import 'package:tms/user_nav.dart';
class CreateEmployeeAdmin extends StatefulWidget {
  const CreateEmployeeAdmin({super.key});

  @override
  State<CreateEmployeeAdmin> createState() => CreateEmployeeAdminState();
}

class CreateEmployeeAdminState extends State<CreateEmployeeAdmin> {
  int currentStep = 0;

  final FirebaseAuthService _auth = FirebaseAuthService();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passowrdController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _cprController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _qualificationController = TextEditingController();
  final TextEditingController _empStatusController = TextEditingController();
  final TextEditingController _supervisorIdController = TextEditingController();
  final TextEditingController _emergencyNameController = TextEditingController();
  final TextEditingController _emergencyPhoneController = TextEditingController();
  final TextEditingController _licenseExpiryController = TextEditingController();
  @override

  void dispose() {
    _emailController.dispose();
    _passowrdController.dispose();
    _nameController.dispose();
    _idController.dispose();
    _cprController.dispose();
    _roleController.dispose();
    _phoneController.dispose();
    _dateOfBirthController.dispose();
    _genderController.dispose();
    _addressController.dispose();
    _qualificationController.dispose();
    _empStatusController.dispose();
    _supervisorIdController.dispose();
    _emergencyNameController.dispose();
    _emergencyPhoneController.dispose();
    _licenseExpiryController.dispose();
    super.dispose();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stepper Example'),
      ),
      body: // this code os only for desubmitg the stepper:Theme(data: Theme.of(context).copyWith()...., child: 
      Theme(data: Theme.of(context).copyWith(
        colorScheme: const ColorScheme.light(primary: Colors.blue),
      ), 
        child: Stepper( 
        type: StepperType.horizontal,
        steps: getSteps(),
        currentStep: currentStep,
        onStepTapped: (step) => setState(() => currentStep = step ),
        onStepContinue: () 
        { 
          final lastStep = currentStep == getSteps().length-1;
          // setState((){ if(!lastStep){ currentStep+=1;}else{ _submit();} });
          setState((){ lastStep? _signUp() : currentStep+=1; } );
        },
        onStepCancel: () 
        {
          // currentStep == 0 ? null : () => setState(() => currentStep-=1);
          if (currentStep > 0){setState(() {currentStep -= 1;}); } 
            // else {print('Cancel button pressed on first step');}
        },
// I added this controlsBuilder to customize the buttons 
    controlsBuilder: (BuildContext context, ControlsDetails details) {
      final isLastStep = currentStep == getSteps().length-1;
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed:details.onStepContinue, 
                      child: Text( isLastStep ? 'Confirm' : 'Continue'),
                      ),
                  ),
                ),
                if(currentStep!=0)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: details.onStepCancel, 
                      child: const Text('Back'),
                      ),
                  ),
                ),


        ],
      );
    },
      ),// stepper end
    ),
    );
  }
  List<Step> getSteps() => [
    Step(
      state: currentStep > 0 ? StepState.complete : StepState.indexed,
      isActive: currentStep>=0,
      title: const Text('Step 1'),
      content: 
      

Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('New Employee Information',style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold,),),
              const SizedBox(height: 20,),
               FromContainerWidget(
                controller: _nameController,
                hintText: "Name",
                isPasswordField: false,
               ),
              const SizedBox(height: 10,),
               FromContainerWidget(
                controller: _idController,
                hintText: "ID",
                isPasswordField: false,
               ),
              const SizedBox(height: 10,),
               FromContainerWidget(
                controller: _cprController,
                hintText: "CPR",
                isPasswordField: false,
               ),
              const SizedBox(height: 10,),
               FromContainerWidget(
                controller: _roleController,
                hintText: "Role",
                isPasswordField: false,
               ),
               const SizedBox(height: 10,),
               FromContainerWidget(
                controller: _phoneController,
                hintText: "Phone",
                isPasswordField: false,
               ),

               const SizedBox(height: 20,),

              ],
          ),
        ),
      ),


      

    ),
    Step(
      title: const Text('Step 2'),
      content:
    






    Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('New Employee Information',style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold,),),
              const SizedBox(height: 20,),

               const SizedBox(height: 10,), 
               FromContainerWidget(
                controller: _emailController,
                hintText: "Email",
                isPasswordField: false,
               ),
               const SizedBox(height: 10,),
               FromContainerWidget(
                controller: _dateOfBirthController,
                hintText: "Date of birth",
                isPasswordField: false,
               ),
              const SizedBox(height: 10,),
               FromContainerWidget(
                controller: _genderController,
                hintText: "Gender",
                isPasswordField: false,
               ),
              const SizedBox(height: 10,),
               FromContainerWidget(
                controller: _addressController,
                hintText: "Address",
                isPasswordField: false,
               ),
               const SizedBox(height: 10,),
               FromContainerWidget(
                controller: _qualificationController,
                hintText: "Qualification",
                isPasswordField: false,
               ),
              
              const SizedBox(height: 10,),


              ],
          ),
        ),
      ),
 
      
      isActive: currentStep>=1,
    ),
    Step(
      title: const Text('Final'),
      content:
      


Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('New Employee Information',style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold,),),
              const SizedBox(height: 20,),


               const SizedBox(height: 10,),
               FromContainerWidget(
                controller: _empStatusController,
                hintText: "Employee Status",
                isPasswordField: false,
               ),
               const SizedBox(height: 10,),
               FromContainerWidget(
                controller: _supervisorIdController,
                hintText: "Supervisor ID",
                isPasswordField: false,
               ),
              const SizedBox(height: 10,),
               FromContainerWidget(
                controller: _emergencyNameController,
                hintText: "Emergency name",
                isPasswordField: false,
               ),
              const SizedBox(height: 10,),
               FromContainerWidget(
                controller: _emergencyPhoneController,
                hintText: "Emergency phone",
                isPasswordField: false,
               ),
               const SizedBox(height: 10,),
               FromContainerWidget(
                controller: _licenseExpiryController,
                hintText: "License expiry",
                isPasswordField: false,
               ),
               
              ],
          ),
        ),
      ),
 

      isActive: currentStep>=2,
    ),
  ];


// ______________________________________________________________ inside class
  void _signUp() async {
    // String email = _emailController.text;
    // String availableId = _getNewId();
    String availableId = '';
    availableId = (await _getNewId())!;
    String signUpEmail = '$availableId@abc.com';
    String cprPass = _cprController.text;
    User? user = await _auth.signUpWithEmailAndPassword(signUpEmail, cprPass);
    // if (FirebaseAuth.instance.currentUser != null) {
    if (user != null) {
    //  print('USER ID FROM THE SIGNUP METHOD: ${FirebaseAuth.instance.currentUser?.uid}');
    //  String userId='';
    String? userId= user.uid;
    createEmployee(
    UserModel(
    name: _nameController.text,
    address: _addressController.text,
    dateOfBirth:  _dateOfBirthController.text,
    cpr: _cprController.text,
    role: _roleController.text,
    phone: _phoneController.text,
    email: _emailController.text,
    gender: _genderController.text,
    qualification: _qualificationController.text,
    status: _empStatusController.text,
    supervisorId: _supervisorIdController.text,
    emergencyName:  _emergencyNameController.text,
    emergencyphone:  _emergencyPhoneController.text,
    licenseExpiry:  _licenseExpiryController.text,
    id: null,
    uid: userId,
      )
    );

    }

    if(user != null){
      showToast(message: 'User successfully created', wtime: 4, bgcolor: Colors.green);
      // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
      // Get.to(() => const UserNav());
    }else{
      showToast(message: 'Some error happened', wtime: 4, bgcolor: Colors.amber);
      
    }

  }
  
  // Future<String?> _getNewId() async{
  //   var id=     await getAvailableId();
  //   if(id!=null){
  //   return id;
  //   }
    
  //   return null;



  // }




// ______________________________________________________________



  
}

// ___________________________________________________________________________________ outhside class
_submit() async{
    print('Form is submitted');
    print('Note : submit the form here and create a method to clear all the fields and show notification and redirect to another page');

}
// ___________________________________________________________________________________outhside class


// Create Data Section

void createEmployee(UserModel userModel){
    final userCollection = FirebaseFirestore.instance.collection("users");
    String id = userCollection.doc().id; // we can get a random id from this code
    String uid = FirebaseAuth.instance.currentUser!.uid;
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
  final String? dateOfBirth;// this field should be of type Date()
  final String? gender;
  final String? address;
  final String? qualification;
  final String? status;
  final String? supervisorId;
  final String? emergencyName;
  final String? emergencyphone;
  final String? licenseExpiry; // this field should be of type Date()

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
    name: snapshot['name'],
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

    // _createData(UserModel(username:'mohsen', address:'al qurayyah', age:22, id: null, uid: uid,));
    // createEmployee(
    // UserModel(
    // name: 'John Doe',
    // address: '123 Main Street',
    // dateOfBirth: DateTime(1990, 1, 1),
    // cpr: '1234567890',
    // role: 'driver',
    // phone: '123-456-7890',
    // email: 'johndoe@example.com',
    // gender: 'Male',
    // qualification: 'Bachelor Degree',
    // status: 'Active',
    // supervisorId: 'supervisor123',
    // emergencyName: 'Emergency Contact',
    // emergencyphone: '987-654-3210',
    // licenseExpiry: DateTime(2025, 12, 31),
    // id: null,
    // uid: uid,
    //   )
    // );


// _____________________________

Future<String?> _getNewId() async {
  String? currentAvId = await getLastId();
  int parsedURole = int.tryParse(currentAvId ?? '') ?? 0;
  parsedURole += 1;
  currentAvId = parsedURole.toString().padLeft(5, '0');
  bool updateSuccess = await _updateCurrentId(currentAvId);

  if (updateSuccess) {
    return currentAvId;
  } else {
    return null;
  }
}


Future<String?> getLastId() async {
  DocumentSnapshot docSnapshot =
      await FirebaseFirestore.instance.collection('idCounter').doc('currentIdDocument').get();
  // Access the 'role' field from the retrieved document
  if (docSnapshot.exists) {
    Map<String, dynamic>? data = docSnapshot.data() as Map<String, dynamic>?;
    if (data != null) {
      var currentId = data['currentId'];
      // Return the currentId
      return currentId;
    }
  }
  // User document doesn't exist or data is null
  return null;
}

Future<bool> _updateCurrentId(String uRole) async {
  try {
    final userCollection = FirebaseFirestore.instance.collection("idCounter");
    final newData = {"currentId": uRole};
    await userCollection.doc('currentIdDocument').update(newData);
    return true; // Task succeeded
  } catch (e) {
    print("Error updating available ID: $e");
    return false; // Task failed
  }
}
