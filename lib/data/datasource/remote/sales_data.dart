import 'package:tataboq_app/core/class/crud.dart';
import 'package:tataboq_app/linkapi.dart';

class SalesData {
  Crud crud;

  SalesData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.itemsSales, {});

    return response.fold((l) => l, (r) => r);
  }
}
