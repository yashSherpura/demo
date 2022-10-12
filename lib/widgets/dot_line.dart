import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nearme/utils/screen_size.dart';

class DotWidget extends StatelessWidget {
  final double totalWidth, dashWidth, emptyWidth, dashHeight;

  final Color dashColor;

  const DotWidget({
    this.totalWidth = size250,
    this.dashWidth = size10,
    this.emptyWidth = size5,
    this.dashHeight = size2,
    this.dashColor = Colors.grey,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        totalWidth ~/ (dashWidth + emptyWidth),
            (_) => Container(
          width: dashWidth,
          height: dashHeight,
          color: dashColor,
          margin: EdgeInsets.only(left: emptyWidth / size2, right: emptyWidth / size2),
        ),
      ),
    );
  }
}