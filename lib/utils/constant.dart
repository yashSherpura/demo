import 'package:device_info_plus/device_info_plus.dart';

const String AUTH_CODE = 'AUTH_CODE';

const UserThemeData = 'UserThemeData';

// Firebase Token
const String FIREBASE_TOKEN = 'FIREBASE_TOKEN';


/*PAGE ROUTER*/
const ROUTE_OTPVERIFY = "/otp";
const ROUTE_LOGIN = "/login";
const ROUTE_SIGNUP = "/signup";
const ROUTE_DASHBOARD = "/dashboard";
const ROUTE_USER_SCREEN = "/userscreen";
const ROUTE_BEAUTICIAN = "/beautician";
const ROUTE_NEAR_BY_BEAUTICIAN = "/nearByBeautician";
const ROUTE_HOME_ADDRESS = "/homeAddress";
const ROUTE_ORDER_SUMMARY = "/orderSummary";
const ROUTE_BOOKING_CONFIRMED = "/bookingConfirmed";

//
// Map<String, dynamic> readAndroidBuildData(AndroidDeviceInfo build) {
//   return <String, dynamic>{
//     "ent_first_name" : "",
//     "ent_mobile" : "9512681119",
//     "ent_country_code" : "+91",
//     "ent_latitude" : "16.705976",
//     "ent_longitude" : "81.108055",
//     "ent_dev_id" : build.id,
//     "ent_push_token" : "eyv659aoQsyJ1SBfqPXemh:APA91bGDkRVeSKVRcBfEOVaXr1GEvf8JWWlHDY4I6lxo-Y_nBEVrpmq5rZ0GQMlNZezjrQZgS1xacF37CP1gte3H6Gf3BtQiStoOIZwqu3xjAye3MmAQHDmvSodq4Pp1oX5nmHcRhOv9",
//     "ent_device_type" : "2",
//     "ent_date_time" : "2021-03-31 15:29:29",
//     "ent_login_type" : "1",
//     "ent_dev_model" : "Redmi Note 9 Pro Max",
//     "ent_dev_os" : "10",
//     "ent_app_version" : "1.42",
//     "ent_manf" : "Xiaomi",
//     "" : "",
//     "ent_city" : "Eluru"
//     // "token": "eyv659aoQsyJ1SBfqPXemh:APA91bGDkRVeSKVRcBfEOVaXr1GEvf8JWWlHDY4I6lxo-Y_nBEVrpmq5rZ0GQMlNZezjrQZgS1xacF37CP1gte3H6Gf3BtQiStoOIZwqu3xjAye3MmAQHDmvSodq4Pp1oX5nmHcRhOv9",
//     // "deviceType": "ANDROID",
//     // "release": "${build.version.release}",
//     // "version": "${build.version.sdkInt}",
//     // "id": "${build.id}",
//     // "brand": "${build.brand}",
//     // "model": "${build.model}",
//     // "board": "${build.board}",
//     // "lang": "",
//   };
// }
//
// Map<String, dynamic> readIosDeviceInfo(IosDeviceInfo data) {
//   return <String, dynamic>{
//     "ent_first_name" : "",
//     "ent_mobile" : "9512681119",
//     "ent_country_code" : "+91",
//     "ent_latitude" : "16.705976",
//     "ent_longitude" : "81.108055",
//     "ent_dev_id" : "16a6d278d47abc4a",
//     "ent_push_token" : "eyv659aoQsyJ1SBfqPXemh:APA91bGDkRVeSKVRcBfEOVaXr1GEvf8JWWlHDY4I6lxo-Y_nBEVrpmq5rZ0GQMlNZezjrQZgS1xacF37CP1gte3H6Gf3BtQiStoOIZwqu3xjAye3MmAQHDmvSodq4Pp1oX5nmHcRhOv9",
//     "ent_device_type" : "2",
//     "ent_date_time" : "2021-03-31 15:29:29",
//     "ent_login_type" : "1",
//     "ent_dev_model" : "Redmi Note 9 Pro Max",
//     "ent_dev_os" : "10",
//     "ent_app_version" : "1.42",
//     "ent_manf" : "Xiaomi",
//     "ent_language" : "",
//     "ent_city" : "Eluru"
//     // "token": "eyv659aoQsyJ1SBfqPXemh:APA91bGDkRVeSKVRcBfEOVaXr1GEvf8JWWlHDY4I6lxo-Y_nBEVrpmq5rZ0GQMlNZezjrQZgS1xacF37CP1gte3H6Gf3BtQiStoOIZwqu3xjAye3MmAQHDmvSodq4Pp1oX5nmHcRhOv9",
//     // "deviceType": "IOS",
//     // "release": "${data.utsname.release}",
//     // "version": "${data.systemVersion}",
//     // "id": "${data.identifierForVendor}",
//     // "brand": "${data.model}",
//     // "model": "${data.name}",
//     // "board": "${data.systemName}",
//     // "lang": "",
//   };
// }
