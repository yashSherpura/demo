// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
//
// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:nearme/controller/login_controller.dart';
// import 'package:nearme/provider/api_provider.dart';
// import 'package:nearme/utils/color_utils.dart';
// import 'package:nearme/utils/constant.dart';
// import 'package:nearme/widgets/snackbar_message.dart';
//
// class OtpController extends GetxController {
//   static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
//   Map<String, dynamic>? deviceData;
//
//   late TextEditingController firstTextController,
//       secondTextController,
//       thirdTextController,
//       fouthTextController;
//   var first = false.obs;
//   var last = false.obs;
//   var check = false.obs;
//   var otpCode = "";
//   final loginController = Get.put(LoginController());
//   var isLoading = false.obs;
//   bool isValid = false;
//   String response = '';
//   String type = '';
//   String alreadyVerify = '';
//   String errorSignupMassage = '';
//   String errorLoginMassage = '';
//
//
//   @override
//   void onInit() {
//     firstTextController = TextEditingController();
//     secondTextController = TextEditingController();
//     thirdTextController = TextEditingController();
//     fouthTextController = TextEditingController();
//     super.onInit();
//     //deviceInformation();
//     getAddress();
//   }
//
//   String address = "";
//   String id = "";
//   String model = "" ;
//   String deviceOS  ="";
//   String appVersion = "";
//   String manufacture = "";
//   String formatTimeOfDay() {
//     final now = DateTime.now();
//     String formattedDate = DateFormat('yyyy-MM-dd  kk:mm:ss').format(now);
//     //String dt = DateTime(now.year, now.month, now.day, now.hour, now.minute, now.second) as String;
//     //final format = DateFormat.jm();  //"6:00 AM"
//     return formattedDate;
//   }
//
//
//
//   @override
//   void onClose() {
//     firstTextController.text = '';
//     secondTextController.text = '';
//     thirdTextController.text = '';
//     fouthTextController.text = '';
//     firstTextController.clear();
//     secondTextController.clear();
//     thirdTextController.clear();
//     fouthTextController.clear();
//     firstTextController.dispose();
//     secondTextController.dispose();
//     thirdTextController.dispose();
//     fouthTextController.dispose();
//     super.onClose();
//   }
//   @override
//   void dispose() {
//     firstTextController.text = '';
//     secondTextController.text = '';
//     thirdTextController.text = '';
//     fouthTextController.text = '';
//     firstTextController.clear();
//     secondTextController.clear();
//     thirdTextController.clear();
//     fouthTextController.clear();
//     firstTextController.dispose();
//     secondTextController.dispose();
//     thirdTextController.dispose();
//     fouthTextController.dispose();
//     super.dispose();
//   }
//
//   // void verifyCode() {
//   //   if (firstTextController.text != null && firstTextController.text == '' &&
//   //       secondTextController.text != null && secondTextController.text == '' &&
//   //       thirdTextController.text != null && thirdTextController.text == '' &&
//   //       fouthTextController.text != null && fouthTextController.text == '') {
//   //     snakbarMsg(
//   //         icon: Icons.dangerous,
//   //         title: 'OTP Verification',
//   //         msg: 'Enter Your OTP',
//   //         colors: Colors.white,
//   //         bgColor: Colors.redAccent);
//   //   } else {
//   //     OTPVerification();
//   //   }
//   // }
//
//   deviceInformation(){
//     if(Platform.isIOS) {
//       deviceInfoPlugin.iosInfo.then((data) {
//         print(data.identifierForVendor);
//         id = data.identifierForVendor!;
//
//         print(data.model);
//         model = data.model!;
//
//         print(data.systemName);
//         deviceOS = data.systemName!;
//
//         print(data.systemVersion);
//         appVersion = data.systemVersion!;
//
//         print(data.localizedModel);
//         manufacture = data.localizedModel!;
//         // print(data.id);
//       });
//     }else if(Platform.isAndroid){
//       deviceInfoPlugin.androidInfo.then((data) {
//         print("ID:- ${data.androidId}");
//         id = data.androidId!;
//
//         print("MODEL:- ${data.model}");
//         model = data.model!;
//
//         print("DeviceOS:- ${data.version.release}");
//         deviceOS = data.version.release!;
//
//         print("Version:- ${data.version.sdkInt}");
//         appVersion = data.version.sdkInt.toString();
//
//         print("Manufacturer:- ${data.manufacturer}");
//         manufacture = data.manufacturer!;
//         // print(data.id);
//       });
//     }
//   }
//
//
//   Future<void> getAddress() async {
//     List<Placemark> placemarks = await placemarkFromCoordinates(loginController.latitute, loginController.longitute);
//     //print(placemarks);
//     //print(placemarks.toString());
//     Placemark place = placemarks[0];
//
//     //  street = place.street;
//     //  country = '${place.locality}, ${place.subAdministrativeArea}, ${place.country}, ${place.postalCode}';
//     String houseAddress ='${place.name},${place.street}';
//     address ='${place.locality}';
//     print('house :- $houseAddress');
//     print('add :- $address');
//   }
//
//   void otpVerification(){
//     Map<String, dynamic> input ={
//       "ent_mobile": "+91${loginController.mobileNumberController!.text.toString()}",
//       "ent_code":firstTextController.text +  secondTextController.text + thirdTextController.text + fouthTextController.text,
//       "ent_language": "1",
//       "ent_register": "0",
//       "ent_user_type": "2",
//       "ent_status": "1"
//     };
//     // Get.dialog(loadingOverlay());
//     isLoading.value = true;
//     print("Called");
//     print("OTP :- ${firstTextController.text +  secondTextController.text + thirdTextController.text + fouthTextController.text}");
//     APIProvider().OTPVerifyAPI(
//       params: input,
//       onSuccess: (data) {
//         print("OTPVerification Response : ${data.errorCode}");
//         print("OTPVerification Message : ${data.error}");
//
//        isValid = true;
//        response = data.error.toString();
//        print("response :- $response");
//         Map valueMap = json.decode(data.error.toString());
//         valueMap.forEach((key, value) {
//           if(key=="message"){
//             response = value;
//             alreadyVerify = value;
//           }else if(key=="type"){
//             type = value;
//           }
//         });
//         print("check 111");
//         if(type=="error"){
//           snakbarMsg(
//               icon: Icons.dangerous,
//               title: 'OTP Verify'.tr,
//               msg: "OTP Invalid",
//               colors: Colors.white,
//               bgColor: Colors.redAccent);
//         }else if(type=="success") {
//           slaveSignupNewAPI();
//           Get.toNamed(ROUTE_DASHBOARD);
//           // snakbarMsg(
//           //     icon: Icons.done,
//           //     title: 'OTP Verify'.tr,
//           //     msg: "OTP Verify Successfully",
//           //     colors: Colors.white,
//           //     bgColor: green);
//         }
//
//         // if(response == "otp_verified"){
//         //   slaveSignupNewAPI();
//         // }else{
//         //   snakbarMsg(
//         //       icon: Icons.dangerous,
//         //       title: 'OTP Verify'.tr,
//         //       msg: "OTP Invalid",
//         //       colors: Colors.white,
//         //       bgColor: Colors.redAccent);
//         // }
//
//
//
//         // if(alreadyVerify=="already_verified"){
//         //   slaveLoginNewAPI();
//         //
//         // }
//         isLoading.value = false;
//       },
//       onError: (error) {
//         print(error);
//       },
//     );
//     Timer.periodic(Duration(seconds: 2), (timer) {
//       isLoading.value = false;
//       timer.cancel();
//
//     });
//     update();
//   }
//
//   void slaveSignupNewAPI(){
//     Map<String, dynamic> input ={
//       "ent_first_name" : ".",
//       "ent_mobile" : loginController.mobileNumberController!.text,
//       "ent_country_code" : "+91",
//       "ent_latitude" : loginController.latitute,
//       "ent_longitude" : loginController.longitute,
//       "ent_dev_id" : id,
//       "ent_push_token" : "eyv659aoQsyJ1SBfqPXemh:APA91bGDkRVeSKVRcBfEOVaXr1GEvf8JWWlHDY4I6lxo-Y_nBEVrpmq5rZ0GQMlNZezjrQZgS1xacF37CP1gte3H6Gf3BtQiStoOIZwqu3xjAye3MmAQHDmvSodq4Pp1oX5nmHcRhOv9",
//       "ent_device_type" : "2",
//       "ent_date_time" : formatTimeOfDay(),
//       "ent_login_type" : "1",
//       "ent_dev_model" : model,
//       "ent_dev_os" : deviceOS,
//       "ent_app_version" : appVersion,
//       "ent_manf" : manufacture,
//       "" : "",
//       "ent_city" : address
//     };
//     isLoading.value = true;
//     print("Called");
//     APIProvider().slaveSignupNewAPI(
//       params: input,
//       onSuccess: (data) {
//         print("Response Sleve : ${data.errMsg}");
//         print("Response Phone Sleve : ${data.phone}");
//         errorSignupMassage = data.errMsg!;
//         print("check 222");
//         print("errorMassage :- $errorSignupMassage");
//
//         if(errorSignupMassage == "Mobile number is already registered, choose another"){
//           print("massage:-");
//           slaveLoginNewAPI();
//           update();
//         }
//         //else if(errorLoginMassage == )
//
//         isLoading.value = false;
//
//       },
//       onError: (error) {
//         print(error);
//       },
//     );
//     update();
//   }
//
//   void slaveLoginNewAPI(){
//     Map<String, dynamic> input ={
//       "ent_mobile":loginController.mobileNumberController!.text,
//       "ent_dev_id": id,
//       "ent_push_token": "eyv659aoQsyJ1SBfqPXemh:APA91bGDkRVeSKVRcBfEOVaXr1GEvf8JWWlHDY4I6lxo-Y_nBEVrpmq5rZ0GQMlNZezjrQZgS1xacF37CP1gte3H6Gf3BtQiStoOIZwqu3xjAye3MmAQHDmvSodq4Pp1oX5nmHcRhOv9",
//       "ent_latitude": loginController.latitute,
//       "ent_longitude": loginController.longitute,
//       "ent_date_time": formatTimeOfDay(),
//       "ent_device_type": "2",
//       "ent_login_type": "1",
//       "ent_dev_model": model,
//       "ent_dev_os": deviceOS,
//       "ent_app_version": appVersion,
//       "ent_manf": manufacture,
//       "ent_language": ""
//     };
//     isLoading.value = true;
//     print("Called");
//     APIProvider().slaveLoginNewAPI(
//       params: input,
//       onSuccess: (data) {
//         print("Response SleveLogin : ${data.errMsg}");
//         print("Response Phone Sleve : ${data.phone}");
//         errorLoginMassage = data.errMsg!;
//         isLoading.value = false;
//         snakbarMsg(
//             icon: Icons.done,
//             title: 'OTP Verify'.tr,
//             msg: data.errMsg,
//             colors: Colors.white,
//             bgColor: green);
//       },
//       onError: (error) {
//         print(error);
//       },
//     );
//     update();
//   }
//
//   getPlatformState() async {
//     deviceData = <String, dynamic>{};
//     try {
//       if (Platform.isAndroid) {
//         print("getPlatformState for android");
//         deviceData =
//         await readAndroidBuildData(await deviceInfoPlugin.androidInfo);
//       } else if (Platform.isIOS) {
//         print("getPlatformState for IOS");
//         deviceData = await readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
//       }else{
//         print("getPlatformState not recognize");
//       }
//     } on PlatformException {
//       deviceData = <String, dynamic>{
//         'Error:': 'Failed to get platform version.'
//       };
//     }
//   }
//
// }

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nearme/controller/login_controller.dart';
import 'package:nearme/provider/api_provider.dart';
import 'package:nearme/utils/color_utils.dart';
import 'package:nearme/utils/constant.dart';
import 'package:nearme/utils/pref_manager.dart';
import 'package:nearme/widgets/snackbar_message.dart';

