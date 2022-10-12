import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:nearme/controller/dashboard_controller.dart';
import 'package:nearme/controller/home_address_controller.dart';
import 'package:nearme/controller/order_summary_controller.dart';
import 'package:nearme/controller/otp_controller.dart';

class OrderSummaryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderSummaryController());
  }
}