import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tms/supervisor/accident_supervisor.dart';
import 'package:tms/supervisor/home_supervisor.dart';
import 'package:tms/supervisor/msg_supervisor.dart';
import 'package:tms/supervisor/profile_supervisor.dart';
import 'package:tms/supervisor/routes_supervisor.dart';
class SupervisorNav extends StatefulWidget {
  const SupervisorNav({super.key});
  @override
  State<SupervisorNav> createState() => _SupervisorNavState();
}
class _SupervisorNavState extends State<SupervisorNav> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SupervisorNavigationController());
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

class SupervisorNavigationController extends GetxController{
 final Rx<int> selectedIndex = 0.obs;

 final screens = [
  const HomeSupervisor(),
  const AccidentSupervisor(),
  const RoutesSupervisor(),
  const MsgSupervisor(),
  const ProfileSupervisor()
  ];
}
class THelperFunctions {
  static bool isDarkMode(BuildContext context) {
    final theme = Theme.of(context);
    return theme.brightness == Brightness.dark;
  }

  // Other helper functions...
}

