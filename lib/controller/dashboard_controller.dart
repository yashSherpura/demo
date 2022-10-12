import 'dart:async';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:nearme/provider/api_provider.dart';
import 'package:nearme/utils/constant.dart';
import 'package:nearme/utils/pref_manager.dart';
import 'get_new_service_controller.dart';
import 'login_controller.dart';
import 'otp_controller.dart';

class DashboardController extends GetxController {
  var tabIndex = 0;
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  final otpController = Get.put(OtpController());
  final loginController = Get.put(LoginController());
  final newServiceController = Get.put(GetNewServiceController());

  Map<String, dynamic>? deviceData;

  var isLoading = false.obs;
  bool isValid = false;
  var sessionToken ;
  // var pushToken;
  // var userID;
  String id = "";

  @override
  void onInit() {
    super.onInit();
    checkSession();
    // sessionToken = PreferenceUtils.getString("sessionToken");
    // userID = PreferenceUtils.getString("userID");
    print("getString $sessionToken");
  }

  @override
  void onClose() {
    super.onClose();
  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  void checkSession(){
    deviceInformation();
    if(PreferenceUtils.getString("isLogin") == "1") {
      Timer.periodic(Duration(seconds: 2), (timer) {
        print("!!!!!!1");
        getApiData();
        newServiceController.getNewServicesApiData();
        timer.cancel();
      });

    }
  }

  deviceInformation(){
    if(Platform.isIOS) {
      deviceInfoPlugin.iosInfo.then((data) {
        print("ID -${data.identifierForVendor}");
        id = data.identifierForVendor!;
      });
    }else if(Platform.isAndroid){
      deviceInfoPlugin.androidInfo.then((data) {
        print("ID -${data.androidId}");
        id = data.androidId!;
      });
    }
  }


  // CheckSession API.
  // This API call to Session is Expired or Not.
  void getApiData(){
    Map<String, dynamic> input ={
      "ent_sess_token": PreferenceUtils.getString("sessionToken"),
      "ent_dev_id": id,
      "ent_user_type": 2,
      "ent_date_time": otpController.formatTimeOfDay(),
      "ent_push_token":  PreferenceUtils.getString(FIREBASE_TOKEN),//"eyv659aoQsyJ1SBfqPXemh:APA91bGDkRVeSKVRcBfEOVaXr1GEvf8JWWlHDY4I6lxo-Y_nBEVrpmq5rZ0GQMlNZezjrQZgS1xacF37CP1gte3H6Gf3BtQiStoOIZwqu3xjAye3MmAQHDmvSodq4Pp1oX5nmHcRhOv9",
      "ent_user_id": PreferenceUtils.getString("userID")
    };

    //Get.dialog(loadingOverlay());
    //isLoading.value = true;
    print("Called");
    APIProvider().checkSessionAPI(
      params: input,
      onSuccess: (data) {
        print(" Response : ${data.errMsg}");
        print(" Error Flag : ${data.errFlag}");
        print("Error number : ${data.errNum}");

        if(data.errFlag == "1"){
          print("session ");
          Get.offAllNamed(ROUTE_LOGIN);
        }else{
          print("session fail");
        }
        isValid = true;
        Get.back();
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