import 'package:tataboq_app/core/class/crud.dart';
import 'package:tataboq_app/linkapi.dart';

class OrderDetailsData {
  Crud crud;

  OrderDetailsData(this.crud);

  getData(String id) async {
    var response = await crud.postData(AppLink.ordersdetails, {"id": id});

    return response.fold((l) => l, (r) => r);
  }
}
