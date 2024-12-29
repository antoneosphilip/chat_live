import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../controller/user_controller.dart';
import '../../../../data/model/body/notification_body.dart';
import '../../../../data/model/response/conversation_model.dart';
import '../../../../helper/route_helper.dart';
import '../../../../util/app_constants.dart';

class UserDetailsSendButtons extends StatelessWidget {
  final UserController userController;

  const UserDetailsSendButtons({super.key, required this.userController});

  @override
  Widget build(BuildContext context) {
    return   userController.userDetailsModelStatic?.id ==
        userController.userModel?.id
        ? const SizedBox()
        : Positioned(
      bottom: 20.h,
      child: Row(
        mainAxisAlignment:
        MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              Get.toNamed(
                RouteHelper.getChatRoute(
                  user: User(
                      id: userController
                          .userDetailsModelStatic?.id,
                      image: userController
                          .userDetailsModelStatic?.image,
                      fName: userController
                          .userDetailsModelStatic?.name,
                      lName: ''),
                  notificationBody: NotificationBody(
                    notificationType:
                    NotificationType.message,
                    receiverId: userController
                        .userDetailsModelStatic?.id,
                    receiverType:
                    AppConstants.customer,
                  ),
                ),
              );
            },
            child: Container(
              width:
              MediaQuery.of(context).size.width *
                  0.50,
              padding: EdgeInsets.symmetric(
                  vertical: 20.h, horizontal: 25.w),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/send_msg_bg.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/msg.png',
                    width: 25.w,
                    height: 25.h,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    'send_message'.tr,
                    style: const TextStyle(
                        color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            child: Container(
              width:
              MediaQuery.of(context).size.width *
                  0.50,
              padding: EdgeInsets.symmetric(
                  vertical: 20.h, horizontal: 25.w),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/send_gift_bg.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/gift.png',
                    width: 25.w,
                    height: 25.h,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    'send_gift'.tr,
                    style: const TextStyle(
                        color: Colors.white),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
