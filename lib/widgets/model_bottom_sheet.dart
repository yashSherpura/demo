import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nearme/utils/color_utils.dart';
import 'package:nearme/utils/screen_size.dart';
import 'package:nearme/utils/text_utils.dart';
import 'package:nearme/widgets/button.dart';

Widget chooseProducts(context){
  //print(size.height - 40);
  return InkWell(
    onTap: () {
      showModalBottomSheet<void>(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          // return Container(
          //   height: size.height - size40,
          //   decoration: const BoxDecoration(
          //       color:white,
          //       borderRadius: BorderRadius.only(topLeft: Radius.circular(size42),topRight:Radius.circular(size42) )
          //   ),
          //   child: Column(
          //     // mainAxisAlignment: MainAxisAlignment.start,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     // mainAxisSize: MainAxisSize.min,
          //     children: <Widget>[
          //       const SizedBox(height: size20,),
          //       Center(
          //         child: Container(
          //           width: size72,
          //           height: size5,
          //           decoration: BoxDecoration(
          //               color: grey,
          //               borderRadius: BorderRadius.circular(size10)
          //           ),
          //         ),
          //       ),
          //       const SizedBox(height: size20,),
          //       Padding(
          //         padding: const EdgeInsets.only(left: size30,right: size24),
          //         child: Row(
          //           children: [
          //             InkWell(
          //               onTap:(){
          //                 //setState(() {
          //                   Get.back();
          //                // });
          //               },
          //              child: Image.asset("assets/png_file/user_icons/close.png",width: size16,height: size16,)
          //             ),
          //             const SizedBox(width: size25,),
          //             Text("Choose Products",style: TextStyle(fontSize: TextUtils.headerTextSize,fontFamily: "Poppins",fontWeight: TextUtils.mediumtTextWeight),),
          //           ],
          //         ),
          //       ),
          //       const SizedBox(height: size10,),
          //       Container(
          //         height: 0.5,
          //         width: size.width,
          //         color: grey.withOpacity(0.2),
          //       ),
          //       Expanded(
          //         child: SingleChildScrollView(
          //           child: Column(
          //             children: [
          //                ChooseCard(Colors.brown,"assets/png_file/user_icons/king_brown.png","Basic Products","Free",0),
          //                ChooseCard(Colors.orange,"assets/png_file/user_icons/king_orange.png","Basic Products","+₹99",1),
          //                ChooseCard(Colors.green,"assets/png_file/user_icons/king_green.png","Basic Products","+₹199",2),
          //                ChooseCard(Colors.blueGrey,"assets/png_file/user_icons/king_blueGrey.png","Basic Products","+₹299",3),
          //               //listContainer(context,Colors.brown,"assets/png_file/user_icons/king_brown.png","Basic Products","Free",primaryColor,0),
          //               // const SizedBox(height: size20,),
          //               // listContainer(context,Colors.orange,"assets/png_file/user_icons/king_orange.png","Basic Products","+₹99",grey.withOpacity(0.4),1),
          //               // const SizedBox(height: size20,),
          //               // listContainer(context,green,"assets/png_file/user_icons/king_green.png","Basic Products","+₹199",grey.withOpacity(0.4),2),
          //               // const SizedBox(height: size20,),
          //               // listContainer(context,Colors.blueGrey,"assets/png_file/user_icons/king_blueGrey.png","Basic Products","+₹299",grey.withOpacity(0.4),3),
          //               // const SizedBox(height: size20,),
          //               moreScreen(context),
          //               const SizedBox(height: size20,),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // );
          return const ChooseProductsBottomSheet();
        },
      );
    },
    child:Container(
      height: size24,
      width: size65,
      decoration: BoxDecoration(
          color: grey3,
          borderRadius: const BorderRadius.all(Radius.circular(3)),
          border: Border.all(width: 1.0,color: grey.withOpacity(0.4))
      ),
      alignment: AlignmentDirectional.center,
      child:  Text(
          "Select",
          style: TextStyle(
              fontSize: TextUtils.smallTextSize,
              color: black,
              fontWeight: TextUtils.normalTextWeight,
              fontFamily: "Poppins"
          )
      ),
    ),
  );
}

