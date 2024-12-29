import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLine extends StatelessWidget {
  final Color? color;
  const CustomLine({super.key,  this.color});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: 1.h,
      color: color??Colors.grey.shade300,
    );
  }
}
