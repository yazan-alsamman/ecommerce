import 'package:tataboq_app/core/class/crud.dart';
import 'package:tataboq_app/linkapi.dart';

class AdressData {
  Crud crud;

  AdressData(this.crud);

  getData(String userid) async {
  var response = await crud.postData(AppLink.adressView, {
    "userid":userid,
  });
  print("Response from server: $response"); // Debug
  return response.fold((l) => l, (r) => r);
}
addData(String userid,String name,String city,String street,String lat,String long) async {
  var response = await crud.postData(AppLink.adressAdd, {
    "userid":userid,
    "name":name,
    "city":city,
    "street":street,
    "lat":lat,
    "long":long,});
  print("Response from server: $response"); // Debug
  return response.fold((l) => l, (r) => r);
}
deleteData(String adressid) async {
  var response = await crud.postData(AppLink.adressdelete, {"adressid":adressid});
  print("Response from server: $response"); // Debug
  return response.fold((l) => l, (r) => r);
}
}
