import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nearme/utils/color_utils.dart';
import 'package:nearme/utils/text_utils.dart';

class BookingConfirmed extends StatefulWidget {
  const BookingConfirmed({Key? key}) : super(key: key);

  @override
  _BookingConfirmedState createState() => _BookingConfirmedState();
}

class _BookingConfirmedState extends State<BookingConfirmed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/png_file/home_address/done.png",height: 100.0,color: blue,),
            Padding(
              padding: EdgeInsets.only(left: 0.0, top: 26.0),
              child: Text(
                "Booking confirmed ",
                style: TextStyle(
                    color: grey,
                    fontFamily: "Poppins",
                    fontSize: TextUtils.headerTextSize,
                    fontWeight: TextUtils.mediumtTextWeight),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
