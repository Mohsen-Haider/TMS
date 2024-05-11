import 'package:flutter/material.dart';
import 'package:tms/global/form_widgets/from_container_widget.dart';
import 'package:easy_stepper/easy_stepper.dart';
class CreateEmployeeAdmin extends StatefulWidget {
  const CreateEmployeeAdmin({super.key});

  @override
  State<CreateEmployeeAdmin> createState() => CreateEmployeeAdminState();
}

class CreateEmployeeAdminState extends State<CreateEmployeeAdmin> {
  int currentStep = 0;
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
      body: Stepper(
        type: StepperType.horizontal,
        steps: getSteps(),
        currentStep: currentStep,
        onStepContinue: () 
        {
          final lastStep = currentStep == getSteps().length-1;
          setState((){
            if(!lastStep){
              currentStep+=1;
            }
          });
        },
        onStepCancel: () 
        {
          // currentStep == 0 ? null : () => setState(() => currentStep-=1);
          if (currentStep > 0) {
    setState(() {
      currentStep -= 1;
    });
  } else {
    // Handle cancel action when on the first step
    // You can add your own logic here
    print('Cancel button pressed on first step');
  }
        },

      ),
    );
  }
  List<Step> getSteps() => [
    Step(
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


      isActive: currentStep>=0,
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

                const SizedBox(height: 30,),
                GestureDetector(
                  onTap:(){},
                  child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration: 
                    BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  child: const Center(child: Text('Supmit',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),),
                ),

               const SizedBox(height: 20,),

              ],
          ),
        ),
      ),
 

      isActive: currentStep>=2,
    ),
  ];
}








// __________________________________________

// // import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:tms/user_auth/firebase_auth_services.dart';
// import 'package:tms/global/form_widgets/from_container_widget.dart';
// class CreateEmployeeAdmin extends StatefulWidget {
//   const CreateEmployeeAdmin({super.key});

//   @override
//   State<CreateEmployeeAdmin> createState() => CreateEmployeeAdminState();
// }

// class CreateEmployeeAdminState extends State<CreateEmployeeAdmin> {

//   // final FirebaseAuthService _auth = FirebaseAuthService();

//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passowrdController = TextEditingController();
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _idController = TextEditingController();
//   final TextEditingController _cprController = TextEditingController();
//   final TextEditingController _roleController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _dateOfBirthController = TextEditingController();
//   final TextEditingController _genderController = TextEditingController();
//   final TextEditingController _addressController = TextEditingController();
//   final TextEditingController _qualificationController = TextEditingController();
//   final TextEditingController _empStatusController = TextEditingController();
//   final TextEditingController _supervisorIdController = TextEditingController();
//   final TextEditingController _emergencyNameController = TextEditingController();
//   final TextEditingController _emergencyPhoneController = TextEditingController();
//   final TextEditingController _licenseExpiryController = TextEditingController();
//   @override

//   void dispose() {
//     _emailController.dispose();
//     _passowrdController.dispose();
//     _nameController.dispose();
//     _idController.dispose();
//     _cprController.dispose();
//     _roleController.dispose();
//     _phoneController.dispose();
//     _dateOfBirthController.dispose();
//     _genderController.dispose();
//     _addressController.dispose();
//     _qualificationController.dispose();
//     _empStatusController.dispose();
//     _supervisorIdController.dispose();
//     _emergencyNameController.dispose();
//     _emergencyPhoneController.dispose();
//     _licenseExpiryController.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//         title: const Text('Home Page'),
//         backgroundColor: Colors.blue,
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: Column(
//             // mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text('New Employee Information',style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold,),),
//               const SizedBox(height: 20,),
//                FromContainerWidget(
//                 controller: _nameController,
//                 hintText: "Name",
//                 isPasswordField: false,
//                ),
//               const SizedBox(height: 10,),
//                FromContainerWidget(
//                 controller: _idController,
//                 hintText: "ID",
//                 isPasswordField: false,
//                ),
//               const SizedBox(height: 10,),
//                FromContainerWidget(
//                 controller: _cprController,
//                 hintText: "CPR",
//                 isPasswordField: false,
//                ),
//               const SizedBox(height: 10,),
//                FromContainerWidget(
//                 controller: _roleController,
//                 hintText: "Role",
//                 isPasswordField: false,
//                ),
//                const SizedBox(height: 10,),
//                FromContainerWidget(
//                 controller: _phoneController,
//                 hintText: "Phone",
//                 isPasswordField: false,
//                ),


//               //  const SizedBox(height: 10,), 
//               //  FromContainerWidget(
//               //   controller: _emailController,
//               //   hintText: "Email",
//               //   isPasswordField: false,
//               //  ),
//               //  const SizedBox(height: 10,),
//               //  FromContainerWidget(
//               //   controller: _dateOfBirthController,
//               //   hintText: "Date of birth",
//               //   isPasswordField: false,
//               //  ),
//               // const SizedBox(height: 10,),
//               //  FromContainerWidget(
//               //   controller: _genderController,
//               //   hintText: "Gender",
//               //   isPasswordField: false,
//               //  ),
//               // const SizedBox(height: 10,),
//               //  FromContainerWidget(
//               //   controller: _addressController,
//               //   hintText: "Address",
//               //   isPasswordField: false,
//               //  ),
//               //  const SizedBox(height: 10,),
//               //  FromContainerWidget(
//               //   controller: _qualificationController,
//               //   hintText: "Qualification",
//               //   isPasswordField: false,
//               //  ),



//               //  const SizedBox(height: 10,),
//               //  FromContainerWidget(
//               //   controller: _empStatusController,
//               //   hintText: "Employee Status",
//               //   isPasswordField: false,
//               //  ),
//               //  const SizedBox(height: 10,),
//               //  FromContainerWidget(
//               //   controller: _supervisorIdController,
//               //   hintText: "Supervisor ID",
//               //   isPasswordField: false,
//               //  ),
//               // const SizedBox(height: 10,),
//               //  FromContainerWidget(
//               //   controller: _emergencyNameController,
//               //   hintText: "Emergency name",
//               //   isPasswordField: false,
//               //  ),
//               // const SizedBox(height: 10,),
//               //  FromContainerWidget(
//               //   controller: _emergencyPhoneController,
//               //   hintText: "Emergency phone",
//               //   isPasswordField: false,
//               //  ),
//               //  const SizedBox(height: 10,),
//               //  FromContainerWidget(
//               //   controller: _licenseExpiryController,
//               //   hintText: "License expiry",
//               //   isPasswordField: false,
//               //  ),

//                 const SizedBox(height: 30,),
//                 GestureDetector(
//                   onTap:(){},
//                   child: Container(
//                   width: double.infinity,
//                   height: 45,
//                   decoration: 
//                     BoxDecoration(
//                       color: Colors.blue,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   child: const Center(child: Text('Supmit',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
//                                  ),
//                 ),

//                const SizedBox(height: 20,),

//               ],
//           ),
//         ),
//       ),
//     );
//   }
// }
