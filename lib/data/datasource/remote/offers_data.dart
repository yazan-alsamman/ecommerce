import 'package:tataboq_app/core/class/crud.dart';
import 'package:tataboq_app/linkapi.dart';

class OfferData {
  Crud crud;

  OfferData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.offers, {});
    print("Response from server: $response"); // Debug
    return response.fold((l) => l, (r) => r);
  }
}
