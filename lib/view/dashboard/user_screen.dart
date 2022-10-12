import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nearme/utils/color_utils.dart';
import 'package:nearme/utils/image_url.dart';
import 'package:nearme/utils/screen_size.dart';
import 'package:nearme/utils/text_utils.dart';
import 'package:nearme/view/sortFilter/sort_filter_screen.dart';
import 'package:nearme/widgets/model_bottom_sheet.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {

  int index = 0;

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
          "Anusha patel",
          style: TextStyle(
              color: black,
              fontSize: TextUtils.headerTextSize,
              fontWeight: TextUtils.normalTextWeight,
              fontFamily: "Poppins"),
        ),
        centerTitle: false,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: white,
      body: SafeArea(
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.only(left: size20,right: size20,top: size20),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      height: size90,width: size77,
                      alignment: AlignmentDirectional.center,
                      decoration: const BoxDecoration(
                          color: black,
                          borderRadius: BorderRadius.all(Radius.circular(size5)),
                          image: DecorationImage(
                              image: AssetImage("assets/png_file/user_icons/image_0.png")
                          )
                      ),
                    ),
                    const SizedBox(width: size20,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "Anusha Patel",
                            style: TextStyle(
                                fontSize: size21,
                                color: black,
                                fontWeight: TextUtils.mediumtTextWeight,
                                fontFamily: "Poppins"
                            )
                        ),
                        const SizedBox(height: size10,),
                        Text(
                            "6 kms away",
                            style: TextStyle(
                                fontSize: size15,
                                color: grey,
                                fontWeight: TextUtils.normalTextWeight,
                                fontFamily: "Poppins"
                            )
                        ),
                        const SizedBox(height: size10,),
                        Row(
                          children:  [
                            Image.asset("assets/png_file/user_icons/like.png",height: size16,width: size16,),
                            const SizedBox(width: size5),
                            Text(
                                "95% ",
                                style: TextStyle(
                                    fontSize: TextUtils.smallTextSize,
                                    color: grey,
                                    fontWeight: TextUtils.normalTextWeight,
                                    fontFamily: "Poppins"
                                )
                            ),
                            Text(
                                "(",
                                style: TextStyle(
                                    fontSize: TextUtils.smallTextSize,
                                    color: grey,
                                    fontWeight: TextUtils.normalTextWeight,
                                    fontFamily: "Poppins"
                                )
                            ),
                            reviewFilter(),
                            Text(
                                ")",
                                style: TextStyle(
                                    fontSize: TextUtils.smallTextSize,
                                    color: grey,
                                    fontWeight: TextUtils.normalTextWeight,
                                    fontFamily: "Poppins"
                                )
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/png_file/user_icons/facebook.png",height: size24,width: size24,),
                    const SizedBox(height: size20,),
                    Image.asset("assets/png_file/user_icons/insta.png",height: size24,width: size24,),
                  ],
                )
              ],
            ),
            const SizedBox(height: size20),
            Row(
              children: [
                tabButton("Individual",0),
                const SizedBox(width: size10),
                tabButton("Packeges",1),
              ],
            ),
            const SizedBox(height: size20),
            Text(
                "5 services found",
                style: TextStyle(
                    fontSize: size13,
                    color: blue,
                    fontWeight: TextUtils.normalTextWeight,
                    fontFamily: "Poppins"
                )
            ),
            Padding(
              padding: const EdgeInsets.only(top: size10),
              child: Wrap(
                //mainAxisAlignment: MainAxisAlignment.start,
                runSpacing: size5,
                children: [
                  selectedFilterItem("Price (low to high)"),
                  const SizedBox(width: size10),
                  selectedFilterItem("Price (high to low)"),
                ],
              ),
            ),
            const SizedBox(height: size20),
            productItem("Saree drape","30","assets/png_file/user_icons/image_1.png"),
            productItem("Makeup","65","assets/png_file/user_icons/image_2.png"),
            productItem("Hair straightening","30","assets/png_file/user_icons/image_3.png"),
          ],
        ),
      ),
      bottomNavigationBar: const SortFilter(),
    );

  }

  Widget selectedFilterItem(title){
    final size = MediaQuery.of(context).size;
    return Container(
      height: size27,//size.height/23,
      width: size160,//size.width/2.5+6,
      decoration:  BoxDecoration(
          color: grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(size30),
          border: Border.all(width: size1,color: grey.withOpacity(0.3))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //const Spacer(),
          Container(
            height: size12,
            width: size12,
            decoration: const BoxDecoration(
                color: grey,
                shape: BoxShape.circle
            ),
            child: const Icon(Icons.done,color: white,size: size12,),
          ),
          // const Spacer(),
          Text(title,
              style: TextStyle(
                  fontSize: TextUtils.smallTextSize,
                  color: grey,
                  fontFamily: "Poppins",
                  fontWeight: TextUtils.normalTextWeight)
          ),
          //const Spacer(),
          const Icon(Icons.close,size: size15,color: grey,),
          //const Spacer(),
        ],
      ),
    );
  }

  Widget reviewFilter(){
    final size= MediaQuery.of(context).size.height;

    return InkWell(
      onTap: () {
        showModalBottomSheet<void>(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (BuildContext context) {
            return SafeArea(
              child: Container(
                height: size - size40,
                decoration:  const BoxDecoration(
                    color:white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(size42),topRight:Radius.circular(size42) )
                ),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const SizedBox(height: size20,),
                    Center(
                      child: Container(
                        width: size72,
                        height: size5,
                        decoration: BoxDecoration(
                            color: grey,
                            borderRadius: BorderRadius.circular(size10)
                        ),
                      ),
                    ),
                    const SizedBox(height: size20,),
                    Padding(
                      padding: const EdgeInsets.only(left: size30,right: size24),
                      child: Row(
                        children: [
                          InkWell(
                              onTap:(){
                                setState(() {
                                  Get.back();
                                });
                              },
                              child: Image.asset("assets/png_file/user_icons/close.png",width: size16,height: size16,)
                          ),
                          const SizedBox(width: size25,),
                          Text(
                            "Reviews",
                            style: TextStyle(fontSize: TextUtils.headerTextSize,fontFamily: "Poppins",fontWeight: TextUtils.mediumtTextWeight),),
                        ],
                      ),
                    ),
                    const SizedBox(height: size5,),
                    const Divider(
                      thickness: 1,
                    ),
                    // SizedBox(height: 25,),
                    Expanded(
                      child: ListView.builder(
                          itemCount: 6,
                          itemBuilder: (context,i){
                            return Padding(
                              padding: const EdgeInsets.only(left: size32,right: size32,top: size20,),
                              child: Container(
                                height: size119,
                                width: size303,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(size5),
                                    border: Border.all(width: 1,color: grey.withOpacity(0.3))
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: size10,right: size20,left: size20),
                                  child: Column(
                                    children: [
                                      Text('"On time, professional driving, neat and tidy,comfortable ride and well behaved driver."',
                                        style: TextStyle(
                                            fontSize: TextUtils.smallTextSize,
                                            color: grey,
                                            fontWeight: TextUtils.normalTextWeight,
                                            fontFamily: "Poppins"
                                        ),
                                      ),
                                      const Spacer(),
                                      Row(
                                        children: [
                                          Image.asset("assets/png_file/user_icons/review.png",),
                                          const Spacer(),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Rajeev tumapalli",
                                                  style: TextStyle(
                                                      fontSize: TextUtils.smallTextSize,
                                                      fontWeight: TextUtils.normalTextWeight,
                                                      fontFamily: "Poppins",
                                                      color: bottomBarBorder
                                                  )),
                                              Text("Customer",
                                                  style: TextStyle(
                                                      fontSize: size10,
                                                      fontWeight: TextUtils.normalTextWeight,
                                                      fontFamily: "Poppins",
                                                      color: grey
                                                  ))
                                            ],
                                          ),
                                          const Spacer(),
                                          Image.asset("assets/png_file/user_icons/reviewProfile.png",)
                                        ],
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Text(
          "5 reviews",
          style: TextStyle(
              fontSize: TextUtils.smallTextSize,
              color: blue,
              fontWeight: TextUtils.normalTextWeight,
              fontFamily: "Poppins",
              decoration: TextDecoration.underline
          )
      ),
    );
  }

  Widget tabButton(String title, int active){
    return InkWell(
      onTap: (){
        setState(() {
          index = active;
          print(active);
        });
      },
      child: Container(
        width: size91,height: size26,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
            color: active==index ? blue : white,
            borderRadius: const BorderRadius.all(Radius.circular(size30)),
            border: Border.all(color: active==index ? blue : grey,width: size1)
        ),
        child: Text(
            title,
            style: TextStyle(
                fontSize: TextUtils.smallTextSize,
                color: active==index ? white : grey,
                fontWeight: TextUtils.normalTextWeight,
                fontFamily: "Poppins"
            )
        ),
      ),
    );
  }

  Widget productItem(String name, String mins, String image){
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: white,
              boxShadow: [
                BoxShadow(
                    color: grey.withOpacity(0.2),
                    spreadRadius: 0.2,
                    blurRadius: 0.5,
                    offset:  const Offset(
                        0.0,0.5
                    )
                )
              ]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Image.asset(image,height: size151,width: size107,fit: BoxFit.cover,),
                    const SizedBox(width: size10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                name.toString(),
                                style: TextStyle(
                                    fontSize: TextUtils.hintTextSize,
                                    color: black,
                                    fontWeight: TextUtils.mediumtTextWeight,
                                    fontFamily: "Poppins"
                                )
                            ),
                            const SizedBox(width: size50),
                            const SizedBox(height: size10),
                            Text(
                                "$mins mins",
                                style: TextStyle(
                                    fontSize: TextUtils.smallTextSize,
                                    color: black,
                                    fontWeight: TextUtils.normalTextWeight,
                                    fontFamily: "Poppins"
                                )
                            ),
                            const SizedBox(height: size20),
                            FittedBox(
                              child: SizedBox(
                                width: size120,
                                child: Text(
                                    "Includes honey waxing, regular honey wax will be used",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: size10,color: grey,fontWeight: TextUtils.normalTextWeight,fontFamily: "Poppins"
                                    )
                                ),
                              ),
                            ),
                            const SizedBox(height: size20),
                            Text(
                                "\$999 onwards",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: TextUtils.smallTextSize,
                                    color: green,
                                    fontWeight: TextUtils.normalTextWeight,
                                    fontFamily: "Poppins"
                                )
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: size151,
                //color: red,
                padding: const EdgeInsets.only(right: size10,top: size10,bottom: size5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: size5),
                      child: Image.asset("assets/png_file/user_icons/heart.png",width: size24,height: size24,),
                    ),
                    chooseProducts(context),
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: size20),
      ],
    );
  }
}
