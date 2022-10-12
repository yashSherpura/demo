import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nearme/controller/get_city_list_controller.dart';
import 'package:nearme/controller/get_city_services_price_controller.dart';
import 'package:nearme/controller/get_new_service_controller.dart';
import 'package:nearme/controller/get_slave_offline_booking_leads_controller.dart';
import 'package:nearme/controller/user_screen_controller.dart';
import 'package:nearme/model/get_city_services_price_model.dart';
import 'package:nearme/model/get_slave_offline_booking_leads_model.dart';
import 'package:nearme/utils/color_utils.dart';
import 'package:nearme/utils/constant.dart';
import 'package:nearme/utils/screen_size.dart';
import 'package:nearme/utils/text_utils.dart';
import 'package:nearme/view/dashboard/beautician.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchCategoryTextController = TextEditingController();
  int index = 0;
  var userScreenController = Get.put(UserScreenController());
  var getCityListController = Get.put(GetCityListController());
  var getNewServiceController = Get.put(GetNewServiceController());
  var getCityServicesPriceController = Get.put(GetCityServicesPriceController());
  var getSlaveOfflineBookingLeadsController = Get.put(GetSlaveOfflineBookingLeadsController());





  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSlaveOfflineBookingLeadsController.getSlaveOfflineBookingLeadsApiData();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print(size.width - 26);
    return Scaffold(
      body: Obx(
            () =>
        getCityListController.isLoading.value
            ? const Center(
          child: CircularProgressIndicator(),
        )
            :
        Stack(
          children: [
            Column(
              children: [
                Container(
                    width: size.width,
                    height: size.height / size2,
                    color: white),
                Expanded(
                  child: Container(
                    width: size.width,
                    height: size.height / size2,
                    color: grey1.withOpacity(0.1),
                  ),
                ),
              ],
            ),
            SafeArea(
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: size24, right: size24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/svg_file/location.svg",
                                  width: size24,
                                  height: size24,
                                ),
                                const SizedBox(
                                  width: size10,
                                ),
                                DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    value: getCityListController.dropDownValue,
                                    hint: Text(
                                      getCityListController.address
                                          .toString(),
                                      style:  TextStyle(color: black,
                                        fontSize: TextUtils.hintTextSize  / Get.textScaleFactor,
                                        fontWeight: TextUtils
                                            .boldHeaderTextWeight,),
                                    ),
                                    //isExpanded: true,
                                    icon: const Padding(
                                      padding:
                                      EdgeInsets.only(left: size14),
                                      child: Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 19.5,
                                      ),
                                    ),
                                    items: getCityListController
                                        .citiesName
                                        .map((dynamic items) {
                                      return DropdownMenuItem(
                                          value: items.toString(),
                                          child: Row(
                                            children: [
                                              Text(
                                                items,
                                                style: TextStyle(
                                                    fontFamily: "Poppins",
                                                    fontSize: TextUtils
                                                        .hintTextSize  / Get.textScaleFactor,
                                                    fontWeight: TextUtils
                                                        .boldHeaderTextWeight,
                                                    color: black),
                                              ),
                                              // Text(
                                              //   items.substring(10),
                                              //   style: TextStyle(
                                              //       fontFamily: "Poppins",
                                              //       fontSize: TextUtils.hintTextSize,
                                              //       fontWeight: TextUtils.normalTextWeight,
                                              //       color: black
                                              //   ),
                                              // ),
                                            ],
                                          ));
                                    }).toList(),
                                    onChanged: (dynamic? newValue) {
                                      setState(() {
                                        getNewServiceController.address = newValue;
                                        getCityListController.dropDownValue = newValue!;
                                        getCityServicesPriceController.address = newValue;
                                        getNewServiceController.getNewServicesApiData();
                                        getCityServicesPriceController.getCityServicesPriceApiData();
                                        getNewServiceController.update();
                                        getCityListController.update();
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            DotWidget(
                              dashColor: Colors.black.withOpacity(0.4),
                              dashHeight: 0.5,
                              dashWidth: size10,
                              emptyWidth: size4,
                              totalWidth: size160,
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            //getNewServiceController.getNewServicesApiData();
                            //Get.toNamed(ROUTE_HOME_ADDRESS);
                          },
                          child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                CircleAvatar(
                                  radius: size18,
                                  child: Image.asset(
                                      "assets/png_file/home_icons/user_img.png"),
                                ),
                                const CircleAvatar(
                                  backgroundColor: red,
                                  radius: 4.5,
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: size19,
                  ),
                  inputField(),
                  const SizedBox(
                    height: size20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: size24, right: size24),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        exploreServices,
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: TextUtils.commonTextSize  / Get.textScaleFactor,
                            fontFamily: "Poppins",
                            fontWeight: TextUtils.normalTextWeight),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: size16,
                  ),
                  getNewServiceController.newServiceList.isEmpty  ?  Center(child: Text("No Record Found",style: TextStyle(
                    fontSize: TextUtils.mediumTextSize / Get.textScaleFactor
                  ),),):
                  Container(
                    height: getNewServiceController.newServiceList.length >= 5  ? 240 : 120,
                    margin: const EdgeInsets.only(
                        left: size20, right: size20),
                    child:
                    GridView.builder(

                      scrollDirection: Axis.vertical,
                      itemCount:
                      getNewServiceController.newServiceList.length >= 8 ? 8 : getNewServiceController.newServiceList.length,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: (size1 / 1.4),
                        crossAxisSpacing: 6,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        print(
                            "Length :- ${getNewServiceController.newServiceList[index].serviceName}");
                        return Container(
                          height: size70,
                          padding: const EdgeInsets.only(
                              left: size5,
                              right: size5,
                              bottom: size5,
                              top: 0),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  //Get.toNamed(ROUTE_BEAUTICIAN);
                                },
                                child: Container(
                                  height: size67,
                                  width: size67,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                      BorderRadius.circular(size8),
                                      boxShadow: [
                                        BoxShadow(
                                          color: grey.withOpacity(0.4),
                                          offset: const Offset(0.0, 2.0),
                                          blurRadius: size5,
                                        ),
                                      ]),
                                  child:
                                  getNewServiceController.newServiceList.length >= 8 ? index == 7 ?
                                  InkWell(
                                    onTap: (){},
                                    child: Center(
                                      child: Text(
                                        "+${getNewServiceController.newServiceList.length - 7} more",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: TextUtils
                                                .smallTextSize  / Get.textScaleFactor,
                                            fontFamily: "Poppins",
                                            color: blue1,
                                            fontWeight: TextUtils
                                                .normalTextWeight),
                                      ),
                                    ),
                                  )
                                      :
                                  Container(
                                    width: size10,
                                    height: size10,
                                    margin: EdgeInsets.all(
                                        index == 0
                                            ? size13
                                            : size17),
                                    child:
                                    getNewServiceController.newServiceList[index].serviceImage!.split(".").last == "svg" ?
                                    SvgPicture.network(
                                      getNewServiceController
                                          .newServiceList[index]
                                          .serviceImage!,
                                    ) : Image.network( getNewServiceController
                                        .newServiceList[index]
                                        .serviceImage!,),
                                  )
                                      :  Container(
                                    width: size10,
                                    height: size10,
                                    margin: EdgeInsets.all(
                                        index == 0
                                            ? size13
                                            : size17),
                                    child:
                                    getNewServiceController.newServiceList[index].serviceImage!.split(".").last == "svg" ?
                                    SvgPicture.network(
                                      getNewServiceController
                                          .newServiceList[index]
                                          .serviceImage!,
                                    ) : Image.network( getNewServiceController
                                        .newServiceList[index]
                                        .serviceImage!,),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: size8,
                              ),
                              Visibility(
                                visible:
                                index == 7
                                    ? false
                                    : true,
                                child: Text(
                                  getNewServiceController.newServiceList[index].serviceName!.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: TextUtils.smallTextSize  / Get.textScaleFactor,
                                      fontFamily: "Poppins",
                                      //fontWeight: TextUtils.normalTextWeight,
                                      color: black),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    height: size240,
                    alignment: AlignmentDirectional.center,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: size24, right: size24, top: size3),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              topServices,
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: TextUtils.commonTextSize  / Get.textScaleFactor,
                                  fontFamily: "Poppins",
                                  fontWeight: TextUtils.normalTextWeight),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: size10,
                        ),
                        Expanded(
                          child: getCityServicesPriceController.resultList.isEmpty ?  Center(child: Text("No Record Found",
                          style: TextStyle(
                            fontSize: TextUtils.mediumTextSize  / Get.textScaleFactor
                          ),),) :
                          ListView.builder(
                              padding: const EdgeInsets.only(left: size12,right: size20),
                              itemCount: getCityServicesPriceController.resultListLowerData,//resultList.length,//topServiceList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                // var data = topServiceList[index];
                                var data = getCityServicesPriceController.resultList[index];
                                return topServicesTile(context, data);
                              }),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: size270,
                    alignment: AlignmentDirectional.center,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: size24, right: size24, top: 00),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              upcomingEnquiry,
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: TextUtils.commonTextSize  / Get.textScaleFactor,
                                  fontFamily: "Poppins",
                                  fontWeight: TextUtils.normalTextWeight),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: size20,
                        ),
                        Expanded(
                          child: Container(
                            height: 180,
                            child: getSlaveOfflineBookingLeadsController.upComingEnquiryDataList.isEmpty ?
                             Center(child: Text("No Rides Found Till now",
                               style: TextStyle(
                              fontSize: TextUtils.mediumTextSize  / Get.textScaleFactor
                            ),),) :
                            ListView.builder(
                                padding: const EdgeInsets.only(left: size24),
                                itemCount: getSlaveOfflineBookingLeadsController.upComingEnquiryDataList.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  var data = getSlaveOfflineBookingLeadsController.upComingEnquiryDataList[index];
                                  print("data type ${data.locationType}");
                                  print("data type ");
                                  return upcomingInqueryTile1(context, data);
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget topServicesTile(BuildContext context, Result data) {
    return InkWell(
      onTap: () {
       // Get.toNamed(ROUTE_USER_SCREEN);
      },
      child:
      Container(
        // height: 200,
        margin: const EdgeInsets.only(left: size12),
        child: Column(
          // alignment: AlignmentDirectional.bottomCenter,
          children: [
            SizedBox(
              height: size85,
              width: size133,
              child:
              data.proPic!.split(".").last == "svg" ?
              SvgPicture.asset(
                "assets/png_file/home_icons/top_service_1.png",
                //data.proPic!,
                fit: BoxFit.fill,
              ) : Image.asset(
                "assets/png_file/home_icons/top_service_1.png",
                //data.proPic!,
                fit: BoxFit.fill,
              ),
              // data.proPic!.split(".").last == "svg" ?
              // SvgPicture.network(
              //   data.proPic!,
              //   fit: BoxFit.fill,
              // ) : Image.network( data.proPic!,fit: BoxFit.fill,),
            ),
            Container(
                height: size84,
                width: size133,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(size8),bottomRight: Radius.circular(size8))
                ),
                // padding: const EdgeInsets.symmetric(vertical: size10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(height: size10,),
                    Container(
                      //height: size19,
                      //width: 49,
                      margin: const EdgeInsets.only(
                        left: size10,
                      ),
                      //padding: const EdgeInsets.symmetric(horizontal: size5,vertical: size4),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: const BorderRadius.all(Radius.circular(size3))
                      ),
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: size6,right:size6 ),
                            child: Text(
                              // "${data['service']}",
                                "${data.serviceType}",
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style:  TextStyle(
                                    fontSize: TextUtils.smallTenTextSize / Get.textScaleFactor,
                                    fontFamily: "Poppins",
                                    fontWeight: TextUtils.normalTextWeight,
                                    color: grey2
                                )
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: size6,),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(
                          left: size10,
                        ),
                        child: Text(data.serviceName.toString(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style:  TextStyle(
                                fontSize: TextUtils.hintTextSize  / Get.textScaleFactor,
                                fontFamily: "Poppins",
                                fontWeight: TextUtils.normalTextWeight,
                                color: black
                            )
                        ),
                      ),
                    ),
                    const SizedBox(height: size8,),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(
                          left: size10,
                        ),
                        child: Text("₹${data.price} onwards",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: TextUtils.smallTextSize  / Get.textScaleFactor,
                              fontWeight: TextUtils.mediumtTextWeight,
                              color: green,
                              fontFamily: "Poppins",
                            )
                        ),
                      ),
                    ),
                    const SizedBox(height: size8,),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Widget inputField() {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: size44,
      width: width,
      margin: const EdgeInsets.only(left: size24, right: size24),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(size8),
          boxShadow: [
            BoxShadow(
              color: grey.withOpacity(0.4),
              offset: const Offset(0.0, 2.0),
              blurRadius: size7,
            ),
          ]),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(size8),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: searchCategoryTextController,
                  keyboardType: TextInputType.text,
                  cursorColor: primaryColor,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    contentPadding:
                    const EdgeInsets.only(bottom: size15, left: size10),
                    filled: true,
                    fillColor: white,
                    counterText: "",
                    hintText: "Search category or service",
                    hintStyle: TextStyle(
                      color: grey4,
                      fontSize: TextUtils.hintTextSize  / Get.textScaleFactor,
                      fontWeight: TextUtils.normalTextWeight,
                    ),
                  ),
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: black,
                    fontSize: TextUtils.commonTextSize  / Get.textScaleFactor,
                    fontWeight: TextUtils.normalTextWeight,
                  ),
                ),
              ),
              Container(
                height: size32,
                width: size32,
                decoration: BoxDecoration(
                    color: blue, borderRadius: BorderRadius.circular(size8)),
                child: const Icon(
                  Icons.search,
                  color: Colors.white,
                  size: size22,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget upcomingInqueryTile1(BuildContext context, Data data) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(right: size24),
        child: FittedBox(
          child: Container(
            //height: 140,
            //width: size311,
            width: MediaQuery.of(context).size.width - 46,
            //margin: const EdgeInsets.symmetric(vertical: size25),
            decoration: BoxDecoration(
              //color: Colors.red,
              color: Colors.white,
              borderRadius: BorderRadius.circular(size10),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding:  const EdgeInsets.only(top: size15,left: size16),
                          child: Container(
                            height: size41,
                            width: size41,
                            decoration:  const BoxDecoration(
                            ),
                            child: data.vehicleData!.driverImage.toString().split(".").last == "svg" ?
                            SvgPicture.network(
                              data.vehicleData!.driverImage.toString(),
                              fit: BoxFit.fill,
                            ) : Image.network( data.vehicleData!.driverImage.toString(),fit: BoxFit.fill,),
                          ),
                        ),
                        const SizedBox(width: size12,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            // const SizedBox(height: size7,),
                            Padding(
                              padding:  EdgeInsets.only(top:size15,bottom: size4),
                              child: Text(
                                data.locationType.toString(),
                                style: TextStyle(
                                  fontWeight: TextUtils.titleTextWeight,
                                  color: black,
                                  fontSize: TextUtils.hintTextSize  / Get.textScaleFactor,
                                  fontFamily: "Poppins",
                                ),
                              ),
                            ),
                            Text(
                              data.typeName.toString(),
                              style: TextStyle(
                                //fontWeight: TextUtils.normalTextWeight,
                                color: black,
                                fontSize: TextUtils.smallTextSize  / Get.textScaleFactor,
                                fontFamily: "Poppins",
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding:  const EdgeInsets.only(right: size16,top: size17),
                      child: Text(
                        "₹${data.approxFare}/-",
                        style: TextStyle(
                          fontWeight: TextUtils.mediumtTextWeight,
                          color: green,
                          fontSize: TextUtils.smallTextSize  / Get.textScaleFactor,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ],
                ),

                // const SizedBox(
                //   height: size10,
                // ),

                Padding(
                  padding: const EdgeInsets.only(top: 11.12),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 12.65,
                        width: size5,
                        decoration:  BoxDecoration(
                            border: Border.all(color: grey.withOpacity(0.5),width: 0.5),
                            borderRadius: const BorderRadius.only(bottomRight:  Radius.circular(size20),topRight:  Radius.circular(size20))
                        ),
                      ),
                      // Container(
                      //   height: 0.5,
                      //   width: size310,
                      //   color: grey.withOpacity(0.5),
                      // ),
                      Expanded(
                        child: Divider(
                          thickness: 1.5,
                          color: grey.withOpacity(0.2),
                        ),
                      ),
                      Container(
                        height:  12.65,
                        width: size5,
                        decoration:  BoxDecoration(
                            border: Border.all(color: grey.withOpacity(0.5),width: 0.5),
                            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(size20),topLeft: Radius.circular(size20))
                        ),
                      ),

                    ],
                  ),
                ),

                Column(
                  children: [
                    Padding(
                      padding:   EdgeInsets.only(left: size16,right: size16,top: 11.12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Date",
                            style: TextStyle(
                              fontWeight: TextUtils.normalTextWeight,
                              color: grey,
                              fontSize: TextUtils.smallTenTextSize  / Get.textScaleFactor,
                              fontFamily: "Poppins",
                            ),
                          ),
                          Text(
                            "Time",
                            style: TextStyle(
                              fontWeight: TextUtils.normalTextWeight,
                              color: grey,
                              fontSize: TextUtils.smallTenTextSize  / Get.textScaleFactor,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:   EdgeInsets.only(left: size16,right: size16,top: size5,bottom: size21),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${data.scheduledTime}".split(",").first,

                            style: TextStyle(
                              fontWeight: TextUtils.superHeaderTextWeight,
                              color: black,
                              fontSize: TextUtils.hintTextSize  / Get.textScaleFactor,
                              fontFamily: "Poppins",
                            ),
                          ),
                          Text(
                            "${data.scheduledTime}".split(",").last,
                            style: TextStyle(
                              fontWeight: TextUtils.superHeaderTextWeight,
                              color: black,
                              fontSize: TextUtils.hintTextSize  / Get.textScaleFactor,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ],
                      ),
                    ),
                    // const SizedBox(height: size10,),
                    Container(
                      height: 0.5,
                      width: MediaQuery.of(context).size.width,
                      color: grey.withOpacity(0.4),
                    ),
                    Row(

                      // crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:  const EdgeInsets.only(left: size24),
                          child: Text(
                            viewBookingDetail,
                            style: TextStyle(
                              fontWeight: TextUtils.normalTextWeight,
                              color: grey,
                              fontSize: TextUtils.smallTextSize  / Get.textScaleFactor,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ),

                        const Spacer(),

                        Center(
                          child: Container(
                            height: MediaQuery.of(context).size.height / 18.15,
                            width: 0.5,
                            color: grey,
                          ),
                        ),

                        const Spacer(),

                        Padding(
                          padding:  const EdgeInsets.only(right: size24),
                          child: Text(
                            callBeautician,
                            style: TextStyle(
                              fontWeight: TextUtils.normalTextWeight,
                              color: grey,
                              fontSize: TextUtils.smallTextSize  / Get.textScaleFactor,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget upcomingInqueryTile2(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: size10),
      child: InkWell(
        onTap: () {},
        child: Container(
          //height: 140,
          width: size330,
          //margin: const EdgeInsets.symmetric(vertical: size25),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(size20),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: size10,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: size20),
                    child: Text(
                      "Uppal",
                      style: TextStyle(
                        color: green,
                        fontWeight: TextUtils.titleTextWeight,
                        fontSize: TextUtils.hintTextSize,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),
                  const CircleAvatar(
                    radius: size4,
                    backgroundColor: green,
                  ),
                  Expanded(
                    child: Center(
                      child: DotWidget(
                        dashColor: Colors.black.withOpacity(0.4),
                        dashHeight: 0.5,
                        dashWidth: size8,
                        emptyWidth: size4,
                        totalWidth: MediaQuery.of(context).size.width / 2.5,
                      ),
                    ),
                  ),

                  //const Spacer(),
                  const CircleAvatar(
                    radius: size4,
                    backgroundColor: red,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: size20),
                    child: Text(
                      "Airport",
                      style: TextStyle(
                        fontWeight: TextUtils.titleTextWeight,
                        fontSize: TextUtils.hintTextSize,
                        fontFamily: "Poppins",
                        color: red,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: size10,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: size20),
                    child: Text(
                      "From",
                      style: TextStyle(
                        fontWeight: TextUtils.normalTextWeight,
                        color: grey,
                        fontSize: TextUtils.smallTextSize,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "Airport ride",
                    style: TextStyle(
                      fontWeight: TextUtils.headerTextWeight,
                      color: grey,
                      fontSize: TextUtils.hintTextSize,
                      fontFamily: "Poppins",
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: size20),
                    child: Text(
                      "To",
                      style: TextStyle(
                        fontWeight: TextUtils.normalTextWeight,
                        color: grey,
                        fontSize: TextUtils.smallTextSize,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: size8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: size16,
                    width: size8,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: grey.withOpacity(0.5), width: 0.5),
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(size20),
                            topRight: Radius.circular(size20))),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: grey.withOpacity(0.2),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: size16,
                      width: size8,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: grey.withOpacity(0.5), width: 0.5),
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(size20),
                              topLeft: Radius.circular(size20))),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: size14, right: size14),
                    child: Row(
                      children: [
                        Text(
                          "Date",
                          style: TextStyle(
                            fontWeight: TextUtils.normalTextWeight,
                            color: grey,
                            fontSize: TextUtils.smallTextSize,
                            fontFamily: "Poppins",
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "Time",
                          style: TextStyle(
                            fontWeight: TextUtils.normalTextWeight,
                            color: grey,
                            fontSize: TextUtils.smallTextSize,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: size14, right: size14, top: size5),
                    child: Row(
                      children: [
                        Text(
                          "21 Sep, 2021",
                          style: TextStyle(
                            fontWeight: TextUtils.superHeaderTextWeight,
                            color: black,
                            fontSize: TextUtils.hintTextSize,
                            fontFamily: "Poppins",
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "05:30 PM",
                          style: TextStyle(
                            fontWeight: TextUtils.superHeaderTextWeight,
                            color: black,
                            fontSize: TextUtils.hintTextSize,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: size10,
                  ),
                  Container(
                    height: 0.5,
                    width: MediaQuery.of(context).size.width,
                    color: grey,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: size20),
                        child: Text(
                          viewBookingDetail,
                          style: TextStyle(
                            fontWeight: TextUtils.normalTextWeight,
                            color: grey,
                            fontSize: TextUtils.smallTextSize,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: size30,
                        width: 0.5,
                        color: grey,
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: size24),
                        child: Text(
                          callBeautician,
                          style: TextStyle(
                            fontWeight: TextUtils.normalTextWeight,
                            color: grey,
                            fontSize: TextUtils.smallTextSize,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DotWidget extends StatelessWidget {
  final double totalWidth, dashWidth, emptyWidth, dashHeight;

  final Color dashColor;

  const DotWidget({
    this.totalWidth = 250,
    this.dashWidth = 10,
    this.emptyWidth = 5,
    this.dashHeight = 2,
    this.dashColor = Colors.grey,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        totalWidth ~/ (dashWidth + emptyWidth),
            (_) => Container(
          width: dashWidth,
          height: dashHeight,
          color: dashColor,
          margin: EdgeInsets.only(left: emptyWidth / 2, right: emptyWidth / 2),
        ),
      ),
    );
  }
}
