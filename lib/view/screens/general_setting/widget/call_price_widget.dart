import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../util/styles.dart';

class CallPriceWidget extends StatelessWidget {
  const CallPriceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text("Call price: 0/min".tr, style: robotoBlack.copyWith(color: Colors.purple.shade200,fontWeight: FontWeight.w600),),
            Image(image: const AssetImage('assets/images/juail.png'),height: 20.h,width: 20.w,)
          ],
        ),
        Container(
          width: 135.w,
          height: 1.h,
          color: Colors.purple.shade200,

        )
      ],
    );
  }
}
