import 'package:da_ginga/controllers/services_controller.dart';
import 'package:da_ginga/model/repository/service_repository.dart';
import 'package:get/instance_manager.dart';

class ServicesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServiceRepository>(() => ServiceRepository());
    Get.lazyPut<ServiceController>(() => ServiceController(Get.find<ServiceRepository>()));
  }
}