class ChooseProductsBottomSheet extends StatefulWidget {
  const ChooseProductsBottomSheet({Key? key}) : super(key: key);

  @override
  _ChooseProductsBottomSheetState createState() => _ChooseProductsBottomSheetState();
}

class _ChooseProductsBottomSheetState extends State<ChooseProductsBottomSheet> {

  String? _groupValue;


  ValueChanged<String?> _valueChangedHandler() {
    return (value) => setState(() => _groupValue = value!);
  }

  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    return Container(
      height: size.height - size40,
      decoration: const BoxDecoration(
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
                borderRadius: BorderRadius.circular(size10),
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
                      //setState(() {
                      Get.back();
                      // });
                    },
                    child: Image.asset("assets/png_file/user_icons/close.png",width: size16,height: size16,)
                ),
                const SizedBox(width: size25,),
                Text("Choose Products",style: TextStyle(fontSize: TextUtils.headerTextSize,fontFamily: "Poppins",fontWeight: TextUtils.mediumtTextWeight),),
              ],
            ),
          ),
          const SizedBox(height: size10,),
          Container(
            height: 0.5,
            width: size.width,
            color: grey.withOpacity(0.2),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ChooseCard(Colors.brown,"assets/png_file/user_icons/king_brown.png","Basic Products","Free", MyRadioOption<String>(
                    value: '1',
                    groupValue: _groupValue,
                    onChanged: _valueChangedHandler(),

                  ),),
                  ChooseCard(Colors.orange,"assets/png_file/user_icons/king_orange.png","Basic Products","+₹99", MyRadioOption<String>(
                    value: '2',
                    groupValue: _groupValue,
                    onChanged: _valueChangedHandler(),

                  ),),
                  ChooseCard(Colors.green,"assets/png_file/user_icons/king_green.png","Basic Products","+₹199", MyRadioOption<String>(
                    value: '3',
                    groupValue: _groupValue,
                    onChanged: _valueChangedHandler(),

                  ),),
                  ChooseCard(Colors.blueGrey,"assets/png_file/user_icons/king_blueGrey.png","Basic Products","+₹299", MyRadioOption<String>(
                    value: '4',
                    groupValue: _groupValue,
                    onChanged: _valueChangedHandler(),

                  ),),
                  moreScreen(context),
                  const SizedBox(height: size20,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChooseCard extends StatefulWidget {
  Color color;String image;String title;String offer; Widget radio;
  ChooseCard(this.color, this.image, this.title, this.offer, this.radio,{Key? key}) : super(key: key);
  @override
  _ChooseCardState createState() => _ChooseCardState();
}
class _ChooseCardState extends State<ChooseCard> {
  int select = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  String? _groupValue;


  ValueChanged<String?> _valueChangedHandler() {
    return (value) => setState(() => _groupValue = value!);
  }

  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: size20),
      child: InkWell(
        child: Container(
          // margin: EdgeInsets.only(top: 10),
          height: size.height/size6 + size7,
          //width: size.width/1.19+1,
          margin: const EdgeInsets.symmetric(horizontal: size24),
          decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(size5),
              border: Border.all(width: 1,color: grey.withOpacity(0.2)),
              boxShadow:  [BoxShadow(
                  color: grey.withOpacity(0.2),
                  offset: const Offset(-1.0,2.0),
                  blurRadius: size5,
                  spreadRadius: 1
              )]
          ),
          child:  Padding(
            padding: const EdgeInsets.only(top: size15,left: size20),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: widget.color.withOpacity(0.2),
                  maxRadius: size18,
                  child: Image.asset(widget.image,height: size20,width: size20,),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: size15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.title,style: TextStyle(
                          fontSize: TextUtils.commonTextSize,
                          fontFamily: "Poppins",
                          fontWeight: TextUtils.mediumtTextWeight
                      ),),
                      const SizedBox(height: size5,),
                      RichText(
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          text:  TextSpan(
                              style: TextStyle(fontSize: TextUtils.smallTextSize,color: black),
                              children:  [
                                TextSpan(
                                    text: "Contains products like acure,\npantene, fructis and",
                                    style: TextStyle(
                                        color: grey,
                                        fontSize: TextUtils.smallTextSize,
                                        fontFamily: "Poppins",
                                        fontWeight: TextUtils.normalTextWeight
                                    )
                                ),
                                TextSpan(text: " more",style: TextStyle(
                                    color: primaryColor,
                                    fontSize: TextUtils.smallTextSize,
                                    fontFamily: "Poppins",
                                    fontWeight: TextUtils.normalTextWeight
                                ))
                              ]
                          )
                      ),
                      const SizedBox(height: size10,),
                      Container(
                        height: size19,
                        width: size42,
                        decoration: BoxDecoration(
                            color: grey3,
                            borderRadius: BorderRadius.circular(2)
                        ),
                        child: Center(
                          child: Text(widget.offer,style: TextStyle(
                              color: green,
                              fontSize: TextUtils.smallTextSize,
                              fontFamily: "Poppins",
                              fontWeight: TextUtils.normalTextWeight
                          ),),
                        ),
                      )
                    ],
                  ),
                ),

                const Spacer(),

                Container(
                    child: widget.radio
                ),
                // MyRadioOption<String>(
                //   value: '1',
                //   groupValue: _groupValue,
                //   onChanged: _valueChangedHandler(),
                //
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// class ChooseCard extends StatefulWidget {
//   Color color;String image;String title;String offer;int index;
//    ChooseCard(this.color, this.image, this.title, this.offer, this.index, {Key? key}) : super(key: key);
//   @override
//   _ChooseCardState createState() => _ChooseCardState();
// }
// class _ChooseCardState extends State<ChooseCard> {
//   int select = 0;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     final size= MediaQuery.of(context).size;
//     return Padding(
//       padding: const EdgeInsets.only(bottom: size20),
//       child: InkWell(
//         onTap: (){
//           setState(() {
//               select = widget.index;
//           });
//         },
//         child: Container(
//           // margin: EdgeInsets.only(top: 10),
//           height: size.height/size6 + size7,
//           //width: size.width/1.19+1,
//           margin: const EdgeInsets.symmetric(horizontal: size24),
//           decoration: BoxDecoration(
//               color: white,
//               borderRadius: BorderRadius.circular(size5),
//               border: Border.all(width: 1,color: grey.withOpacity(0.2)),
//               boxShadow:  [BoxShadow(
//                   color: grey.withOpacity(0.2),
//                   offset: const Offset(-1.0,2.0),
//                   blurRadius: size5,
//                   spreadRadius: 1
//               )]
//           ),
//           child:  Padding(
//             padding: const EdgeInsets.only(top: size15,left: size20),
//             child: Row(
//               //mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 CircleAvatar(
//                   backgroundColor: widget.color.withOpacity(0.2),
//                   maxRadius: size18,
//                   child: Image.asset(widget.image,height: size20,width: size20,),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: size15),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(widget.title,style: TextStyle(
//                           fontSize: TextUtils.commonTextSize,
//                           fontFamily: "Poppins",
//                           fontWeight: TextUtils.mediumtTextWeight
//                       ),),
//                       const SizedBox(height: size5,),
//                       RichText(
//                           maxLines: 3,
//                           overflow: TextOverflow.ellipsis,
//                           textAlign: TextAlign.start,
//                           text:  TextSpan(
//                               style: TextStyle(fontSize: TextUtils.smallTextSize,color: black),
//                               children:  [
//                                 TextSpan(
//                                     text: "Contains products like acure,\npantene, fructis and",
//                                     style: TextStyle(
//                                         color: grey,
//                                         fontSize: TextUtils.smallTextSize,
//                                         fontFamily: "Poppins",
//                                         fontWeight: TextUtils.normalTextWeight
//                                     )
//                                 ),
//                                 TextSpan(text: " more",style: TextStyle(
//                                     color: primaryColor,
//                                     fontSize: TextUtils.smallTextSize,
//                                     fontFamily: "Poppins",
//                                     fontWeight: TextUtils.normalTextWeight
//                                 ))
//                               ]
//                           )
//                       ),
//                       const SizedBox(height: size10,),
//                       Container(
//                         height: size19,
//                         width: size42,
//                         decoration: BoxDecoration(
//                             color: grey3,
//                             borderRadius: BorderRadius.circular(2)
//                         ),
//                         child: Center(
//                           child: Text(widget.offer,style: TextStyle(
//                               color: green,
//                               fontSize: TextUtils.smallTextSize,
//                               fontFamily: "Poppins",
//                               fontWeight: TextUtils.normalTextWeight
//                           ),),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 const Spacer(),
//                 Padding(
//                   padding: const EdgeInsets.only(right: size20,top: size15),
//                   child: Container(
//                     height: size24,
//                     width: size24,
//                     decoration:  BoxDecoration(
//                         color: widget.index == select ? primaryColor : grey.withOpacity(0.4),
//                         shape: BoxShape.circle
//                     ),
//                     child: const Icon(Icons.done,color: white,size: size15,),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