class OtpController extends GetxController {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  final loginController = Get.put(LoginController());
  Map<String, dynamic>? deviceData;
  late TextEditingController firstTextController,
      secondTextController,
      thirdTextController,
      fouthTextController;
  var first = false.obs;
  var last = false.obs;
  var check = false.obs;
  var otpCode = "";
  var isLoading = false.obs;
  bool isValid = false;
  String response = '';
  String type = '';
  String alreadyVerify = '';
  String errorSignupMassage = '';
  String errorLoginMassage = '';


  String address = "";
  String id = "";
  String model = "" ;
  String deviceOS  ="";
  String appVersion = "";
  String manufacture = "";

  var sessionToken;
  var userID;


  @override
  void onInit() {
    firstTextController = TextEditingController();
    secondTextController = TextEditingController();
    thirdTextController = TextEditingController();
    fouthTextController = TextEditingController();
    super.onInit();
    getFirebaseToken();
    deviceInformation();
    getAddress();
  }

  String formatTimeOfDay() {
    final now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd  kk:mm:ss').format(now);
    //String dt = DateTime(now.year, now.month, now.day, now.hour, now.minute, now.second) as String;
    //final format = DateFormat.jm();  //"6:00 AM"
    return formattedDate;
  }



  @override
  void onClose() {
    firstTextController.text = '';
    secondTextController.text = '';
    thirdTextController.text = '';
    fouthTextController.text = '';
    firstTextController.clear();
    secondTextController.clear();
    thirdTextController.clear();
    fouthTextController.clear();
    firstTextController.dispose();
    secondTextController.dispose();
    thirdTextController.dispose();
    fouthTextController.dispose();
    super.onClose();
  }
  @override
  void dispose() {
    firstTextController.text = '';
    secondTextController.text = '';
    thirdTextController.text = '';
    fouthTextController.text = '';
    firstTextController.clear();
    secondTextController.clear();
    thirdTextController.clear();
    fouthTextController.clear();
    firstTextController.dispose();
    secondTextController.dispose();
    thirdTextController.dispose();
    fouthTextController.dispose();
    super.dispose();
  }


