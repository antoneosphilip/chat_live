import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/colors.dart';

class PersonPhoto extends StatelessWidget {
  const PersonPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 30.h,
          width: 30.w,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ColorManger.orangeColor),
        ),
         const Icon(
           Icons.person,
           color: ColorManger.whiteColor,
         ),
      ],
    );
  }
}
