import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_app/util/dimensions.dart';

import '../../../../util/styles.dart';

class RoomGiftItem extends StatelessWidget {
  final String text;
  final Color colorText;

  const RoomGiftItem({super.key, required this.text,  this.colorText=Colors.black});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16.r)),
        color: Colors.grey.shade100,
      ),
      child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
                    text,
                    style: robotoWhite.copyWith(color: colorText,fontWeight: FontWeight.w400,fontSize:Dimensions.fontSizeDefault),
                  ),
          )),
    );
  }
}
