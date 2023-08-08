import 'package:da_ginga/bindings/service_details_binding.dart';
import 'package:da_ginga/bindings/services_binding.dart';
import 'package:da_ginga/controllers/service_details_controller.dart';
import 'package:da_ginga/controllers/services_controller.dart';
import 'package:da_ginga/views/navigation_bar/navigation_bar_widget.dart';
import 'package:da_ginga/views/service/services_page.dart';
import 'package:da_ginga/views/service_details/service_details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      defaultTransition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 400),
      initialRoute: '/navigationBar',
      initialBinding: ServicesBinding(),
      getPages: [
        GetPage(
          name: '/services',
          page: () => ServicePage(Get.find<ServiceController>()),
          binding: ServicesBinding(),
        ),
        GetPage(
          name: '/serviceDetails',
          page: () => ServiceDetailsPage(Get.find<ServiceDetailsController>()),
          binding: ServiceDetailsBinding(),
        ),
        GetPage(
          name: '/navigationBar',
          page: () => const NavigationPage(),
        )
      ],
    );
  }
}
