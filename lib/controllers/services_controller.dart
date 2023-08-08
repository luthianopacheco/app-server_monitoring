import 'package:da_ginga/model/repository/service_repository.dart';
import 'package:da_ginga/model/service_model.dart';
import 'package:get/get.dart';

class ServiceController extends GetxController {
  late final ServiceRepository _repository;
  
  ServiceController(this._repository);

  List<ServiceModel> serviceList = <ServiceModel>[].obs;

  RxBool isLoading = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    getData();
  }

  getData() async {
    isLoading.value = true;

    if (serviceList.isEmpty) {
      final response = await _repository.getConnection();
      serviceList.addAll(response);
    }

    isLoading.value = false;
  }
}
