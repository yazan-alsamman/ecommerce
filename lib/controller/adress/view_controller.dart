import 'package:get/get.dart';
import 'package:tataboq_app/core/class/statusrequest.dart';
import 'package:tataboq_app/core/functions/handlingdata_controller.dart';
import 'package:tataboq_app/core/services/services.dart';
import 'package:tataboq_app/data/datasource/remote/adress_data.dart';
import 'package:tataboq_app/data/model/adressmodel.dart';

class AdressViewController extends GetxController {
  AdressData adressData = AdressData(Get.find());

  List<AddressModel> data = [];

  late StatusRequest statusRequest;
  Myservices myservices = Get.find();
  deleteAdress(String adressid) {
    adressData.deleteData(adressid);
    data.removeWhere((element) => element.adressId.toString() == adressid);
    update();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    var response =
        await adressData.getData(myservices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => AddressModel.fromJson(e)));
        if (data.isEmpty) {
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
