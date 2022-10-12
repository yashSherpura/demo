import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:nearme/controller/login_controller.dart';
import 'package:nearme/utils/color_utils.dart';
import 'package:nearme/utils/constant.dart';
import 'package:nearme/utils/screen_size.dart';
import 'package:nearme/utils/text_utils.dart';
import 'package:nearme/widgets/button.dart';
import 'package:nearme/widgets/input_field.dart';
import 'package:nearme/widgets/my_scroll_behavior.dart';
import 'package:nearme/widgets/snackbar_message.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final imageList = [
    "assets/png_file/home_icons/slider_1.png",
    "assets/png_file/home_icons/slider_2.png",
    "assets/png_file/home_icons/slider_3.png",
  ];

  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  int index = 0;

  var mobileNumber = false.obs;

  final loginController = Get.put(LoginController());

  final FocusNode _nodeText5 = FocusNode();

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
      keyboardBarColor: Colors.grey[700],
      nextFocus: false,
      actions: [
        KeyboardActionsItem(
          focusNode: _nodeText5,
          toolbarButtons: [
            (node) {
              return Padding(
                padding:  const EdgeInsets.only(right: 8.0),
                child: GestureDetector(
                  onTap: () => node.unfocus(),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.circular(06.0)
                    ),
                    child: const Text(
                      "DONE",
                      style: TextStyle(color: white),
                    ),
                  ),
                ),
              );
            }
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print(size.height/size2 - size14);
    return Scaffold(
      appBar: AppBar(
        title: Text("NearMe",
          style: TextStyle(
            color: primaryColor,
            fontFamily: "Poppins",
            fontWeight: TextUtils.mediumtTextWeight,
            fontSize: size25 / Get.textScaleFactor
          ),),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: size20,left: size24,right: size24),
        child:
        Container(
          child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: KeyboardActions(
              config: _buildConfig(context),
              child: ListView(
                children: [
                  Container(
                    height: size.height/size2 - size14,
                    child: PageView.builder(
                      itemCount: imageList.length,
                        onPageChanged: (i){
                          setState(() {
                            index = i;
                          });
                        },
                        itemBuilder: (context, i){
                          return Image.asset(imageList[i]);
                        },
                    ),
                  ),

                  const SizedBox(height: size24,),

                  index == 0 ? simpleText("Hire a beautician of your choice") : index == 1 ? simpleText("Hire a Photographer at ease") : simpleText("Request for a outstation rides now"),

                  const SizedBox(height: size18,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: size8,width: size8,
                        margin: const EdgeInsets.all(size8),
                        decoration: BoxDecoration(
                            color: index == 0 ? blue : grey.withOpacity(0.3),
                            shape: BoxShape.circle
                        ),
                      ),
                      Container(
                        height: size8,width: size8,
                        margin: const EdgeInsets.all(size8),
                        decoration: BoxDecoration(
                            color: index == 1 ? blue : grey.withOpacity(0.3),
                            shape: BoxShape.circle
                        ),
                      ),
                      Container(
                        height: size8,width: size8,
                        margin: const EdgeInsets.all(size8),
                        decoration: BoxDecoration(
                            color: index == 2 ? blue : grey.withOpacity(0.3),
                            shape: BoxShape.circle
                        ),
                      )
                    ],
                  ),

                  const SizedBox(height: size23,),

                  formLable(context, "Mobile Number".tr),

                  const SizedBox(height: size10,),
                  Container(
                    margin: const EdgeInsets.only(
                      top: size2,left: size8,right: size8),
                    height: 46.sp,
                    decoration: BoxDecoration(
                      boxShadow: [BoxShadow(
                        spreadRadius: size5,
                        blurRadius: size8,
                        color: grey.withOpacity(0.1),
                      )],
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 1,color: grey.withOpacity(0.3))
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: size50,
                          color: grey.withOpacity(0.1),
                          child: Center(child: Text("+91",
                            textScaleFactor: Get.textScaleFactor,
                            style: TextStyle(
                                fontSize: TextUtils.hintTextSize / Get.textScaleFactor,
                                fontWeight: TextUtils.normalTextWeight,
                                color: black),)),
                        ),
                        Expanded(
                          child: GetBuilder<LoginController>( // specify type as Controller
                              init: LoginController(), // intialize with the Controller
                              builder: (controller) {
                                return Stack(
                                  alignment: AlignmentDirectional.centerEnd,
                                  children: [
                                    InputField(
                                      keyboardType: TextInputType.number,
                                      moveCurser: TextInputAction.next,
                                      controller: controller.mobileNumberController,
                                      focusNode: _nodeText5,
                                      maxLines: 1,
                                      maxLength: 10,
                                      onChanged: (value) {
                                        setState(() {
                                          if(controller.mobileNumberController!.text.length == 10){
                                            mobileNumber.value = true;
                                          }else{
                                            mobileNumber.value =false;
                                          }

                                          print("numberLength :- ${controller.mobileNumberController!.text.length}");
                                          controller.update();
                                        });
                                      },
                                    ),
                                    controller.mobileNumberController!.text.length == 10 ?
                                    Container(
                                      height: size20,
                                      width: size20,
                                      margin: const EdgeInsets.only(right: size5),
                                      decoration: const BoxDecoration(
                                          color: teal,
                                          shape: BoxShape.circle
                                      ),
                                      child:   const Icon(Icons.done,color: white,size: 15,) ,
                                    ) : const SizedBox.shrink(),
                                  ],
                                );
                              }
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: size5),
                          decoration: const BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(size10),bottomRight: Radius.circular(size10)),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 31,),
                  Container(
                    height: size44,
                    color: Colors.transparent,
                    padding:  const EdgeInsets.only(left: size22,right: size22),
                    child: ButtonField(
                      text: "Get started",
                      color: blue,
                      press: (){
                        setState(() {
                          if(loginController.mobileNumberController!.text == ""){
                            snakbarMsg(
                                icon: Icons.dangerous,
                                title: 'Mobile Number',
                                msg: 'Enter Your Mobile Number',
                                colors: Colors.white,
                                bgColor: Colors.redAccent);
                          }else {
                            loginController.checkLocationPermission();
                             loginController.getApiData();
                             //Get.toNamed(ROUTE_OTPVERIFY);
                          }
                        });
                      },
                    ),
                  ),

                  const SizedBox(height: size15,),
                ],
              ),
            ),
          ),
        )
      ),


    );
  }

  Widget simpleText(title){
    return Center(
      child: Text(title,
        textScaleFactor:  Get.textScaleFactor,
        style: TextStyle(
            fontSize: TextUtils.commonTextSize / Get.textScaleFactor,
            fontFamily: "Poppins",
            fontWeight: TextUtils.normalTextWeight
        ),
      ),
    );
  }

  Widget formLable(BuildContext context,title){
    return Padding(
      padding: const EdgeInsets.only(left: size8,right: size8),
      child: Text(title,
          textScaleFactor:  Get.textScaleFactor,
          style: Theme.of(context).textTheme.headline6!.copyWith(
          color: grey,
          fontFamily: "Poppins",
          fontWeight:TextUtils.normalTextWeight,
          fontSize: TextUtils.smallTextSize / Get.textScaleFactor )),
    );
  }
}