Widget moreScreen(context){
  final size= MediaQuery.of(context).size;
  //print("container :- ${size.width/1.19+1}");
  return  Padding(
    padding: const EdgeInsets.only(left: size45,right: size45,),
    child: ButtonField(
      press: (){
        showModalBottomSheet<void>(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (BuildContext context) {
            return Container(
              decoration: const BoxDecoration(
                  color: white,
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
                    padding: const EdgeInsets.only(left: size32,right: size24),
                    child: Row(
                      children: [
                        InkWell(
                            onTap:(){
                              //setState(() {
                              Get.back();
                              // });
                            },
                            child: Image.asset("assets/png_file/user_icons/close.png",width: size16,height: size16,)
                        ),
                        const SizedBox(width: size25,),
                        Text("Basic product list",style: TextStyle(fontSize: TextUtils.headerTextSize,fontFamily: "Poppins",fontWeight: TextUtils.mediumtTextWeight),),
                      ],
                    ),
                  ),
                  const SizedBox(height: size5,),
                  const Divider(
                    thickness: 0.5,height: 5,
                  ),
                  Container(
                    height: size36,
                    width: size.width,
                    color: orange.withOpacity(0.2),
                    child: Center(
                      child: Text("This basic product list is free",style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: TextUtils.smallTextSize,
                          color: orange,
                          fontWeight: TextUtils.normalTextWeight
                      ),),
                    ),
                  ),
                  moreScreenBottomSheet("Lorial peris"),
                  moreScreenBottomSheet("Lakeme hair color ammonium pure black"),
                  moreScreenBottomSheet("Streax brown hair color"),
                ],
              ),
            );
          },
        );
      },
      color: primaryColor,
      text:"Proceed",
    ),
  );
}

