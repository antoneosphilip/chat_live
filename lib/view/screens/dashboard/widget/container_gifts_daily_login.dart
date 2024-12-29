import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/styles.dart';

class ContainerGiftsDailyLogin extends StatelessWidget {
  final bool isDay;

  const ContainerGiftsDailyLogin({super.key, required this.isDay});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: isDay
            ? const LinearGradient(colors: [
                Color(0xFFFF1493), // Dark pink
                Color(0xFFFFB6C1), // Lig
              ])
            : LinearGradient(colors: [
                Colors.grey.shade200,
                Colors.grey.shade200,
              ]),
        // color:isDay?Colors.pinkAccent:Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8.r),
      ),
      width: 180.w,
      child: Column(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Container(
                  width: 50.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                      color: isDay
                          ? Colors.white.withOpacity(.2)
                          : Colors.grey.withOpacity(.2),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(30.r),
                          topLeft: Radius.circular(16.r))),
                  child: Padding(
                    padding: EdgeInsets.only(top: 3.h, left: 5.w),
                    child: Text(
                      'Day 1',
                      style: robotoBlack2.copyWith(
                          color: isDay ? Colors.white : Colors.black,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w200),
                    ),
                  ))),
          SizedBox(
            height: 0.h,
          ),
          Image(
            image: const AssetImage('assets/image/best_headwear.png'),
            height: 40.h,
            width: 40.w,
          ),
        ],
      ),
    );
  }
}
