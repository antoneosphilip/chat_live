import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/user_controller.dart';

import '../../../../util/app_constants.dart';
import '../../../../util/dimensions.dart';
import '../../../../util/styles.dart';
import '../../../base/custom_image.dart';

class UserNameId extends StatelessWidget {
  final UserController userController;
  const UserNameId({super.key, required this.userController});

  @override
  Widget build(BuildContext context) {
    return    Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '${userController.userInfoStatic.fName} ${userController.userInfoStatic?.lName}',
            style: robotoBold.copyWith(
                fontSize: Dimensions.fontSizeDefault,
                color: Colors.black),
          ),

          SizedBox(
              height: 10.h),
          Text(
            "${'id'.tr} : ${userController.userModelStatic?.uuid}",
            style: robotoMedium.copyWith(
                fontSize:  Dimensions.fontSizeDefault,
                color: Colors.black54),
          ),
          SizedBox(
              height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomImage(
                image:
                '${AppConstants.baseUrl}/${userController.userModelStatic?.senderLevel?.currentImage}',
                width: 40,
              ),
              const SizedBox(
                width: 8,
              ),
              CustomImage(
                image:
                '${AppConstants.baseUrl}/${userController.userModelStatic?.consigneeLevel?.currentImage}',
                width: 40,
              ),
            ],
          )
        ]);
  }
}
