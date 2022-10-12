import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:nearme/binding/beautician_binding.dart';
import 'package:nearme/binding/dashboard_binding.dart';
import 'package:nearme/binding/home_address_binding.dart';
import 'package:nearme/binding/login_binding.dart';
import 'package:nearme/binding/near_by_beautician_binding.dart';
import 'package:nearme/binding/order_summary_binding.dart';
import 'package:nearme/binding/otp_verify_binding.dart';
import 'package:nearme/binding/user_screen_binding.dart';
import 'package:nearme/utils/constant.dart';
import 'package:nearme/view/dashboard/beautician.dart';
import 'package:nearme/view/dashboard/dashboard.dart';
import 'package:nearme/view/dashboard/near_by_beauticians.dart';
import 'package:nearme/view/dashboard/user_screen.dart';
import 'package:nearme/view/login/login.dart';
import 'package:nearme/view/login/otp.dart';
import 'package:nearme/view/profile/comfirmed.dart';
import 'package:nearme/view/profile/home_address.dart';
import 'package:nearme/view/profile/order_summary.dart';


class AppPages {
  static final List<GetPage> pages = [
    GetPage(name: ROUTE_OTPVERIFY, page: () => const OtpScreen(),binding: OTPVerifyPageBinding()),
    GetPage(name: ROUTE_LOGIN, page: () => const LoginScreen(),binding: LoginBinding()),
    GetPage(name: ROUTE_DASHBOARD, page: () =>  const Dashboard(),binding: DashboardBinding()),
    GetPage(name: ROUTE_USER_SCREEN, page: () => const UserScreen(),binding: UserScreenBinding()),
    GetPage(name: ROUTE_BEAUTICIAN, page: () =>  const Beautician(),binding: BeauticianBinding()),
    GetPage(name: ROUTE_NEAR_BY_BEAUTICIAN, page: () =>  const NearByBeauticians(),binding: NearByBeauticianBinding()),
    GetPage(name: ROUTE_HOME_ADDRESS, page: () =>   HomeAddress(),binding: HomeAddressBinding()),
    GetPage(name: ROUTE_ORDER_SUMMARY, page: () =>   OrderSummary(),binding: OrderSummaryBinding()),
    GetPage(name: ROUTE_BOOKING_CONFIRMED, page: () =>  const BookingConfirmed()),
  ];
}