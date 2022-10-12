import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:nearme/controller/login_controller.dart';
import 'package:nearme/controller/otp_controller.dart';
import 'package:nearme/provider/api_provider.dart';
import 'package:nearme/model/get_city_list_model.dart';
import 'package:nearme/utils/loading_overlay.dart';

class GetCityListController extends GetxController {

  final loginController = Get.put(LoginController());
  final otpController = Get.put(OtpController());

  var isLoading = false.obs;

  var city = List<Cities>.empty(growable: true).obs;
  var citiesName = [];
  var dropDownValue;
  var address = "".obs;

  @override
  void onInit() {
    getAddress();
    super.onInit();
    update();
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
    //  street = place.street;
    //  country = '${place.locality}, ${place.subAdministrativeArea}, ${place.country}, ${place.postalCode}';
    String houseAddress ='${place.name},${place.street}';
    address.value ='${place.locality}';
    print('house :- $houseAddress');
    print('address :- ${address.value}');
    getCityListApiData(address.value);
  }


  // GetCityList API.
  // This API used select the city & called in Dropdown Button in Home Screen.
  void getCityListApiData(String city) {
    Map<String, dynamic> input = {
      "city": city,
      "lt": loginController.latitute,
      "lg": loginController.longitute,
    };
     //Get.dialog(loadingOverlay());
    isLoading.value = true;
    print("Called");
    APIProvider().getCityListAPI(
      params: input,
      onSuccess: (data) {
        print(" Message : ${data.message}");
        print("*******");

        print("cities :- ${data.cities!.length}");
        data.cities!.forEach((data) {
          citiesName.add(data.cityName);
          print("city name :- ${data.cityName}");
        });
        isLoading.value = false;
        // isValid = true;
         //Get.back();
        },
      onError: (error) {
        print(error);
      },
    );
    update();
  }
}