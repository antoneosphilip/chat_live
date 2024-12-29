import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controller/user_controller.dart';
import '../../../../util/app_constants.dart';
import '../../../base/custom_image.dart';
import '../../../widgets/section_container.dart';
import '../../../widgets/top_3.dart';

class UserDetailsSections extends StatelessWidget {
  final UserController userController;

  const UserDetailsSections({super.key, required this.userController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionContainer(
          icon: 'assets/images/cup.png',
          title: 'top_supporters'.tr,
          color: Colors.orangeAccent
              .withOpacity(0.1),
          padding: EdgeInsets.only(top: 15.h),
          body: TopThree(
            users: userController
                .userDetailsModelStatic
                ?.topSupporters,
          ),
        ),
        SectionContainer(
          icon: 'assets/images/medal.png',
          title: 'medals'.tr,
          color:
          Colors.yellow.withOpacity(0.1),
          padding: EdgeInsets.only(top: 15),
        ),
        SectionContainer(
          icon: 'assets/images/car.png',
          title: 'entrance_effect'.tr,
          color: Colors.blueAccent
              .withOpacity(0.1),
          padding: EdgeInsets.only(top: 15),
        ),
        SectionContainer(
            icon:
            'assets/images/gift_fill.png',
            title: 'gift_wall'.tr,
            color:
            Colors.pink.withOpacity(0.1),
            padding: const EdgeInsets.all(15),
            body: Wrap(
              children: [
                ...?userController
                    .userDetailsModelStatic
                    ?.receivedGifts
                    ?.map((e) => Container(
                  padding:
                  const EdgeInsets.all(
                      10),
                  child: Column(
                    children: [
                      CustomImage(
                        width: 50,
                        height: 50,
                        image:
                        "${AppConstants.mediaUrl}/gift/${e.thumbnail}",
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                          "x ${e.totalQty}")
                    ],
                  ),
                ))
              ],
            )),
      ],
    );
  }
}
