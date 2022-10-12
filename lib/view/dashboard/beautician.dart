import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nearme/controller/beautician_controller.dart';
import 'package:nearme/utils/color_utils.dart';
import 'package:nearme/utils/constant.dart';
import 'package:nearme/utils/image_url.dart';
import 'package:nearme/utils/screen_size.dart';
import 'package:nearme/utils/text_utils.dart';

class Beautician extends StatefulWidget {
  const Beautician({Key? key}) : super(key: key);

  @override
  _BeauticianState createState() => _BeauticianState();
}

class _BeauticianState extends State<Beautician> {
  var beauticianController = Get.put(BeauticianController());

  var beauticianPackages = [
    {
      "bgimg": "assets/png_file/beautician_image/beauticianPackages1.png",
      "name": "Engagement managment",
      "rs": "2999"
    },
    {
      "bgimg": "assets/png_file/beautician_image/beauticianPackages3.png",
      "name": "Saree drape",
      "rs": "2999"
    },
    {
      "bgimg": "assets/png_file/beautician_image/beauticianPackages2.png",
      "name": "Honey",
      "rs": "2999"
    },
  ];

  var nearbyBeauticians = [
    {
      "image": "assets/png_file/beautician_image/nearbyBeauticians1.png",
      "name": "Anusha Patel",
      "kms": "6kms",
      "per": "95%",
      "reviews": "5 reviews"
    },
    {
      "image": "assets/png_file/beautician_image/nearbyBeauticians2.png",
      "name": "Priyanka reddy",
      "kms": "3kms",
      "per": "80%",
      "reviews": "27 reviews"
    },
  ];

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
          "Beautician",
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
      body: ListView(
        children: [
          Container(
            height: size50,
            width: size.width,
            color: grey.withOpacity(0.1),
            child: Row(
              children: [
                const SizedBox(
                  width: size16,
                ),
                CircleAvatar(
                    radius: size16,
                    backgroundColor: white,
                    child: SvgPicture.asset(
                      "assets/svg_file/location.svg",
                      height: size20,
                    )),
                const SizedBox(
                  width: size16,
                ),
                Text(
                  "BTM Layout, Banglore",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: TextUtils.hintTextSize,
                      fontWeight: TextUtils.normalTextWeight),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Change",
                    style: TextStyle(
                        color: blue,
                        fontFamily: "Poppins",
                        fontSize: TextUtils.hintTextSize,
                        fontWeight: TextUtils.normalTextWeight),
                  ),
                ),
                const SizedBox(
                  width: size16,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: size16, right: 0.0, top: size16, bottom: size16),
            child: Text(
              "Which category you want to choose?",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: size21,
                fontWeight: TextUtils.titleTextWeight,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              wantToChoose("assets/png_file/beautician_image/sareeDrape.png",
                  "Saree drape"),
              wantToChoose(
                  "assets/png_file/beautician_image/makeUp.png", "Saree drape"),
              wantToChoose("assets/png_file/beautician_image/hairStyling.png",
                  "Saree drape"),
            ],
          ),
          titleViewAll("Top Beautician packages", () {}),
          Padding(
            padding: const EdgeInsets.only(left: size10,top: size10),
            child: SizedBox(
              height: size240,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: beauticianPackages.length,
                  itemBuilder: (context, index) {
                    var data = beauticianPackages[index];
                    return topBeauticianPackages(data);
                  }),
            ),
          ),
          titleViewAll("Nearby Beauticians", () {
            Get.toNamed(ROUTE_NEAR_BY_BEAUTICIAN);
          }),
          const SizedBox(
            height: size20,
          ),
          SizedBox(
            height: size260,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 2,
                padding: const EdgeInsets.symmetric(
                  horizontal: size20,
                ),
                itemBuilder: (context, index) {
                  var data = nearbyBeauticians[index];
                  return _nearbyBeauticiansContainer(data);
                }),
          ),
        ],
      ),
    );
  }

  Widget wantToChoose(String img, txt) {
    return Column(
      children: [
        Container(
          height: size80,
          width: size75,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size8),
              color: white,
              boxShadow: [
                BoxShadow(
                    color: grey.withOpacity(0.4),
                    spreadRadius: 0.50,
                    blurRadius: 2.0),
              ]),
          child: Padding(
            padding: const EdgeInsets.all(size10),
            child: Image.asset(
              img,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: size16, right: size16, top: size16),
          child: Text(
            txt,
            style: TextStyle(
              fontFamily: "Poppins",
              color: grey,
              fontSize: TextUtils.smallTextSize,
              fontWeight: TextUtils.mediumtTextWeight,
            ),
          ),
        ),
      ],
    );
  }

  Widget titleViewAll(String txt, var ontab) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: size16, right: size16, top: size16),
          child: Text(
            txt,
            style: TextStyle(
              color: primaryColor,
              fontFamily: "Poppins",
              fontSize: TextUtils.commonTextSize,
              fontWeight: TextUtils.mediumtTextWeight,
            ),
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(left: size16, right: size24, top: size16),
          child: InkWell(
            onTap: ontab,
            child: Text(
              "view all",
              style: TextStyle(
                  color: grey.withOpacity(0.5),
                  fontFamily: "Poppins",
                  fontSize: TextUtils.smallTextSize,
                  fontWeight: TextUtils.headerTextWeight,
                  decoration: TextDecoration.underline),
            ),
          ),
        ),
      ],
    );
  }

  Widget topBeauticianPackages(Map<String, Object> data) {
    return Padding(
      padding: const EdgeInsets.all(size8),
      child: Container(
        height: size160,
        width: size160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size8),
          image: DecorationImage(
              image: AssetImage(data["bgimg"].toString()), fit: BoxFit.fill),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
              const EdgeInsets.only(left: size6, right: size6, top: size2, bottom: size2),
              child: Text(
                data["name"].toString(),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  color: white,
                  fontFamily: "Poppins",
                  fontSize: TextUtils.hintTextSize,
                  fontWeight: TextUtils.mediumtTextWeight,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: size6, right: size6, top: size6, bottom: size16),
              child: Text(
                "₹${data["rs"].toString()} onWards",
                style: TextStyle(
                  color: white,
                  fontFamily: "Poppins",
                  fontSize: TextUtils.smallTextSize,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _nearbyBeauticiansContainer(Map<String, Object> data) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: size20,
      ),
      child: Container(
        height: size90,
        width: size170,
        padding: const EdgeInsets.symmetric(
          horizontal: size10,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size8),
            color: white,
            boxShadow: [
              BoxShadow(
                  color: grey.withOpacity(0.4),
                  spreadRadius: 0.50,
                  blurRadius: 2.0),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: size50,
              width: size50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size8),
                color: white,
                image: DecorationImage(
                    image: AssetImage(data["image"].toString()),
                    fit: BoxFit.fill),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                  const EdgeInsets.only(left: size16, right: size16, top: size14),
                  child: Text(
                    data["name"].toString(),
                    style: TextStyle(
                      fontFamily: "Poppins",
                      color: black,
                      fontSize: TextUtils.hintTextSize,
                      fontWeight: TextUtils.mediumtTextWeight,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: size16, right: 0.0, top: size10),
                  child:
                  Row(
                    children: [
                      Text(
                        "${data["kms"]} away. ",
                        style: TextStyle(
                          color: grey,
                          fontFamily: "Poppins",
                          fontSize: TextUtils.smallTextSize,
                          fontWeight: TextUtils.normalTextWeight,
                        ),
                      ),
                      Image.asset(
                        "assets/png_file/beautician_image/like.png",
                        height: size20,
                      ),
                      Text(
                        " ${data["per"]} (${data["reviews"]})",
                        style: TextStyle(
                          color: grey,
                          fontFamily: "Poppins",
                          fontSize: TextUtils.smallTextSize,
                          fontWeight: TextUtils.normalTextWeight,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              width: size24,height: size24,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                  color: grey.withOpacity(0.2),
                  borderRadius: const BorderRadius.all(Radius.circular(5))
              ),
              //padding: const EdgeInsets.symmetric(horizontal: size8,vertical: size5),
              child: const Icon(Icons.arrow_forward_ios,size: size18,),
            )
          ],
        ),
      ),
    );
  }
}
