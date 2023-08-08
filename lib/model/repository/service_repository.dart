import 'package:da_ginga/model/service_model.dart';
import 'package:get/get.dart';

class ServiceRepository extends GetConnect {
  Future<List<ServiceModel>> getConnection() async {
    final response =
        await get('https://search.reserve4me.de/api/status/details');

    if (response.statusCode == 200) {
      final data = response.body["data"];
      return data
          .map<ServiceModel>((json) => ServiceModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load Services!');
    }
  }
}
