import 'dart:async';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:location/location.dart';
import 'package:nearme/model/get_slave_offline_booking_leads_model.dart';
import 'package:nearme/provider/api_provider.dart';
import 'package:nearme/utils/pref_manager.dart';

class GetSlaveOfflineBookingLeadsController extends GetxController {

  var isLoading = false.obs;
  bool isValid = false;
  //var userID;

  Location location = new Location();

  var upComingEnquiryDataList = List<Data>.empty(growable: true).obs;

  getFromDate() {
    return DateFormat('dd-MM-yyyy').format(DateTime.now());
  }
  getToDate() {
    return Jiffy().add(months: 6).format("dd-MM-yyyy");
  }

  @override
  void onInit() {
    super.onInit();
    //userID = PreferenceUtils.getString("userID");
  }

  @override
  void onClose() {
    super.onClose();
  }
  @override
  void dispose() {
    super.dispose();
  }


  // GetSlaveOfflineBookingLeads API.
  // This api used Upcoming Enquiry in Home Screen.
  void getSlaveOfflineBookingLeadsApiData(){
    Map<String, dynamic> input ={
    "fromDate": getFromDate(), //"02-10-2021",
    "slaveID": PreferenceUtils.getString("userID"),
    "toDate":  getToDate(),//"27-10-2021",
    "rideStatus": "0"
    };
   // Get.dialog(loadingOverlay());
    //isLoading.value = true;
    print("Called");
    APIProvider().getSlaveOfflineBookingLeadsAPI(
      params: input,
      onSuccess: (data) {
        print(" getSlaveOfflineBookingLeadsApiData Response : ${data.status}");
        print("getSlaveOfflineBookingLeadsApiData Message : ${data.message}");
        isValid = true;
        Get.back();

        data.data!.forEach((element) {
          upComingEnquiryDataList.add(element);
        });
        print("upComingEnquiryDataList  : ${upComingEnquiryDataList.length}");
      },
      onError: (error) {
        print("getSlaveOfflineBookingLeadsApiData error :- $error");
      },
    );
    Timer.periodic(Duration(seconds: 2), (timer) {
      isLoading.value = false;
      timer.cancel();
    });
    update();
  }
}