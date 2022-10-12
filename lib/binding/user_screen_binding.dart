import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:nearme/controller/dashboard_controller.dart';
import 'package:nearme/controller/otp_controller.dart';
import 'package:nearme/controller/user_screen_controller.dart';

class UserScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserScreenController());
  }
}