import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_app/data/model/response/family_model.dart';
import 'package:live_app/util/colors.dart';
import 'package:live_app/view/screens/family/widget/custom_netwok_image.dart';

import '../../../../helper/responsive_helper.dart';
import '../../../../util/styles.dart';
import 'custom_vip_container.dart';
import 'custom_vip_family.dart';

class FamilyFirstSection extends StatelessWidget {
  final FamilyResponse familyResponse;

  const FamilyFirstSection({super.key, required this.familyResponse});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: ResponsiveHelper.ofHeight(context, 0.35),
          width: ResponsiveHelper.ofWidth(context, 1),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/my_family_bg.webp'),
                  fit: BoxFit.fill)),
        ),
        CustomNetworkImage(image: familyResponse.data?.image),
        Padding(
          padding: EdgeInsets.only(bottom: 30.h),
          child: Image.asset(
            'assets/images/family_name.webp',
            height: 120.h,
            width: 120.w,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 110.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: ResponsiveHelper.ofWidth(context, .1),
              ),
              Text(familyResponse.data!.name!, style: robotoBlack.copyWith(color: Colors.white)),
              SizedBox(width: 10.w),
              const CustomVipFamily(),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 160.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                  text: TextSpan(children: [
                TextSpan(text: "ID : ", style: robotoWhiteVeryBold),
                TextSpan(text: familyResponse.data?.id.toString(), style: robotoWhiteVeryBold),
              ])),
              SizedBox(width: 7.w),
              const Icon(
                Icons.copy_outlined,
                color: Colors.grey,
              ),
            ],
          ),
        )
      ],
    );
  }
}
