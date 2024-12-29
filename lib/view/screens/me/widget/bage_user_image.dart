import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:svgaplayer_flutter/player.dart';

import '../../../../controller/my_bag_controller.dart';
import '../../../../controller/user_controller.dart';
import '../../../../util/app_constants.dart';

class BageUserImage extends StatelessWidget {
  final MyBagController myBagController;
  const BageUserImage({super.key, required this.myBagController});

  @override
  Widget build(BuildContext context) {
    return   Container(
      height: Get.height * 0.3,
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(
                  "${AppConstants.mediaUrl}/profile/${Get.find<UserController>().userInfoModel?.image}"),
            ),
            SizedBox(
              width: 120.w,
              height: 120.h,
              child: Center(
                  child:
                  (myBagController.selectedType !=
                      null &&
                      myBagController
                          .selectedItemStatic !=
                          null &&
                      myBagController.selectedType
                          ?.relatedTo ==
                          'user_avatar' &&
                      myBagController.selectedItemStatic
                          ?.type ==
                          'svg')
                      ? SVGASimpleImage(
                    resUrl:
                    "${AppConstants.baseUrl}/${myBagController.selectedItemStatic?.svg}",
                  )
                      : SizedBox()),
            )
          ],
        ),
      ),
    );
  }
}
