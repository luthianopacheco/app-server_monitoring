import 'package:da_ginga/controllers.dart/services_controller.dart';
import 'package:da_ginga/model/service_model.dart';
import 'package:get/get.dart';

class ServiceDetailsController extends GetxController {
  ServiceModel? selectedService;
  RxBool isLoading = false.obs;

  getByIndex(int index) async {
    isLoading.value = true;

    final serviceList = Get.find<ServiceController>().serviceList;

    if (serviceList.isNotEmpty) {
      selectedService = serviceList[index];
    }

    isLoading.value = false;
  }

  restartService() {}
}
