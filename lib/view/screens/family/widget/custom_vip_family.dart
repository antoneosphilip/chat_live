import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/styles.dart';

class CustomVipFamily extends StatelessWidget {
  const CustomVipFamily({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/images/family_name.webp',
                  height: 20.h,
                  width: 20.w,
                ),
                Image.asset(
                  'assets/images/juail.png',
                  height: 10.h,
                  width: 10.w,
                ),
              ],
            ),
            SizedBox(width: 5.w,),
            Text(
              "VIP UAE",
              style: robotoWhite,
            ),

            const SizedBox(width: 15,),

          ],
        ),

      ],
    );
  }
}