  deviceInformation(){
    if(Platform.isIOS) {
      deviceInfoPlugin.iosInfo.then((data) {
        print(data.identifierForVendor);
        id = data.identifierForVendor!;

        print(data.model);
        model = data.model!;

        print(data.systemName);
        deviceOS = data.systemName!;

        print(data.systemVersion);
        appVersion = data.systemVersion!;

        print(data.localizedModel);
        manufacture = data.localizedModel!;
        // print(data.id);
      });
    }else if(Platform.isAndroid){
      deviceInfoPlugin.androidInfo.then((data) {
        print("ID:- ${data.androidId}");
        id = data.androidId!;

        print("MODEL:- ${data.model}");
        model = data.model!;

        print("DeviceOS:- ${data.version.release}");
        deviceOS = data.version.release!;

        print("Version:- ${data.version.sdkInt}");
        appVersion = data.version.sdkInt.toString();

        print("Manufacturer:- ${data.manufacturer}");
        manufacture = data.manufacturer!;
      });
    }
  }


  Future<void> getAddress() async {
    List<Placemark> placemarks = await placemarkFromCoordinates(loginController.latitute, loginController.longitute);
    Placemark place = placemarks[0];

    //  street = place.street;
    //  country = '${place.locality}, ${place.subAdministrativeArea}, ${place.country}, ${place.postalCode}';
    String houseAddress ='${place.name},${place.street}';
    address ='${place.locality}';
    print('house :- $houseAddress');
    print('add :- $address');
  }

