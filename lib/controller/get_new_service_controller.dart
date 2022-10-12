import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:nearme/controller/login_controller.dart';
import 'package:nearme/controller/otp_controller.dart';
import 'package:nearme/model/get_new_service_model.dart';
import 'package:nearme/provider/api_provider.dart';
import 'package:nearme/model/get_city_list_model.dart';

class GetNewServiceController extends GetxController {

   final loginController = Get.put(LoginController());

  var isLoading = false.obs;

  var newServiceList = List<GetNewServices>.empty(growable: true).obs;
  var serviceName ;
  var serviceImage;
  var dropDownValue;
   String address = "";

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

   // GetNewServices API.
   // This API used to display Explore Services Data in Home Screen.
  void getNewServicesApiData() {
    Map<String, dynamic> input = {
      "city": address,
    };
    newServiceList.clear();
    // Get.dialog(loadingOverlay());
    isLoading.value = true;
    print("Called");
    APIProvider().getNewServiceAPI(
      params: input,
      onSuccess: (data) {
        print(" Message : ${data.message}");
        print("*******");

        print("cities :- ${data.getNewServices!.length}");
        data.getNewServices!.forEach((data) {
          //city.add(data);
          // serviceName.add(data.serviceName);
          // serviceImage.add(data.serviceImage);
          // print("getNewServiceAPI name :- ${data.serviceName}");
          newServiceList.add(data);
        });
        print("cities :- ${newServiceList.length}");
        // isValid = true;
        // Get.back();
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