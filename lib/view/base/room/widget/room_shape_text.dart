import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/colors.dart';
import '../../../../util/styles.dart';

class RoomShapeText extends StatelessWidget {
  final String text;
  const RoomShapeText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 15.h,
          width: 5.w,
          decoration: BoxDecoration(
              gradient:  ColorManger.purpleToWhiteGradient,
              borderRadius: BorderRadius.circular(16.r)
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
        Text(
          text,
          style: robotoBlack3.copyWith(
              color: Colors.black,
              decoration: TextDecoration.none,fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
