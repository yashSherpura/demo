
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nearme/utils/screen_size.dart';

SnackBar? snakbarMsg({IconData? icon,var title, var msg, Color? bgColor, Color? colors}) {
  Get.snackbar(
    title, // title
   msg, // message
    icon: Icon(icon,color: colors,size: size28,),
    shouldIconPulse: false,
    barBlur: 50,
    isDismissible: true,
    duration: const Duration(seconds: 3),
    padding:const EdgeInsets.all(size10),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: bgColor,
    borderRadius: size10,
    titleText: Text(title,style: TextStyle(color: colors,fontSize: size16,fontWeight: FontWeight.bold),),
    messageText: Text(msg,style: TextStyle(color: colors),),
    dismissDirection: SnackDismissDirection.HORIZONTAL,
    forwardAnimationCurve: Curves.easeOutBack,

  );
}




SnackBar? snakbarNotificationMsg({var title, var msg, Color? bgColor, Color? titleColors,Color? messageColor}) {
  Get.snackbar(
    title, // title
    msg, // message
    icon: Image.asset('assets/images/ic_launcher.png',),
    shouldIconPulse: false,
    barBlur: 50,
    isDismissible: true,
    duration: Duration(seconds: 3),
    padding:EdgeInsets.all(20),
    snackPosition: SnackPosition.TOP,
    backgroundColor: bgColor,
    borderRadius: 10,
    titleText: Text(title,style: TextStyle(color: titleColors,fontSize: 16,fontWeight: FontWeight.bold),),
    messageText: Text(msg,style: TextStyle(color: messageColor),),

  );
}