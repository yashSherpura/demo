import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nearme/controller/login_controller.dart';
import 'package:nearme/controller/otp_controller.dart';
import 'package:nearme/utils/color_utils.dart';
import 'package:nearme/utils/constant.dart';
import 'package:nearme/utils/image_url.dart';
import 'package:nearme/utils/screen_size.dart';
import 'package:nearme/utils/text_utils.dart';
import 'package:nearme/widgets/button.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final otpController = Get.put(OtpController());
  final loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: size30,right: size25,top: size16),
                child: Row(
                  children: [
                    InkWell(
                        onTap: (){
                          setState(() {
                            Get.back();
                          });
                        },
                        child: Image.asset(leftIcon,height: size24,width: size24,)),
                    const SizedBox(width: size8,),
                    Text("Enter Otp",
                      style: TextStyle(color: black,
                          fontSize: TextUtils.headerTextSize / Get.textScaleFactor,
                          fontWeight: TextUtils.normalTextWeight,
                          fontFamily: "Poppins"),),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: size32,right: size25,top: size75),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text("Enter otp",
                          style: TextStyle(
                              color: grey,
                              fontSize: TextUtils.commonTextSize / Get.textScaleFactor,
                              fontWeight: TextUtils.normalTextWeight,
                              fontFamily: "Poppins"),),
                    ),
                    const SizedBox(height: size13,),
                    GetBuilder<OtpController>(
                      builder: (controller) =>
                          Container(
                            child: Row(
                              children: [
                                Flexible(
                                    child: Container(
                                      height: size.height/size9 - size13,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(size8),
                                          color: Colors.white,
                                          boxShadow: [BoxShadow(
                                              offset: const Offset(0.0, 2.0),
                                              color: grey.withOpacity(0.3),
                                              blurRadius: size5,
                                              spreadRadius: 0.1
                                          )]
                                      ),
                                      margin: const EdgeInsets.all(size5),
                                      child: Align(
                                          alignment: Alignment.center,
                                          child: OtpEditText(
                                            textcontroller: controller.firstTextController,
                                            editable: true,
                                            onChanged: (value){
                                              if (value.length == 1 &&  !controller.last.value) {
                                                FocusScope.of(context).nextFocus();
                                              }

                                            },
                                          )
                                      ),
                                    )),
                                const SizedBox(width: size22,),
                                Flexible(
                                    child: Container(
                                      height: size.height/size9 - size13,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(size8),
                                        color: Colors.white,
                                          boxShadow: [BoxShadow(
                                              offset: const Offset(0.0, 2.0),
                                              color: grey.withOpacity(0.3),
                                              blurRadius: size5,
                                              spreadRadius: 0.1
                                          )]
                                      ),
                                      margin: const EdgeInsets.all(size5),
                                      child: Align(
                                          alignment: Alignment.center,
                                          child: OtpEditText(
                                            textcontroller: controller.secondTextController,
                                            onChanged: (value){
                                              if (value.length == 1 && !controller.last.value) {
                                                FocusScope.of(context).nextFocus();
                                              }
                                              if (value.length == 0 && !controller.first.value) {
                                                FocusScope.of(context).previousFocus();
                                              }
                                            },
                                          )
                                      ),
                                    )),
                                const SizedBox(width: size22,),
                                Flexible(
                                    child: Container(
                                      height: size.height/size9 - size13,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(size8),
                                          color: Colors.white,
                                          boxShadow: [BoxShadow(
                                              offset: const Offset(0.0, 2.0),
                                              color: grey.withOpacity(0.3),
                                              blurRadius: size5,
                                              spreadRadius: 0.1
                                          )]
                                      ),
                                      margin: const EdgeInsets.all(size5),
                                      child: Align(
                                          alignment: Alignment.center,
                                          child: OtpEditText(
                                            textcontroller: controller.thirdTextController,
                                            onChanged: (value){
                                              if (value.length == 1 && !controller.last.value) {
                                                FocusScope.of(context).nextFocus();
                                              }
                                              if (value.length == 0 && !controller.first.value) {
                                                FocusScope.of(context).previousFocus();
                                              }
                                            },
                                          )
                                      ),
                                    )),
                                const SizedBox(width: size22,),
                                Flexible(
                                    child: Container(
                                      height: size.height/size9 - size13,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(size8),
                                          color: Colors.white,
                                          boxShadow: [BoxShadow(
                                              offset: const Offset(0.0, 2.0),
                                              color: grey.withOpacity(0.3),
                                              blurRadius: size5,
                                              spreadRadius: 0.1
                                          )]
                                      ),
                                      margin: const EdgeInsets.all(size5),
                                      child: Align(
                                          alignment: Alignment.center,
                                          child: OtpEditText(
                                            textcontroller: controller.fouthTextController,
                                            onChanged: (value){
                                              if (value.length == 1 && !controller.last.value) {
                                                FocusScope.of(context).requestFocus(FocusNode());
                                              }
                                              if (value.length == 0 && !controller.first.value) {
                                                FocusScope.of(context).previousFocus();
                                              }
                                            },
                                          )
                                      ),
                                    )),
                              ],
                            ),
                          ),
                    ),
                    const Spacer(),
                    GetBuilder<OtpController>(
                        builder: (controller) => resendText(context)),
                    const SizedBox(height: size29,),
                    Container(
                      height: size44,
                      color: Colors.transparent,
                      padding:  const EdgeInsets.only(left: size24,right: size24),
                      child: ButtonField(
                        text: "Submit otp",
                        color: blue,
                        press: (){
                          setState(() {
                             otpController.otpVerification();
                             otpController.update();
                             //Get.offAllNamed(ROUTE_DASHBOARD);
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: size15,),
                  ],
                ),
              ),
            ],
          ),
      ),
    );
  }

  Widget resendText(BuildContext context) {
    final loginController = Get.put(LoginController());
    print("OTP ---- 1 : ${loginController.otpTextCode.value}");
    otpController.otpCode = loginController.otpTextCode.value;
    //Color setColor =  (PreferenceUtils.getBoolen(UserThemeData) == false ?  highLightTextColor : primaryColor);
    return GestureDetector(
      onTap: () {
        otpController.check.value = true;
        loginController.getApiData();
        otpController.firstTextController.clear();
        otpController.secondTextController.clear();
        otpController.thirdTextController.clear();
        otpController.fouthTextController.clear();
      },
      child: Align(alignment: Alignment.center,child: Text(
        "Resend otp",
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
            color: blue,
            fontFamily: "Poppins",
            fontWeight: TextUtils.normalTextWeight,
            fontSize: TextUtils.commonTextSize / Get.textScaleFactor,
            fontStyle: FontStyle.italic),
      ),),
    );
  }

}

class OtpEditText extends StatelessWidget {
  TextEditingController? textcontroller;
  final ValueChanged<String>? onChanged;
  final bool? editable;
  OtpEditText({Key? key, this.textcontroller,this.onChanged,this.editable}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtpController>(builder: (controller)=>  TextFormField(
        controller: textcontroller,
        maxLength: 1,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        cursorColor: Colors.transparent,
        autofocus: true,
        onChanged: onChanged,
        showCursor: false,
        readOnly: false,
        enabled: editable,
        enableInteractiveSelection: false,
        decoration: InputDecoration(
          filled: true,
          fillColor: white,
          hintText: '*',
          counterText: "",
          isDense: true,
          border: InputBorder.none,

          hintStyle: TextStyle(
              fontFamily: "Poppins",fontWeight: TextUtils.normalTextWeight,
              fontSize: size19 / Get.textScaleFactor),
        ),
        style: TextStyle(fontFamily: "Poppins",
            fontWeight: TextUtils.normalTextWeight,
            fontSize: size19 / Get.textScaleFactor),
      ),
    );
  }
}
