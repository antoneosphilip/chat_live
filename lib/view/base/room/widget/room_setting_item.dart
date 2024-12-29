import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../util/dimensions.dart';
import '../../../../util/styles.dart';

class RoomSettingItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function()? onTap;
  final MaterialColor iconColor;
  const RoomSettingItem({super.key, required this.icon, required this.text,  this.onTap, required this.iconColor, });

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap:onTap,
      child: Column(
        children: [
          Icon(icon,size: 30.sp,color: iconColor,),
          SizedBox(height: 5.h,),
          Text(text,style: robotoGreySmall.copyWith(fontSize: Dimensions.fontSizeSmall),),
        ],
      ),
    );
  }
}