Widget moreScreenBottomSheet(title){
  return  Padding(
    padding: const EdgeInsets.only(left: size30,right: size30,top: size20),
    child: Stack(
      children: [
        Container(
          height: size24,
          width: size24,
          margin: const EdgeInsets.only(top: size3),
          decoration: const BoxDecoration(
              color: green,
              shape: BoxShape.circle
          ),
          child: const Icon(Icons.done,color: white,size: size15,),
        ),
        //const SizedBox(width: size10),
        Padding(
          padding: const EdgeInsets.only(left: size40),
          child: Text(title,
            style:  TextStyle(
                fontSize: TextUtils.commonTextSize,
                fontFamily: "Poppins",
                color: grey,
                fontWeight: TextUtils.normalTextWeight
            ),
            //textAlign: TextAlign.justify,
          ),
        ),
      ],
    ),
  );
}

class MyRadioOption<T> extends StatelessWidget {

  final T value;
  final T? groupValue;
  //final String label;
  //final String text;
  final ValueChanged<T?> onChanged;

  const MyRadioOption({
    required this.value,
    required this.groupValue,
    //  required this.label,
    //  required this.text,
    required this.onChanged,
  });

  Widget _buildLabel() {
    final bool isSelected = value == groupValue;

    return   Padding(
      padding: const EdgeInsets.only(right: size20,top: size15),
      child: Container(
        height: size24,
        width: size24,
        decoration:  BoxDecoration(
          // color: widget.index == select ? primaryColor : grey.withOpacity(0.4),
            color:   isSelected ? primaryColor : grey.withOpacity(0.4),
            shape: BoxShape.circle
        ),
        child: const Icon(Icons.done,color: white,size: size15,),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(value),
      splashColor: Colors.cyan.withOpacity(0.5),
      child: _buildLabel(),
    );
  }
}