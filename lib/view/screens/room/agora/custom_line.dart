import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRoomLine extends StatelessWidget {
  const CustomRoomLine({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
      width: double.infinity,
      height: 1.h,
      color: Colors.white.withOpacity(.1),
    );
  }
}
