import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nearme/controller/order_summary_controller.dart';
import 'package:nearme/utils/color_utils.dart';
import 'package:nearme/utils/constant.dart';
import 'package:nearme/utils/image_url.dart';
import 'package:nearme/utils/screen_size.dart';
import 'package:nearme/utils/text_utils.dart';
import 'package:nearme/widgets/button.dart';
import 'package:nearme/widgets/dot_line.dart';

class OrderSummary extends StatefulWidget {
  const OrderSummary({Key? key}) : super(key: key);

  @override
  _OrderSummaryState createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  var orderSummaryControler = Get.put(OrderSummaryController());

  int currentValue = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar:  AppBar(
        leading: InkWell(
            onTap: () {
              setState(() {
                Get.back();
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(size15),
              child: Image.asset(
                leftIcon,
              ),
            )),
        title: Text(
          "Order summary",
          style: TextStyle(
              color: black,
              fontSize: TextUtils.headerTextSize,
              fontWeight: TextUtils.normalTextWeight,
              fontFamily: "Poppins"),
        ),
        centerTitle: false,
        elevation: 0.0,
        backgroundColor: grey1.withOpacity(0.1),
      ),
      body: ListView(
        children: [
          Container(
            width: size.width,
            height: size100,
            color: grey1.withOpacity(0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 7.5,
                      backgroundColor: grey.withOpacity(0.4),
                      child: const Icon(Icons.check,color: black,size: size10,),
                    ),
                    const SizedBox(
                      width: size10,
                    ),
                    DotWidget(
                      dashColor: Colors.black.withOpacity(0.6),
                      dashHeight: 0.5,
                      dashWidth: 5,
                      emptyWidth: 4,
                      totalWidth: size200,
                    ),
                    const SizedBox(
                      width: size10,
                    ),
                    const CircleAvatar(
                      radius: 7.5,
                      backgroundColor: primaryColor,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: size37,top: size10),
                      child: Text(
                        "Location",
                        style: TextStyle(
                            color: grey,
                            fontFamily: "Poppins",
                            fontStyle: FontStyle.italic,
                            fontSize: TextUtils.hintTextSize,
                            fontWeight: TextUtils.normalTextWeight),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: size20,top: size10),
                      child: Text(
                        "Order summary",
                        style: TextStyle(
                            color: primaryColor,
                            fontFamily: "Poppins",
                            fontStyle: FontStyle.italic,
                            fontSize: TextUtils.hintTextSize,
                            fontWeight: TextUtils.normalTextWeight),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: size20,
          ),
          Container(
            height: size100,
            color: white,
            child: Row(
              children: [
                const SizedBox(width: size22,),
                Container(
                  height: size90,
                  width: size80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(size20),
                      image: const DecorationImage(image: AssetImage("assets/png_file/beautician_image/beauticianPackages1.png"),fit: BoxFit.cover)
                  ),

                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  const EdgeInsets.only(left: size16,top: size6,bottom: 0.0),
                      child: Text(
                        "Makeup",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: TextUtils.headerTextSize,
                          fontWeight: TextUtils.mediumtTextWeight,
                          color: black,
                        ),
                      ),
                    ),
                    Padding(
                      padding:  const EdgeInsets.only(left: size16,top: 0.0,bottom: 0.0),
                      child: Text(
                        "individual",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: TextUtils.hintTextSize,
                          fontWeight: TextUtils.normalTextWeight,
                          fontStyle: FontStyle.italic,
                          color: grey,
                        ),
                      ),
                    ),
                    const Padding(
                      padding:  EdgeInsets.only(left: size16,top: size8,bottom: 0.0),
                      child: Text(
                        "₹1399/-",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: size20,
                          fontWeight: FontWeight.w500,
                          color: green,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset("assets/png_file/user_icons/heart.png",height: size25,),
                    Container(
                      height: size25,
                      width: size70,
                      decoration: BoxDecoration(
                        color: blue,
                        borderRadius: BorderRadius.circular(size4),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(onTap:  () {
                            if (currentValue >0) {
                              currentValue --;
                            }
                            setState(() {
                            });
                          },
                              child: const Icon(Icons.remove,color: white,size: size15,)),
                          Text(
                            "$currentValue",
                            style: TextStyle(
                                color: white,
                                fontFamily: "Poppins",
                                fontWeight: TextUtils.titleTextWeight
                            ),
                          ),
                          InkWell(onTap:  () {
                            if (currentValue >=0) {
                              currentValue ++;
                            }
                            setState(() {
                            });
                          },
                              child: const Icon(Icons.add  ,color: white,size: size15,)
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: size22,),
              ],
            ),
          ),
          Container(
            height: size130,
            width: size.width - size45,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(size8),
              border: Border.all(color: grey,width: size1),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: size.width - size130,
                  child: Padding(
                    padding:  const EdgeInsets.only(left: size4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:  const EdgeInsets.only(top: size8),
                          child: Text(
                            "Premium package",
                            style: TextStyle(
                                color: primaryColor,
                                fontFamily: "Poppins",
                                fontSize: TextUtils.commonTextSize,
                                fontWeight: TextUtils.mediumtTextWeight),
                          ),
                        ),
                        Text(
                          "Contains hair products like loreal lakeme and more...",
                          style: TextStyle(
                              color: grey,
                              fontFamily: "Poppins",
                              fontSize: TextUtils.hintTextSize,
                              fontWeight: TextUtils.mediumtTextWeight),
                        ),
                        Padding(
                          padding:  const EdgeInsets.only(bottom: size8),
                          child: Text(
                            "+₹199/-",
                            style: TextStyle(
                                color: green,
                                fontFamily: "Poppins",
                                fontSize: TextUtils.hintTextSize,
                                fontWeight: TextUtils.mediumtTextWeight),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 0.0, top: size12),
                  child: Container(
                    height: size25,
                    width: size60,
                    decoration: BoxDecoration(
                        color: grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(2.0)
                    ),
                    child: Center(
                      child: Text(
                        "Change",
                        style: TextStyle(
                            color: grey,
                            fontFamily: "Poppins",
                            fontSize: TextUtils.smallTextSize,
                            fontWeight: TextUtils.mediumtTextWeight),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: size20,
          ),
          const Divider(
            color: grey,
          ),
          const SizedBox(
            height: size20,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: size22, top: 0.0),
                child: Text(
                  "Hair setting",
                  style: TextStyle(
                      color: grey,
                      fontFamily: "Poppins",
                      fontSize: TextUtils.commonTextSize18,
                      fontWeight: TextUtils.mediumtTextWeight),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: size22, top: 0.0),
                child: Text(
                  "₹1399/-",
                  style: TextStyle(
                      color: grey,
                      fontFamily: "Poppins",
                      fontSize: TextUtils.commonTextSize18,
                      fontWeight: TextUtils.mediumtTextWeight),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: size20,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: size22, top: 0.0),
                child: Text(
                  "Premium package",
                  style: TextStyle(
                      color: grey,
                      fontFamily: "Poppins",
                      fontSize: TextUtils.commonTextSize18,
                      fontWeight: TextUtils.mediumtTextWeight),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: size22, top: 0.0),
                child: Text(
                  "+₹199/-",
                  style: TextStyle(
                      color: grey,
                      fontFamily: "Poppins",
                      fontSize: TextUtils.commonTextSize18,
                      fontWeight: TextUtils.mediumtTextWeight),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: size20,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: size22, top: 0.0),
                child: Text(
                  "Estimate amount",
                  style: TextStyle(
                      color: black,
                      fontFamily: "Poppins",
                      fontSize: TextUtils.commonTextSize18,
                      fontWeight: TextUtils.mediumtTextWeight),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: size22, top: 0.0),
                child: Text(
                  "₹1598/-",
                  style: TextStyle(
                      color: black,
                      fontFamily: "Poppins",
                      fontSize: TextUtils.commonTextSize18,
                      fontWeight: TextUtils.mediumtTextWeight),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: size20, right: size20, top: size20,bottom: size40),
            child: ButtonField(
              text: "Confirm selection",
              press: () {
                Get.toNamed(ROUTE_BOOKING_CONFIRMED);
              },
              color: blue,
            ),
          ),

        ],
      ),
    );
  }


}
