import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/colors.dart';
import '../../../../util/styles.dart';

class PrivilegeWidget extends StatelessWidget {
  final String text;
  const PrivilegeWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 90.w,
          height: 2.h,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [ColorManger.deepGold, ColorManger.whiteColor],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              )),
        ),
        SizedBox(
          width: 10.w,
        ),
        Text(
          text,
          style: robotoBlack2.copyWith(
              color: ColorManger.deepGold, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          width: 10.w,
        ),
        Container(
          width: 80.w,
          height: 2.h,
          decoration:
          BoxDecoration(gradient: ColorManger.goldToWhiteGradient),
        ),
      ],
    );
  }
}
