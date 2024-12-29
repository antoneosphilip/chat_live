import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String text;
  final Color backGroundColor;
  final Color textColor;
  final Color borderColor;
  final String? navigateTo;
  final Function()? onTap;
  final dynamic arguments;
  final int width;
  final double horizontal;
  final double vertical;


  const ElevatedButtonWidget(
      {super.key,
      required this.text,
      required this.backGroundColor,
      required this.textColor,
      required this.borderColor,
       this.navigateTo,
      this.arguments,
       this.onTap,  this.width=330,  this.horizontal=100,  this.vertical=16});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width.w,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: backGroundColor,
            // Text color
            padding: EdgeInsets.symmetric(horizontal: horizontal.w, vertical: vertical.h),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: borderColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(24.r), // Rounded corners
            ),
          ),
          onPressed: onTap ??
              () {
                Get.toNamed(navigateTo!, arguments: arguments);
              },
          child: Text(
            text,
            style: TextStyle(fontSize: 18.sp, color: textColor),
          ),
        ),
      ),
    );
  }
}
