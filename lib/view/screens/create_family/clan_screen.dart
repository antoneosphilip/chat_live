import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_app/view/screens/create_family/widget/custom_rules_item.dart';
import 'package:live_app/view/screens/create_family/widget/elvated_button.dart';
import 'package:live_app/view/screens/create_family/widget/privilage_widget.dart';

import '../../../helper/route_helper.dart';
import '../../../util/colors.dart';
import '../../../util/styles.dart';

class ClanScreen extends StatelessWidget {
  const ClanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const PrivilegeWidget(
          text: 'Privilege',
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            SizedBox(
              width: 30.w,
            ),
            const CustomRulesItem(
              text1: 'Family Family',
              text2: "Frame",
            ),
            SizedBox(
              width: 30.w,
            ),
            const CustomRulesItem(
              text1: 'Family Family',
              text2: "logo",
            ),
            SizedBox(
              width: 30.w,
            ),
            const CustomRulesItem(
              text1: 'Set admins 2',
              text2: "Max",
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        SizedBox(
          width: 150,
          height: 100,
          child: Column(
            children: [
              Image(
                  image: const AssetImage('assets/icon/invite.webp'),
                  fit: BoxFit.cover,
                  height: 50.h,
                  width: 70.w,
                  color: ColorManger.deepGrey),
              Text("Family Members",
                  style: robotoGreySmall.copyWith(
                      color: ColorManger.deepGrey)),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Center(
                      child: Text("50 Max",
                          style: robotoGreySmall.copyWith(
                              color: ColorManger.deepGrey))))
            ],
          ),
        ),
        SizedBox(
          height: 23.h,
        ),
        const ElevatedButtonWidget(
          text: 'All families',
          backGroundColor: ColorManger.whiteColor,
          textColor: Colors.black,
          borderColor: Colors.black, navigateTo: RouteHelper.createFamilyWithData,
        ),
    ]
    );
  }
}
