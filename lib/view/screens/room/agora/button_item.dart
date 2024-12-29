import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonItem extends StatelessWidget {
  final String text;
  final String image;
  const ButtonItem({Key? key, required this.text, required this.image}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 80.w,
      height: 40.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        image:  DecorationImage(image: AssetImage(image,),fit: BoxFit.cover),
      ),
      child: Center(child: Text(text,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 10.sp),)),
    );
  }
}
