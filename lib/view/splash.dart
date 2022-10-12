import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nearme/controller/login_controller.dart';
import 'package:nearme/utils/color_utils.dart';
import 'package:nearme/utils/constant.dart';
import 'package:nearme/utils/pref_manager.dart';
import 'package:nearme/utils/screen_size.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final loginController = Get.put(LoginController());

  startTime() async {
    var _duration =  const Duration(seconds: 2);
    return Timer(_duration, navigationPage);
  }

  navigationPage(){
    print("LoginSession :- ${PreferenceUtils.getString("isLogin")}");
    if(PreferenceUtils.getString("isLogin") != null && PreferenceUtils.getString("isLogin") != '')
      Get.offAllNamed(ROUTE_DASHBOARD);
    else
      Get.offAllNamed(ROUTE_LOGIN);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginController.checkLocationPermission();
    loginController.update();
    startTime();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: FittedBox(
              child: Container(
                height: 150,
                width: 150,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: white
                ),
                child:  Center(child: Text("NearMe",
                  textScaleFactor:  Get.textScaleFactor,
                  style: TextStyle(
                      fontSize: size30 / Get.textScaleFactor,
                      color: primaryColor,
                      fontFamily:"Poppins" ),textAlign: TextAlign.center,)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
