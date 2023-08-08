import 'package:da_ginga/controllers.dart/service_details_controller.dart';
import 'package:get/get.dart';

class ServiceDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServiceDetailsController>(() => ServiceDetailsController());
  }
}
