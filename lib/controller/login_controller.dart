import 'dart:async';
import 'dart:convert';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:nearme/provider/api_provider.dart';
import 'package:nearme/utils/constant.dart';
import 'package:nearme/utils/loading_overlay.dart';
import 'package:nearme/utils/pref_manager.dart';

class LoginController extends GetxController {
  TextEditingController? mobileNumberController = TextEditingController();
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  Map<String, dynamic>? deviceData;
  var otpTextCode = "".obs;
  var isLoading = false.obs;
  bool active = false;
  bool isValid = false;

  Location location = new Location();
  bool? serviceEnabled;
  PermissionStatus? permissionGranted;
  LocationData? locationData;
  var latitute = 0.0;
  var longitute = 0.0;

  @override
  void onInit() {
    super.onInit();
    mobileNumberController = TextEditingController();

  }

  @override
  void onClose() {
    mobileNumberController!.clear();
    super.onClose();
  }
  @override
  void dispose() {
    mobileNumberController!.clear();
    super.dispose();
  }

  void checkLocationPermission() async {
    permissionGranted = await location.hasPermission();
    print("_permissionGranted $permissionGranted");
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        Get.defaultDialog(
          middleText: "",title: "",
          backgroundColor: Colors.white.withOpacity(0.9),
          content: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: const [
                Text("Allow \"Nearme\" to use your location?",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                SizedBox(height: 5,),
                Text("This app needs access to location when open.",textAlign: TextAlign.center,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                SizedBox(height: 5,),
              ],
            ),
          ),
          barrierDismissible: false,
          radius: 15,
          actions: [
            const Divider(height: 0,),
            CupertinoDialogAction(
              child: const Text("Don't Allow"),
              onPressed: (){
                Get.back();
              },
            ),
            const Divider(height: 0,),
            CupertinoDialogAction(
              child: const Text("Allow"),
              onPressed: (){
                Get.back();
                checkLocationPermission();
              },
            )
          ],
        );
        print("permission not granted");
        return;
      } else {
        print("permission grantedddddd");
      }
    }
    print("checkLocationPermission ::::");
    locationData = await location.getLocation();
    print("locationData ::::");
    print(locationData!.latitude);
    print(locationData!.longitude);

    latitute = locationData!.latitude!;
    longitute = locationData!.longitude!;

    print(latitute.runtimeType);
    print(latitute);

  }


// CheckMobile API.
  void getApiData(){
    Map<String, dynamic> input ={
      "ent_country_code": "91",
      "ent_mobile":mobileNumberController!.text,
      "ent_language": "1",
      "ent_user_type": "2",
      "ent_send_otp": "YES"
    };
     Get.dialog(loadingOverlay());
    //isLoading.value = true;
    print("Called");
    APIProvider().loginAPI(
      params: input,
      onSuccess: (data) {
        print(" Response : ${data.errMsg}");
        print(" Response : ${data.errorCode}");
        print(" Message : ${data.error}");
        print("OTP Verify : ${data.otp}");
        isValid = true;
        PreferenceUtils.setString("data",jsonEncode(data));
        //isLoading.value = false;
        Get.back();
        Get.toNamed(ROUTE_OTPVERIFY);
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