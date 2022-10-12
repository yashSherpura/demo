import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nearme/controller/dashboard_controller.dart';
import 'package:nearme/utils/color_utils.dart';
import 'package:nearme/utils/screen_size.dart';
import 'package:nearme/utils/text_utils.dart';
import 'package:nearme/view/home/home_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  var dashboardController = Get.put(DashboardController());
  //final checkSessionController = Get.put(CheckSessionController());



  @override
  Widget build(BuildContext context) {

    var _items = [
      BottomNavigationBarItem(
          icon: Stack(
            children: [
              Image.asset("assets/png_file/home_icons/home.png",width: size24,height: size24,color: dashboardController.tabIndex==0 ? blue1 : black,),
              dashboardController.tabIndex!=0 ?
              const SizedBox(width: 0,height: 0,):
              Baseline(
                baseline: size13,
                baselineType: TextBaseline.alphabetic,
                child: Container(
                  width: size10,height: 1.5,color: blue1,
                  margin: const EdgeInsets.only(bottom: size20,left: size7),
                  alignment: AlignmentDirectional.center,
                ),
              ),
            ],
          ),
          title: Text("Home",
            style: TextStyle(color: blue1,
                fontSize: size10  / Get.textScaleFactor,
                fontFamily: "Poppins",
                fontWeight: TextUtils.normalTextWeight),)),
      BottomNavigationBarItem(
          icon: Stack(
            children: [
              Image.asset("assets/png_file/home_icons/category.png",width: size24,height: size24,color: dashboardController.tabIndex==1 ? blue1 : black,),
              dashboardController.tabIndex!=1 ?
              const SizedBox(width: 0,height: 0,):
              Baseline(
                baseline: size13,
                baselineType: TextBaseline.alphabetic,
                child: Container(
                  width: size10,height: 1.5,color: blue1,
                  margin: const EdgeInsets.only(bottom: size20,left: size7),
                  alignment: AlignmentDirectional.center,
                ),
              ),
            ],
          ),
          title: Text("Category",
            style: TextStyle(color: blue1,
                fontSize: size10  / Get.textScaleFactor,
                fontFamily: "Poppins",
                fontWeight: TextUtils.normalTextWeight),)),
      BottomNavigationBarItem(
          icon: Stack(
            children: [
              Image.asset("assets/png_file/home_icons/clipboard.png",width: size24,height: size24,color: dashboardController.tabIndex==2 ? blue1 : black,),
              dashboardController.tabIndex!=2 ?
              const SizedBox(width: 0,height: 0,):
              Baseline(
                baseline: size13,
                baselineType: TextBaseline.alphabetic,
                child: Container(
                  width: size10,height: 1.5,color: blue1,
                  margin: const EdgeInsets.only(bottom: size20,left: size7),
                  alignment: AlignmentDirectional.center,
                ),
              ),
            ],
          ),
          title: Text("Booking",
            style: TextStyle(color: blue1,
                fontSize: size10  / Get.textScaleFactor,
                fontFamily: "Poppins",
                fontWeight: TextUtils.normalTextWeight),)),
      BottomNavigationBarItem(
          icon: Stack(
            children: [
              Image.asset("assets/png_file/home_icons/notification.png",width: size24,height: size24,color: dashboardController.tabIndex==3 ? blue1 : black,),
              dashboardController.tabIndex!=3 ?
              const SizedBox(width: 0,height: 0,) :
              Baseline(
                baseline: size13,
                baselineType: TextBaseline.alphabetic,
                child: Container(
                  width: size10,height: 1.5,color: blue1,
                  margin: const EdgeInsets.only(bottom: size20,left: size7),
                  alignment: AlignmentDirectional.center,
                ),
              ),
            ],
          ),
          title: Text("Notification",
            style: TextStyle(color: blue1,
                fontSize: size10  / Get.textScaleFactor,
                fontFamily: "Poppins",
                fontWeight: TextUtils.normalTextWeight),)),
    ];

    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: dashboardController.tabIndex,
          children: [
            const HomeScreen(),
           Container(),
           // const CategoryScreen(),
            Container(),
            Container(),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        // showSelectedLabels: true,
        //   showUnselectedLabels: true,
          type: BottomNavigationBarType.shifting,
          currentIndex: dashboardController.tabIndex,
          selectedItemColor: blue1,
          onTap: (value){
            setState(() {
              dashboardController.tabIndex = value;
            });
          },
          items: _items
      ),

    );
  }
}
