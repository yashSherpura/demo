import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nearme/controller/sort_filter_controller.dart';
import 'package:nearme/utils/color_utils.dart';
import 'package:nearme/utils/screen_size.dart';
import 'package:nearme/utils/text_utils.dart';
import 'package:nearme/widgets/button.dart';

class SortFilter extends StatefulWidget {
  const SortFilter({Key? key}) : super(key: key);

  @override
  _SortFilterState createState() => _SortFilterState();
}

class _SortFilterState extends State<SortFilter> {
  final sortFilterController = Get.put(SortFilterController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: size45,
        decoration: BoxDecoration(
          // color: red,
            border: Border(top: BorderSide(width: 1.5, color: bottomBarBorder.withOpacity(0.5)))),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: sorting(),
            ),
            VerticalDivider(
              color: bottomBarBorder.withOpacity(0.5),
              thickness: 1.5,width: 0,
            ),
            Expanded(
              child: filtering(),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomBar(image, title) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          height: size24,
        ),
        const SizedBox(
          width: size8,
        ),
        Text(
          title,
          style: TextStyle(
              fontSize: TextUtils.commonTextSize,
              fontWeight: TextUtils.normalTextWeight,
              fontFamily: "Poppins"),
        )
      ],
    );
  }

  Widget sorting(){
    return  InkWell(
        onTap: () {
          showModalBottomSheet<void>(
            backgroundColor: Colors.transparent,
            context: context,
            builder: (BuildContext context) {
              return Container(
                decoration: const BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(size42),topRight:Radius.circular(size42) )
                ),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                              Text("Sorting",style: TextStyle(fontSize: TextUtils.headerTextSize,fontFamily: "Poppins",fontWeight: TextUtils.mediumtTextWeight),),
                              const Spacer(),
                              Text("clear all",style: TextStyle(fontSize: TextUtils.smallTextSize,fontFamily: "Poppins",color: grey.withOpacity(0.4)))
                            ],
                          ),
                        ),
                        const SizedBox(height: size5,),
                        const Divider(
                          thickness: 1,
                        ),
                        const SizedBox(height: size25,),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: size80),
                      child: ListView(
                        padding: const EdgeInsets.only(top: size20),
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(sortFilterController.order.length, (index) {
                              return  OrderSortRadio(index, sortFilterController.order[index]);
                            }),
                          ),
                          // OrderSortRadio(0, "Price (low to high)"),
                          // OrderSortRadio(1, "Price (high to low)"),
                          // OrderSortRadio(2, "option 3"),
                          // OrderSortRadio(3, "option 4"),
                          Padding(
                            padding: const EdgeInsets.only(left: size50,right: size50,top: size30),
                            child: ButtonField(
                              color: blue,
                              press: (){},
                              text: "Apply Sort",
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: SizedBox(height: size45,child: bottomBar("assets/png_file/user_icons/sort.png", "Sort"))
    );
  }

  // Widget orderSortRadio(BuildContext context, int btnIndex, String title) {
  //   final sortFilterController = Get.put(SortFilterController());
  //   return Padding(
  //     padding: const EdgeInsets.only(left:size20, right: size20),
  //     child: InkWell(
  //       onTap: (){
  //         setState(() {
  //           sortFilterController.orderButtonClick(sortFilterController.order[btnIndex]);
  //         });
  //       },
  //       child: Wrap(
  //         crossAxisAlignment: WrapCrossAlignment.center,
  //         children: <Widget>[
  //           Radio(
  //               materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  //               value: sortFilterController.order[btnIndex],
  //               groupValue: sortFilterController.orderSelect,
  //               onChanged: (value) {
  //                 setState(() {
  //                   sortFilterController.orderButtonClick(value);
  //                   sortFilterController.update();
  //                 });
  //               }
  //           ),
  //           Text(title,
  //               style: TextStyle(
  //                   fontSize: TextUtils.hintTextSize,
  //                   color: grey,
  //                   fontFamily: "Poppins",
  //                   fontWeight: TextUtils.normalTextWeight))
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget filtering(){
    return  InkWell(
      onTap: () {
        showModalBottomSheet<void>(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (BuildContext context) {
            return StatefulBuilder(
                builder: (context,StateSetter setModelState) {
                  return Container(
                    decoration: const BoxDecoration(
                        color:white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(size42),topRight:Radius.circular(size42) )
                    ),
                    child: Stack(
                      children: [
                        Column(
                          children: [
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
                                        setModelState(() {
                                          Get.back();
                                        });
                                      },
                                      child: Image.asset("assets/png_file/user_icons/close.png",width: size16,height: size16,)
                                  ),
                                  const SizedBox(width: size25,),
                                  Text("Filtering",style: TextStyle(fontSize: TextUtils.headerTextSize,fontFamily: "Poppins",fontWeight: TextUtils.mediumtTextWeight),),
                                  const Spacer(),
                                  Text("clear all",style: TextStyle(fontSize: TextUtils.smallTextSize,fontFamily: "Poppins",color: grey.withOpacity(0.4)))
                                ],
                              ),
                            ),
                            const SizedBox(height: size5,),
                            const Divider(
                              thickness: 1,
                            ),
                            const SizedBox(height: size25,),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: size80),
                          child: ListView(
                            padding: const EdgeInsets.only(top: size20),
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(sortFilterController.filterOrder.length, (index){
                                  return OrderFilterRadio(index, sortFilterController.filterOrder[index]);
                                }),
                              ),
                              // orderFilterRadio(context, 0, "Less than 30 minutes"),
                              // orderFilterRadio(context, 1, "option 2"),
                              // orderFilterRadio(context, 2, "option 3"),
                              // orderFilterRadio(context, 3, "option 4"),

                              Padding(
                                padding: const EdgeInsets.only(left: size50,right: size50,top: size30),
                                child: ButtonField(
                                  color: blue,
                                  press: (){
                                    //reviewFilter();
                                  },
                                  text: "Apply filters",
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }
            );
          },
        );
      },
      child: SizedBox(height: size45,child: bottomBar("assets/png_file/user_icons/filter.png", "Filter")),
    );
  }

  Widget orderFilterRadio(BuildContext context, int btnIndex, String title) {
    return Padding(
      padding: const EdgeInsets.only(left:20.0, right: 20.0),
      child: InkWell(
        onTap: (){
          setState(() {
            sortFilterController.filterOrderButtonClick(sortFilterController.filterOrder[btnIndex]);
          });
        },
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: <Widget>[
            Radio(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: sortFilterController.filterOrder[btnIndex],
                groupValue: sortFilterController.filterOrderSelect,toggleable: true,
                onChanged: (value) {
                  sortFilterController.filterOrderButtonClick(value);
                  sortFilterController.update();
                }
            ),
            Text(title,
                style: TextStyle(
                    fontSize: TextUtils.hintTextSize,
                    color: grey,
                    fontWeight: TextUtils.normalTextWeight,
                    fontFamily: "Poppins"
                ))
          ],
        ),
      ),
    );
  }
}

