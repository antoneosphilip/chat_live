import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/view/screens/general_setting/widget/room_gift_effects.dart';
import 'package:live_app/view/screens/general_setting/widget/room_gift_item.dart';
import 'package:live_app/view/screens/general_setting/widget/room_git_all_items.dart';
import 'package:live_app/view/screens/general_setting/widget/show_all_item.dart';
import 'package:live_app/view/screens/general_setting/widget/switch_widget.dart';

import '../../../../util/colors.dart';
import '../../../../util/styles.dart';
import 'call_price_widget.dart';

class SecondSection extends StatelessWidget {
  const SecondSection({super.key});

  @override
  Widget build(BuildContext context) {
    bool isSwitch1 = false;

    return Container(
      height: 400.h,
      color: ColorManger.whiteColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShowAllItem(
              text1: 'Start announcement'.tr,
              text2:
                  'After closing,you will not be able to receive notification from the host that you follow'.tr,
              isSwitch: isSwitch1,
            ),
            SizedBox(
              height: 5.h,
            ),
            Container(
              width: double.infinity,
              height: 1.h,
              color: Colors.grey.shade300,
            ),
            SizedBox(
              height: 20.h,
            ),
            const RoomGiftEffects(),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Display effect for self-sending gifts in all chat rooms".tr,
              style: robotoGreySmall,
            ),
            SizedBox(
              height: 15.h,
            ),
            const RoomGitAllItems(),
            SizedBox(
              height: 12.h,
            ),
            Row(

              children: [
                Text(
                  "Room gift effects".tr,
                  style: robotoLargeBold,
                ),
                const Spacer(),
                SwitchWidget(
                  isSwitched: isSwitch1,
                ),
              ],
            ),
            SizedBox(
              height: 0.h,
            ),
            Text(
              "When displayed, other will not be able to call you.".tr,
              style: robotoGreySmall,
            ),
            const CallPriceWidget(),

          ],
        ),
      ),
    );
  }
}
