import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/styles.dart';

class PersonName extends StatelessWidget {
  const PersonName({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(top: 370.h),
      child: Center(
        child: Container(
          width: 90.w,
          height: 30.h,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [
                Colors.white.withOpacity(0.8),
                // Deep white in the middle
                Colors.white.withOpacity(.3),
                // Lighter white at the edges
              ],
              center: Alignment.center, // Start from the center
              radius: 1.0, // Controls how far the gradient spreads
              stops: const [
                0.4,
                1.0
              ], // Gradual transition from deep to light
            ),
          ),
          child: Center(
              child: Text(
                "lll",
                style: robotoBlack2.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold),
              )),
        ),
      ),
    );
  }
}
