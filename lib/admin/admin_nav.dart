import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tms/admin/bus_admin.dart';
import 'package:tms/admin/home_admin.dart';
import 'package:tms/admin/msg_admin.dart';
import 'package:tms/admin/profile_admin.dart';
import 'package:tms/admin/employee_admin.dart';
class AdminNav extends StatefulWidget {
  const AdminNav({super.key});
  @override
  State<AdminNav> createState() => _AdminNavState();
}
class _AdminNavState extends State<AdminNav> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminNavigationController());
    // final darkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        ()=> NavigationBar(
          height: 80,
          // elevation: 0.5,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected:  (index)=> controller.selectedIndex.value = index,
          // backgroundColor: darkMode? Colors.white : Colors.black,
          // indicatorColor:  darkMode? Colors.black : Colors.white,
          destinations:const [
            NavigationDestination(icon: Icon(Icons.home, color: Colors.blue,), label:'Home'),
            NavigationDestination(icon: Icon(Icons.directions_bus, color: Colors.blue,), label: 'Bus'),
            NavigationDestination(icon: Icon(Icons.people, color: Colors.blue,), label: 'Employees'),
            NavigationDestination(icon: Icon(Icons.chat, color: Colors.blue,), label: 'Msg'),
            NavigationDestination(icon: Icon(Icons.person, color: Colors.blue,), label: 'profile'),
        ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class AdminNavigationController extends GetxController{
 final Rx<int> selectedIndex = 0.obs;

 final screens = [
  const HomeAdmin(),
  const BusAdmin(),
  const EmployeeAdmin(),
  const MsgAdmin(),
  const ProfileAdmin()
  ];
}
class THelperFunctions {
  static bool isDarkMode(BuildContext context) {
    final theme = Theme.of(context);
    return theme.brightness == Brightness.dark;
  }

  // Other helper functions...
}

