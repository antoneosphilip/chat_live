import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../helper/responsive_helper.dart';

class ButtonWidget extends StatelessWidget {
  final bool isCheck;
  const ButtonWidget({super.key, required this.isCheck});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isCheck
            ? SizedBox(
          width: ResponsiveHelper.ofWidth(context, 1),
          child: Center(
            child: InkWell(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: Container(
                  height: 60.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/family_btn_bg.webp',
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Get Verification Code'.tr,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white60),
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
            : SizedBox(
          width: ResponsiveHelper.ofWidth(context, 1),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: Container(
                height: 60.h,
                decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.all(Radius.circular(24.r)),
                    color: Colors.grey.shade400),
                child: Center(
                  child: Text(
                    'Get Verification Code'.tr,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white60),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
