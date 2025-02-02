import 'package:tataboq_app/core/class/crud.dart';
import 'package:tataboq_app/linkapi.dart';

class TestData {
  Crud crud;

  TestData(this.crud);

  getData() async {
  var response = await crud.postData(AppLink.test, {});
  print("Response from server: $response"); // Debug
  return response.fold((l) => l, (r) => r);
}

}
