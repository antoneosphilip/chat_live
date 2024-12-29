import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_app/util/colors.dart';

import '../../../../util/styles.dart';

class RoomShapeItem extends StatelessWidget {
  final String text;
  final String image;
  final bool isSelected;

  const RoomShapeItem({
    super.key,
    required this.text,
    required this.isSelected,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.h,),
        Container(
            decoration: BoxDecoration(
                gradient: isSelected?ColorManger.purpleToWhiteGradient:const LinearGradient(colors: [Colors.white,Colors.white]),
                border: Border.all(color:isSelected?ColorManger.colorPurpleMix:Colors.black),
                borderRadius: BorderRadius.circular(8.r)),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
              child: Center(
                child: Text(
                  text,
                  style: robotoBlack2.copyWith(
                      color: isSelected?Colors.white:Colors.grey,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w500),
                ),
              ),
            )),
      ],
    );
  }
}
