

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nearme/utils/color_utils.dart';
import 'package:nearme/utils/screen_size.dart';
import 'package:nearme/utils/text_utils.dart';

class InputField extends StatelessWidget {
  final String? hintText;  final   TextEditingController? controller;

  final ValueChanged<String>? onChanged;
  final Function(String)? validator;
  final int? maxLines,maxLength;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final bool? editable;
  final bool? autoFocus;
  final Widget? leftIcon,rightIcon;
  final  TextInputAction? moveCurser;

  const InputField({
    Key? key,
    this.hintText,
    this.editable,
    this.onChanged,
    this.controller,
    this.validator,
    this.maxLines,
    this.keyboardType,
    this.maxLength,
    this.focusNode,this.leftIcon,this.rightIcon,this.moveCurser,this.autoFocus

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLength:maxLength,
      maxLines: maxLines,
      keyboardType: keyboardType,
      enabled: editable,
      cursorColor:primaryColor,autofocus: autoFocus ?? false,
      focusNode: focusNode,
      onChanged: onChanged,
      decoration: InputDecoration(
      border: InputBorder.none,
        disabledBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        contentPadding:  EdgeInsets.only(left: size10,right: size10,bottom: Platform.isAndroid ? size10 : 0),
        filled: true,
        fillColor: white,
        counterText: "",
        hintText: hintText,
        suffix: rightIcon ,
        hintStyle: TextStyle(

          color:grey,
          fontFamily: "Poppins",
          fontSize: TextUtils.commonTextSize / Get.textScaleFactor,
          fontWeight: TextUtils.mediumtTextWeight,
        ),


      ),
      style: TextStyle(fontSize: TextUtils.hintTextSize / Get.textScaleFactor,fontWeight: TextUtils.normalTextWeight,color: black),
      textInputAction:  moveCurser ,

      // validator: (value) => value.trim().isEmpty ? 'Email required' : null,

    );
  }



}
