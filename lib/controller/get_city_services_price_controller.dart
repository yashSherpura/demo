import 'dart:async';
import 'package:collection/collection.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:nearme/controller/login_controller.dart';
import 'package:nearme/model/get_city_services_price_model.dart';
import 'package:nearme/provider/api_provider.dart';

class GetCityServicesPriceController extends GetxController {

  var isLoading = false.obs;
  String address ="";
  var loginController = Get.put(LoginController());
  var resultList = List<Result>.empty(growable: true).obs;
  var resultListLowerData;

  @override
  void onInit() {
    super.onInit();
    getAddress();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> getAddress() async {
    List<Placemark> placemarks = await placemarkFromCoordinates(loginController.latitute, loginController.longitute);
    Placemark place = placemarks[0];
    String houseAddress ='${place.name},${place.street}';
    address ='${place.locality}';
    print('house :- $houseAddress');
    print('address :- $address');
  }


  // GetCityServicesPrice API.
  // This API used to filter Top Service Data in Home Screen.
  void getCityServicesPriceApiData() {
    Map<String, dynamic> input = {
      "city": address
    };
    resultList.clear();
    // Get.dialog(loadingOverlay());
    isLoading.value = true;
    print("Called");
    APIProvider().getCityServicesPriceAPI(
      params: input,
      onSuccess: (data) {
        print(" Response status : ${data.status}");
        print(" Message : ${data.message}");
        print(" result length : ${data.result!.length}");
        print(" result name : ${data.result![1].serviceName}");
        // isValid = true;
        // Get.back();
        data.result!.forEach((element) {
          resultList.add(element);
        });

        resultList.sort((a, b)=> int.parse(a.price.toString()).compareTo(int.parse(b.price.toString())));
        print(" getCityServicesPriceApiData : ${resultList.length}");
        resultList.forEach((element) {
          print("Price : ${element.price}");
          resultListLowerData = resultList.where((c) => c.serviceType == element.serviceType).toList().length;
        });
        print("Count : $resultListLowerData");
      },
      onError: (error) {
        print(error);
      },
    );
    Timer.periodic(Duration(seconds: 2), (timer) {
      isLoading.value = false;
      timer.cancel();
    });
    update();
  }
}