class OrderSortRadio extends StatefulWidget {
  int i;String title;
  OrderSortRadio(this.i, this.title, {Key? key} ) : super(key: key);

  @override
  _OrderSortRadioState createState() => _OrderSortRadioState();
}
class _OrderSortRadioState extends State<OrderSortRadio> {
  @override
  Widget build(BuildContext context) {
    final sortFilterController = Get.put(SortFilterController());
    return Padding(
      padding: const EdgeInsets.only(left:size20, right: size20),
      child: InkWell(
        onTap: (){
          setState(() {
            sortFilterController.orderButtonClick(sortFilterController.order[widget.i]);
          });
        },
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: <Widget>[
            Radio(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: sortFilterController.order[widget.i],toggleable: true,
                groupValue: sortFilterController.orderSelect,
                onChanged: (value) {
                  setState(() {
                    sortFilterController.orderButtonClick(value);
                    sortFilterController.update();
                  });
                }
            ),
            Text(widget.title,
                style: TextStyle(
                    fontSize: TextUtils.hintTextSize,
                    color: grey,
                    fontFamily: "Poppins",
                    fontWeight: TextUtils.normalTextWeight))
          ],
        ),
      ),
    );
  }
}


class OrderFilterRadio extends StatefulWidget {
  int index; String title;
  OrderFilterRadio(this.index,this.title, {Key? key}) : super(key: key);

  @override
  _OrderFilterRadioState createState() => _OrderFilterRadioState();
}

class _OrderFilterRadioState extends State<OrderFilterRadio> {
  @override
  Widget build(BuildContext context) {
    final sortFilterController = Get.put(SortFilterController());
    return Padding(
      padding: const EdgeInsets.only(left:20.0, right: 20.0),
      child: InkWell(
        onTap: (){
          setState(() {
            sortFilterController.filterOrderButtonClick(sortFilterController.filterOrder[widget.index]);
          });
        },
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: <Widget>[
            Radio(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: sortFilterController.filterOrder[widget.index],
                groupValue: sortFilterController.filterOrderSelect,toggleable: true,
                onChanged: (value) {
                  setState(() {
                    sortFilterController.filterOrderButtonClick(value);
                    sortFilterController.update();
                  });
                }
            ),
            Text(widget.title,
                style: TextStyle(
                    fontSize: TextUtils.hintTextSize,
                    color: grey,
                    fontWeight: TextUtils.normalTextWeight,
                    fontFamily: "Poppins"
                ))
          ],
        ),
      ),
    );
  }
}
