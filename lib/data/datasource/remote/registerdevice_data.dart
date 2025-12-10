import 'package:tataboq_app/core/class/crud.dart';
import 'package:tataboq_app/linkapi.dart';

class RegisterDeviceData {
  Crud crud;

  RegisterDeviceData(this.crud);

  addDevice(
    String ip,
  ) async {
    var response = await crud.postData(AppLink.saveDevice, {
      "ip": ip.toString(),
    });

    return response.fold((l) => l, (r) => r);
  }
}
