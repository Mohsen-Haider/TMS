import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tms/manager/accident_manager.dart';
import 'package:tms/manager/home_manager.dart';
import 'package:tms/manager/msg_manager.dart';
import 'package:tms/manager/profile_manager.dart';
import 'package:tms/manager/routes_manager.dart';
class ManagerNav extends StatefulWidget {
  const ManagerNav({super.key});
  @override
  State<ManagerNav> createState() => _ManagerNavState();
}
class _ManagerNavState extends State<ManagerNav> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ManagerNavigationController());
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
            NavigationDestination(icon: Icon(Icons.bus_alert, color: Colors.blue,), label: 'Accident'),
            NavigationDestination(icon: Icon(Icons.map, color: Colors.blue,), label: 'Routes'),
            NavigationDestination(icon: Icon(Icons.chat, color: Colors.blue,), label: 'Msg'),
            NavigationDestination(icon: Icon(Icons.person, color: Colors.blue,), label: 'profile'),
        ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class ManagerNavigationController extends GetxController{
 final Rx<int> selectedIndex = 0.obs;

 final screens = [
  const HomeManager(),
  const AccidentManager(),
  const RoutesManager(),
  const MsgManager(),
  const ProfileManager()
  ];
}
class THelperFunctions {
  static bool isDarkMode(BuildContext context) {
    final theme = Theme.of(context);
    return theme.brightness == Brightness.dark;
  }

  // Other helper functions...
}

