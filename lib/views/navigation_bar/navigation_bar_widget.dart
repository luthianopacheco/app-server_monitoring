import 'package:da_ginga/views/service/services_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
          height: 70,
          onDestinationSelected: (index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.dashboard_outlined),
              label: "Dashboard",
              selectedIcon: Icon(
                Icons.dashboard,
                color: Color(0xff9d36d2),
              ),
            ),
            NavigationDestination(
              icon: Icon(Icons.work_outline_outlined),
              label: "Services",
              selectedIcon: Icon(
                Icons.work_outlined,
                color: Color(0xff9d36d2),
              ),
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              label: "Profile",
              selectedIcon: Icon(
                Icons.person,
                color: Color(0xff9d36d2),
              ),
            ),
          ]),
      body: [
        AppBar(title: const Text('Dashboard'), centerTitle: true),
        ServicePage(Get.find()),
        AppBar(title: const Text('Profile'), centerTitle: true),
      ][currentPageIndex],
    );
  }
}
