import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nearme/controller/home_address_controller.dart';
import 'package:nearme/utils/color_utils.dart';
import 'package:nearme/utils/constant.dart';
import 'package:nearme/utils/image_url.dart';
import 'package:nearme/utils/screen_size.dart';
import 'package:nearme/utils/text_utils.dart';
import 'package:nearme/widgets/button.dart';
import 'package:nearme/widgets/dot_line.dart';

class HomeAddress extends StatefulWidget {
  const HomeAddress({Key? key}) : super(key: key);

  @override
  _HomeAddressState createState() => _HomeAddressState();
}

class _HomeAddressState extends State<HomeAddress> {
  final TextEditingController searchLocationTextController =
  TextEditingController();
  var homeAddressController = Get.put(HomeAddressController());

  @override
  void initState() {
    // TODO: implement initState
    const DateAndTimebottomShit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
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
          "Home address",
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
                    const CircleAvatar(
                      radius: 7.5,
                      backgroundColor: primaryColor,
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
                    Container(
                      height: size15,
                      width: size15,
                      decoration: BoxDecoration(
                        color: white,
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(size20),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: size37, top: size10),
                      child: Text(
                        "Location",
                        style: TextStyle(
                            color: primaryColor,
                            fontFamily: "Poppins",
                            fontStyle: FontStyle.italic,
                            fontSize: TextUtils.hintTextSize,
                            fontWeight: TextUtils.normalTextWeight),
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(right: size20, top: size10),
                      child: Text(
                        "Order summary",
                        style: TextStyle(
                            color: grey,
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
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: size22),
                child: Text(
                  "Choose Location",
                  style: TextStyle(
                      color: primaryColor,
                      fontFamily: "Poppins",
                      fontSize: TextUtils.commonTextSize,
                      fontWeight: TextUtils.normalTextWeight),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: size20),
                child: Text(
                  "Add New Location",
                  style: TextStyle(
                      color: blue,
                      fontFamily: "Poppins",
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline,
                      fontSize: TextUtils.hintTextSize,
                      fontWeight: TextUtils.normalTextWeight),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: size10,
          ),
          Container(
            height: 100,
            width: size.width - size40,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(size8),
                boxShadow: [
                  BoxShadow(
                    color: grey.withOpacity(0.4),
                    offset: const Offset(0.0, 2.0),
                    blurRadius: size5,
                  ),
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: size22),
                      child: Image.asset(
                        "assets/png_file/home_address/done.png",
                        height: size20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: size20),
                      child: Text(
                        "Home",
                        style: TextStyle(
                            color: black,
                            fontFamily: "Poppins",
                            fontSize: TextUtils.hintTextSize,
                            fontWeight: TextUtils.normalTextWeight),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: size20),
                      child: Text(
                        "Edit",
                        style: TextStyle(
                            color: grey,
                            fontFamily: "Poppins",
                            fontSize: TextUtils.smallTextSize,
                            fontWeight: TextUtils.normalTextWeight),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: size62, top: size6),
                  child: Text(
                    "0227485165",
                    style: TextStyle(
                        color: grey,
                        fontFamily: "Poppins",
                        fontSize: TextUtils.smallTextSize,
                        fontWeight: TextUtils.normalTextWeight),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: size62, top: size7),
                  child: Text(
                    "325 Mansoura, Hay Aljamaa 122 Baker",
                    style: TextStyle(
                        color: grey,
                        fontFamily: "Poppins",
                        fontSize: TextUtils.smallTextSize,
                        fontWeight: TextUtils.normalTextWeight),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: size20, top: size26),
              child: Text(
                "Event Location (optional)",
                style: TextStyle(
                    color: primaryColor,
                    fontFamily: "Poppins",
                    fontSize: TextUtils.commonTextSize,
                    fontWeight: TextUtils.mediumtTextWeight),
              ),
            ),
          ),
          const SizedBox(
            height: size10,
          ),
          inputField(),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: size20, top: size26),
              child: Text(
                "Choose date and time",
                style: TextStyle(
                    color: primaryColor,
                    fontFamily: "Poppins",
                    fontSize: TextUtils.commonTextSize,
                    fontWeight: TextUtils.mediumtTextWeight),
              ),
            ),
          ),
          const SizedBox(
            height: size20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: size2),
                child: dateAndTime("assets/png_file/home_address/date.png",
                    "Date", "05 Sept, Sat"),
              ),
              Padding(
                padding: const EdgeInsets.only(right: size60),
                child: dateAndTime("assets/png_file/home_address/time.png",
                    "Time", "09:30 PM"),
              ),
            ],
          ),
          Padding(
            padding:
            const EdgeInsets.only(left: size20, right: size20, top: size20),
            child: ButtonField(
              text: "Proceed to summary",
              press: () {
                Get.toNamed(ROUTE_ORDER_SUMMARY);
              },
              color: blue,
            ),
          ),
        ],
      ),
    );
  }

  Widget inputField() {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: size44,
      width: width * 0.9,
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
          child: TextFormField(
            controller: searchLocationTextController,
            // maxLength: 1,
            // maxLines: 1,
            keyboardType: TextInputType.text,
            //enabled: editable,
            cursorColor: primaryColor,
            //autofocus: autoFocus ?? false,
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
              hintText: "Search Location",
              hintStyle: TextStyle(
                color: grey,
                fontSize: TextUtils.hintTextSize,
                fontWeight: TextUtils.normalTextWeight,
              ),
            ),
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: black,
              fontSize: TextUtils.commonTextSize,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  Widget dateAndTime(String image, String text, String dateTime) {
    return InkWell(
      onTap: () {
        showModalBottomSheet<void>(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (BuildContext context) {
            return const DateAndTimebottomShit();
          },
        );
      },
      child: Container(
        height: size150,
        width: size130,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(size8),
            boxShadow: [
              BoxShadow(
                color: grey.withOpacity(0.4),
                offset: const Offset(0.0, 2.0),
                blurRadius: size5,
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.only(left: size12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: size8),
                child: Image.asset(
                  image,
                  height: size30,
                ),
              ),
              Text(
                text,
                style: TextStyle(
                    color: grey,
                    fontFamily: "Poppins",
                    fontSize: TextUtils.commonTextSize,
                    fontWeight: TextUtils.mediumtTextWeight),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: size20),
                child: Text(
                  dateTime,
                  style: TextStyle(
                      color: black,
                      fontFamily: "Poppins",
                      fontSize: TextUtils.commonTextSize,
                      fontWeight: TextUtils.mediumtTextWeight),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DateAndTimebottomShit extends StatefulWidget {
  const DateAndTimebottomShit({Key? key}) : super(key: key);

  @override
  _bottomShitState createState() => _bottomShitState();
}

// ignore: camel_case_types
class _bottomShitState extends State<DateAndTimebottomShit> {
  @override
  void initState() {
    super.initState();
    _selectTime(context).whenComplete(() {
      setState(() {});
    });
    //    _selectDate(context);
    //       .whenComplete((){
    //   setState(() {});
    // });
  }

  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final ThemeData theme = Theme.of(context);
    assert(theme.platform != null);
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return buildMaterialDatePicker(context);
    // return buildCupertinoDatePicker(context);
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return buildCupertinoDatePicker(context);
    }
  }

  /// This builds material date picker in Android
  buildMaterialDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light(),
          child: Container(
            child: child,
          ),
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  /// This builds cupertion date picker in iOS
  buildCupertinoDatePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (picked) {
                if (picked != null && picked != selectedDate) {
                  setState(() {
                    selectedDate = picked;
                  });
                }
              },
              initialDateTime: selectedDate,
              minimumYear: 2000,
              maximumYear: 2025,
            ),
          );
        });
  }

  _selectTime(BuildContext context) async {
    print("time check --- $initialtimer");
    print("time check ---");
    final ThemeData theme = Theme.of(context);
    assert(theme.platform != null);
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
      // return buildMaterialDatePicker(context);
        return _selectTimePicker(context);
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return buildCupertinoTimePicker(context);
    }
  }

  Duration initialtimer = const Duration();

  /// cupertino time picker
  buildCupertinoTimePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          print("time check --- $initialtimer");
          print("time check ---");
          return Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            color: Colors.white,
            child: CupertinoTimerPicker(
              mode: CupertinoTimerPickerMode.hms,
              minuteInterval: 1,
              secondInterval: 1,
              initialTimerDuration: initialtimer,
              onTimerDurationChanged: (Duration changedtimer) {
                setState(() {
                  initialtimer = changedtimer;
                  // _time = changedtimer as String;
                  print("check time --- $changedtimer");
                });
              },
            ),
          );
        });
  }

  /// time picker

  String? _hour, _minute, _time;

  String? dateTime;
  TimeOfDay selectedTime = const TimeOfDay(hour: 00, minute: 00);
  Future<void> _selectTimePicker(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null) {
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour! + ' : ' + _minute!;
        timeController.text = _time!;
        // _timeController.text = formatDate(
        //     DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
        //     [hh, ':', nn, " ", am]).toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(size42),
              topRight: Radius.circular(size42))),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: size20,
              ),
              Center(
                child: Container(
                  width: size72,
                  height: size5,
                  decoration: BoxDecoration(
                      color: grey, borderRadius: BorderRadius.circular(size10)),
                ),
              ),
              const SizedBox(
                height: size20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: size24, right: size24),
                child: Row(
                  children: [
                    InkWell(
                        onTap: () {
                          setState(() {
                            Get.back();
                          });
                        },
                        child: Image.asset(
                          "assets/png_file/user_icons/close.png",
                          width: size16,
                          height: size16,
                        )),
                    const SizedBox(
                      width: 25,
                    ),
                    Text("Choose date and time",
                        style: TextStyle(
                            fontSize: TextUtils.headerTextSize,
                            fontFamily: "Poppins",
                            fontWeight: TextUtils.mediumtTextWeight)),
                  ],
                ),
              ),
              const SizedBox(
                height: size5,
              ),
              const Divider(
                thickness: 1,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: size80),
            child: ListView(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(
                      left: size20, top: size25, bottom: size10),
                  child: Text(
                    "Choose date",
                    style: TextStyle(
                      fontSize: size20,
                      fontWeight: FontWeight.w500,
                      color: grey,
                    ),
                  ),
                ),
                inputField(
                  // dateTextController,
                  "${selectedDate.toLocal()}".split(' ')[0],
                  "assets/png_file/home_address/date.png",
                      () {
                    _selectDate(context);
                    setState(() {});
                    selectedDate;
                  },
                ),
                const Padding(
                  padding: EdgeInsets.only(
                      left: size20, top: size20, bottom: size10),
                  child: Text(
                    "Choose Time",
                    style: TextStyle(
                      fontSize: size20,
                      fontWeight: FontWeight.w500,
                      color: grey,
                    ),
                  ),
                ),
                inputField(
                  //  timeTextController,
                  Platform.isAndroid
                      ? " ${selectedTime.hour.toString()} : ${selectedTime.minute.toString()}"
                      : initialtimer.toString().split(".").first,
                  // " ${  selectedTime.hour.toString()} : ${selectedTime.minute.toString()}",
                  "assets/png_file/home_address/time.png",
                      () {
                    _selectTime(context);
                    setState(() {});
                    //selectedDate;3
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: size50, right: size50, top: size30),
                  child: ButtonField(
                    color: blue,
                    press: () {
                      _selectDate(context);
                      setState(() {});
                      Get.back();
                    },
                    text: "Confirm",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  TextEditingController dateTextController = TextEditingController();
  TextEditingController timeTextController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  // TextEditingController timeTextController = TextEditingController();

  Widget inputField(
      // controller,
      text,
      String image,
      ontap,
      ) {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 44,
        width: width * 0.9,
        margin: const EdgeInsets.only(left: 24.0, right: 24.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: grey.withOpacity(0.4),
                offset: const Offset(0.0, 2.0),
                blurRadius: 7.0,
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  text, //"${selectedDate.toLocal()}".split(' ')[0],
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const Spacer(),
              InkWell(
                  onTap: ontap,
                  //     (){
                  //   _selectDate(context);
                  //   setState((){});
                  //   selectedDate;
                  // },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 14.0),
                    child: Image.asset(
                      image,
                      height: 30.0,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
