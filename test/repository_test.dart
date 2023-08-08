import 'package:da_ginga/model/repository/service_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final sr = ServiceRepository();

  test("must return api's data", () async {
    final list = await sr.getConnection();
    print(list[4].status);
  });
}
