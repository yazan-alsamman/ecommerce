import 'package:tataboq_app/core/class/crud.dart';
import 'package:tataboq_app/linkapi.dart';

class CheckoutData {
  Crud crud;

  CheckoutData(this.crud);

  checkout(Map data) async {
  var response = await crud.postData(AppLink.checkout, data);
  print("Response from server: $response"); // Debug
  return response.fold((l) => l, (r) => r);
}

}
