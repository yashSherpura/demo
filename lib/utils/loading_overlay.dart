
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'color_utils.dart';

Widget loadingOverlay(){

  return Container(
    child: Stack(
      children: [
        new Opacity(
          opacity: 0.1,
          child: ModalBarrier(dismissible: false, color: Colors.white),
        ),
        new Center(
            child: Container(
              height: 56.h,
              width: 56.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
              ),
            )
        ),
        new Center(
          child: new CircularProgressIndicator(strokeWidth: 3.r,valueColor: new AlwaysStoppedAnimation<Color>(primaryColor),),
        ),
      ],
    ),
  );
}
