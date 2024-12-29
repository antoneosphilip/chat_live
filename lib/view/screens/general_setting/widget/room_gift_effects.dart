import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../util/styles.dart';

class RoomGiftEffects extends StatelessWidget {
  const RoomGiftEffects({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Room gift effects".tr,
          style: robotoLargeBold,
        ),
        SizedBox(
          width: 8.w,
        ),
        Container(
          width: 70.w,
          height: 25.h,
          decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.all(Radius.circular(24.r))),
          child: Center(
              child: Text(
                "PRO".tr,
                style: robotoWhite.copyWith(fontWeight: FontWeight.w800),
              )),
        )
      ],
    );
  }
}
