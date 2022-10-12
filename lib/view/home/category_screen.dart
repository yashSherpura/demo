import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nearme/controller/user_screen_controller.dart';
import 'package:nearme/utils/color_utils.dart';
import 'package:nearme/utils/constant.dart';
import 'package:nearme/utils/screen_size.dart';
import 'package:nearme/utils/text_utils.dart';
import 'package:nearme/view/dashboard/beautician.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  TextEditingController searchCategoryTextController = TextEditingController();
  int index = 0;
  var userScreenController = Get.put(UserScreenController());

  String dropdownvalue = 'BTM Layout, Banglore';
  var items = ['BTM Layout, Banglore'];

  var exploreService = [
    { "name" : "GoKar", "img" : "assets/png_file/category_icons/cab.png" },
    { "name" : "Tutor", "img" : "assets/png_file/category_icons/tutor.png" },
    { "name" : "Catering", "img" : "assets/png_file/category_icons/catering.png"},
    { "name" : "Beautician", "img" : "assets/png_file/category_icons/beautician.png"},
    { "name" : "Purohit", "img" : "assets/png_file/category_icons/purohit.png"},
    { "name" : "Technician", "img" : "assets/png_file/category_icons/technician.png"},
    { "name" : "Instant foods", "img" : "assets/png_file/category_icons/food.png"},
    { "name" : "Mechanic", "img" : "assets/png_file/category_icons/mechanic.png"},
    { "name" : "Health care", "img" : "assets/png_file/category_icons/health_care.png"},
    { "name" : "Decoration", "img" : "assets/png_file/category_icons/decorator.png"},
    { "name" : "Photography", "img" : "assets/png_file/category_icons/photography.png"},
    { "name" : "Fitness", "img" : "assets/png_file/category_icons/fitness.png"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Padding(
            padding: const EdgeInsets.only(left: size20),
            child: Text(
              "Category",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: size20,
                  fontWeight: TextUtils.normalTextWeight,
                  color: black
              ),
            ),
          ),
          actions: [
            Padding(
                padding:  const EdgeInsets.only(right: size20),
                child: Image.asset("assets/png_file/beautician_image/icon_search.png",width: size20,height: size20,color: black,)
            ),
            Padding(
              padding: const EdgeInsets.only(right: size20,top: size10),
              child: Stack(alignment: Alignment.topRight, children: [
                CircleAvatar(
                  radius: size18,
                  child: Image.asset("assets/png_file/home_icons/user_img.png"),
                ),
                const CircleAvatar(
                  backgroundColor: red,
                  radius: 4.5,
                ),
              ]),
            ),
          ],
        ),
        body: SafeArea(
          child: GridView.builder(
            itemCount: exploreService.length,
            padding: const EdgeInsets.only(left: size20,right: size10,top: size20,bottom: size10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: (size1/1.2),
                crossAxisSpacing: 20,mainAxisSpacing: 2
            ),
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return  Container(
                height: size90,//color: red,
                padding: const EdgeInsets.only(left: size5, right: size5, bottom: size5, top: 0),
                child: Column(
                  children: [
                    InkWell(
                      onTap: (){
                        Get.toNamed(ROUTE_BEAUTICIAN);
                      },
                      child: Container(
                        height: size89,
                        width: size89,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(size8),
                            boxShadow:  [
                              BoxShadow(
                                color: grey.withOpacity(0.4),
                                offset: const Offset(0.0, 2.0),
                                blurRadius: size5,
                              ),
                            ]
                        ),
                        child: exploreService[index]["name"] == "+3 More"
                            ?  Center(
                          child: Text(
                            exploreService[index]["name"].toString(),
                            textAlign:  TextAlign.center,
                            style: TextStyle(
                                fontSize: TextUtils.hintTextSize,
                                fontFamily: "Poppins",
                                color: blue1,
                                fontWeight: TextUtils.normalTextWeight
                            ),
                          ),) :
                        Container(
                          width: size10,height: size10,
                          margin: EdgeInsets.all(index == 0 ? size13 : size17),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image:  AssetImage(exploreService[index]["img"].toString(),),
                              )
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: size8,),
                    Visibility(
                      visible:  exploreService[index]["name"] == "+3 More" ? false : true,
                      child: Flexible(
                        child: Text(
                          exploreService[index]["name"].toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: TextUtils.hintTextSize,
                              fontFamily: "Poppins",
                              fontWeight: TextUtils.normalTextWeight,
                              color: black
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        )
    );
  }
}
