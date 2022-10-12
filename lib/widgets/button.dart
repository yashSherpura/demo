import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nearme/utils/color_utils.dart';
import 'package:nearme/utils/screen_size.dart';
import 'package:nearme/utils/text_utils.dart';

class ButtonField extends StatelessWidget {
  final String? text;
  final VoidCallback? press;
  final Color? color;
  const ButtonField({
    Key? key,
    this.text,
    this.press,
    this.color,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //Color? setColor =  PreferenceUtils.getBoolen(UserThemeData) == false ?  textColor : Colors.grey[400];
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            onPrimary: Colors.white,
            primary: color,
            minimumSize: const Size(size88, size36),
            padding: const EdgeInsets.symmetric(horizontal: size10, vertical: size10),
            shadowColor: primaryColor
        ),
        child: Container(
          width: size.width /1.6,
          margin: const EdgeInsets.symmetric(horizontal: size70),
          child:Align(alignment: Alignment.center,
            child: FittedBox(
              child: Text(
                text!,overflow: TextOverflow.ellipsis,
                textScaleFactor: Get.textScaleFactor,
                maxLines: 1,
                style: TextStyle(fontFamily: "Poppins",
                    fontWeight: TextUtils.mediumtTextWeight,
                    fontSize: TextUtils.commonTextSize / Get.textScaleFactor),
                //style: Theme.of(context).textTheme.button.,
              ),
            ),
          ),
        ),
        onPressed: press,
    );

  }
}