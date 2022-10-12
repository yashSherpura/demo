import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nearme/controller/near_by_beautician_controller.dart';
import 'package:nearme/utils/color_utils.dart';
import 'package:nearme/utils/image_url.dart';
import 'package:nearme/utils/screen_size.dart';
import 'package:nearme/utils/text_utils.dart';

class NearByBeauticians extends StatefulWidget {
  const NearByBeauticians({Key? key}) : super(key: key);

  @override
  _NearByBeauticiansState createState() => _NearByBeauticiansState();
}

class _NearByBeauticiansState extends State<NearByBeauticians> {

  var nearByBeauticianController = Get.put(NearByBeauticianController());

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
              padding: const EdgeInsets.all(15.0),
              child: Image.asset(
                leftIcon,
              ),
            )),
        title: Text(
          "Nearby Beauticians",
          style: TextStyle(
              color: black,
              fontSize: TextUtils.headerTextSize,
              fontWeight: TextUtils.normalTextWeight,
              fontFamily: "Poppins"),
        ),
        actions: [
          Padding(
              padding:  const EdgeInsets.only(right: size20),
              child: Image.asset("assets/png_file/beautician_image/icon_search.png",width: size20,height: size20,color: black,)
          ),
        ],
        centerTitle: false,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: nearbyBeauticians.length,
          padding: const EdgeInsets.symmetric(horizontal: size20,vertical: size10),
          itemBuilder: (context, index) {
            var data = nearbyBeauticians[index];
            return _nearbyBeauticiansContainer(data);
          }),

    );
  }

  Widget _nearbyBeauticiansContainer(Map<String, Object> data) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20,),
      child: Container(
        height: size72,
        width: size327,
        padding: const EdgeInsets.symmetric(horizontal: size10,),
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
                  padding: const EdgeInsets.only(left: size16, right: size16, top: size8),
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
                  padding: const EdgeInsets.only(left: size16, right: 0.0, top: size4),
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

                      Image.asset("assets/png_file/beautician_image/like.png",height: size20,),


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
                  borderRadius: const BorderRadius.all(Radius.circular(size5))
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
