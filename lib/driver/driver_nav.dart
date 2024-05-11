import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tms/driver/accident_driver.dart';
import 'package:tms/driver/home_driver.dart';
import 'package:tms/driver/msg_driver.dart';
import 'package:tms/driver/profile_driver.dart';
import 'package:tms/driver/routes_driver.dart';
class DriverNav extends StatefulWidget {
  const DriverNav({super.key});

  @override
  State<DriverNav> createState() => _DriverNavState();
}

class _DriverNavState extends State<DriverNav> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DriverNavigationController());
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

class DriverNavigationController extends GetxController{
 final Rx<int> selectedIndex = 0.obs;

 final screens = [
  const HomeDriver(),
  const AccidentDriver(),
  const RoutesDriver(),
  const MsgDriver(),
  const ProfileDriver()
  ];
}
class THelperFunctions {
  static bool isDarkMode(BuildContext context) {
    final theme = Theme.of(context);
    return theme.brightness == Brightness.dark;
  }

  // Other helper functions...
}
