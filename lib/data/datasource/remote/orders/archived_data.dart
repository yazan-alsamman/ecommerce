import 'dart:ffi';

import 'package:tataboq_app/core/class/crud.dart';
import 'package:tataboq_app/linkapi.dart';

class OrdersArchivedData {
  Crud crud;

  OrdersArchivedData(this.crud);

  getData(String userid) async {
    var response = await crud.postData(AppLink.archivedOrders, {"id": userid});
    print("Response from server: $response"); // Debug
    return response.fold((l) => l, (r) => r);
  }

  rating(String orderid,String comment,String rating) async {
    var response = await crud.postData(AppLink.rating, {"id": orderid,"rating":rating,"comment":comment});
    print("Response from server: $response"); // Debug
    return response.fold((l) => l, (r) => r);
  }
}
