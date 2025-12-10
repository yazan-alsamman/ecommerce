import 'package:tataboq_app/core/class/crud.dart';
import 'package:tataboq_app/linkapi.dart';

class OrdersPendingData {
  Crud crud;

  OrdersPendingData(this.crud);

  getData(String userid) async {
    var response = await crud.postData(AppLink.pendingOrders, {"id": userid});
    print("Response from server: $response"); // Debug
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String orderid) async {
    var response = await crud.postData(AppLink.ordersdelete, {"id": orderid});

    return response.fold((l) => l, (r) => r);
  }
}