  String ? fcmToken = "";
  Future getFirebaseToken() async {
    fcmToken = await FirebaseMessaging.instance.getToken();
    PreferenceUtils.setString(FIREBASE_TOKEN, fcmToken!);
    print("TOKEN ID :- $fcmToken");
  }




  // VerifyCall API.
  // This API used to very Mobile number OTP.
  void otpVerification(){
    Map<String, dynamic> input ={
      "ent_mobile": "+91${loginController.mobileNumberController!.text.toString()}",
      "ent_code":firstTextController.text +  secondTextController.text + thirdTextController.text + fouthTextController.text,
      "ent_language": "1",
      "ent_register": "0",
      "ent_user_type": "2",
      "ent_status": "1"
    };
    // Get.dialog(loadingOverlay());
    isLoading.value = true;
    print("Called");
    print("OTP :- ${firstTextController.text +  secondTextController.text + thirdTextController.text + fouthTextController.text}");
    APIProvider().OTPVerifyAPI(
      params: input,
      onSuccess: (data) {
        print("OTPVerification Response : ${data.errorCode}");
        print("OTPVerification Message : ${data.error}");

        isValid = true;
        response = data.error.toString();
        print("response :- $response");
        Map valueMap = json.decode(data.error.toString());
        valueMap.forEach((key, value) {
          if(key=="message"){
            response = value;
            alreadyVerify = value;
          }else if(key=="type"){
            type = value;
          }
        });
        print("check 111");
        if(type=="error"){
          snakbarMsg(
              icon: Icons.dangerous,
              title: 'OTP Verify'.tr,
              msg: "OTP Invalid",
              colors: Colors.white,
              bgColor: Colors.redAccent);
        }else if(type=="success") {
          slaveSignupNewAPI();
        }

        isLoading.value = false;
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




  // SlaveSignupNew API.
  // New User SignUp the app then this API called.
  void slaveSignupNewAPI(){
    Map<String, dynamic> input ={
      "ent_first_name" : ".",
      "ent_mobile" : loginController.mobileNumberController!.text,
      "ent_country_code" : "+91",
      "ent_latitude" : loginController.latitute,
      "ent_longitude" : loginController.longitute,
      "ent_dev_id" : id,
      "ent_push_token" : PreferenceUtils.getString(FIREBASE_TOKEN),//"eyv659aoQsyJ1SBfqPXemh:APA91bGDkRVeSKVRcBfEOVaXr1GEvf8JWWlHDY4I6lxo-Y_nBEVrpmq5rZ0GQMlNZezjrQZgS1xacF37CP1gte3H6Gf3BtQiStoOIZwqu3xjAye3MmAQHDmvSodq4Pp1oX5nmHcRhOv9",
      "ent_device_type" : "2",
      "ent_date_time" : formatTimeOfDay(),
      "ent_login_type" : "1",
      "ent_dev_model" : model,
      "ent_dev_os" : deviceOS,
      "ent_app_version" : appVersion,
      "ent_manf" : manufacture,
      "" : "",
      "ent_city" : address
    };
    isLoading.value = true;
    print("Called");
    APIProvider().slaveSignupNewAPI(
      params: input,
      onSuccess: (data) {
        print("Response Sleve : ${data.errMsg}");
        print("Response Phone Sleve : ${data.phone}");
        errorSignupMassage = data.errMsg!;
        print("check 222");
        print("errorMassage :- $errorSignupMassage");
        if(errorSignupMassage == "Mobile number is already registered, choose another"){
          slaveLoginNewAPI();
        }else{
          PreferenceUtils.setString("isLogin", "1");
          //PreferenceUtils.setString(FIREBASE_TOKEN, fcmToken!);
          print("setString slaveLoginNewAPI :- ${PreferenceUtils.getString("isLogin")}");
          PreferenceUtils.setString("userID", data.sid.toString());
          PreferenceUtils.setString("sessionToken", data.token.toString());
          print("setString slaveLoginNewAPI :- ${PreferenceUtils.getString("sessionToken")}");
          Get.offAllNamed(ROUTE_DASHBOARD);
          snakbarMsg(
              icon: Icons.done,
              title: 'OTP Verify'.tr,
              msg: errorSignupMassage,
              colors: Colors.white,
              bgColor: green);
        }
        isLoading.value = false;
      },
      onError: (error) {
        print(error);
      },
    );
    update();
  }


  // SlaveLoginNew API.
  // User Mobile number is already registered then this API called.
  void slaveLoginNewAPI(){
    Map<String, dynamic> input ={
      "ent_mobile":loginController.mobileNumberController!.text,
      "ent_dev_id": id,
      "ent_push_token":  PreferenceUtils.getString(FIREBASE_TOKEN),//"eyv659aoQsyJ1SBfqPXemh:APA91bGDkRVeSKVRcBfEOVaXr1GEvf8JWWlHDY4I6lxo-Y_nBEVrpmq5rZ0GQMlNZezjrQZgS1xacF37CP1gte3H6Gf3BtQiStoOIZwqu3xjAye3MmAQHDmvSodq4Pp1oX5nmHcRhOv9",
      "ent_latitude": loginController.latitute,
      "ent_longitude": loginController.longitute,
      "ent_date_time": formatTimeOfDay(),
      "ent_device_type": "2",
      "ent_login_type": "1",
      "ent_dev_model": model,
      "ent_dev_os": deviceOS,
      "ent_app_version": appVersion,
      "ent_manf": manufacture,
      "ent_language": ""
    };
    isLoading.value = true;
    print("Called");
    APIProvider().slaveLoginNewAPI(
      params: input,
      onSuccess: (data) {
        print("Response slaveLoginNewAPI Sleve : ${data.errMsg}");
        print("Response Phone Sleve : ${data.phone}");
        errorLoginMassage = data.errMsg!;
        sessionToken = data.token;
        userID = data.sid;
        print("Token--------- : $sessionToken");
        print("USERID--------- : $userID");

        PreferenceUtils.setString("isLogin", "1");
        print("setString slaveLoginNewAPI :- ${PreferenceUtils.getString("isLogin", )}");
        PreferenceUtils.setString("userID", data.sid.toString());
        PreferenceUtils.setString("sessionToken", data.token.toString());
        print("setString slaveLoginNewAPI :- ${PreferenceUtils.getString("sessionToken")}");

        Get.offAllNamed(ROUTE_DASHBOARD);
        snakbarMsg(
            icon: Icons.done,
            title: 'OTP Verify'.tr,
            msg: data.errMsg,
            colors: Colors.white,
            bgColor: green);
        isLoading.value = false;
      },
      onError: (error) {
        print(error);
      },
    );
    update();
  }
}