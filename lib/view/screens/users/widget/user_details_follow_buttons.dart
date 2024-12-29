import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controller/user_controller.dart';
import '../../../widgets/custom_bg_btn.dart';

class UserDetailsFollowButtons extends StatelessWidget {
  final UserController userController;

  const UserDetailsFollowButtons({super.key, required this.userController});

  @override
  Widget build(BuildContext context) {
    return  userController.userDetailsModelStatic?.id ==
        userController.userModel?.id
        ? const SizedBox()
        : Container(
      padding: EdgeInsets.only(
          top: 10.h, bottom: 20.h),
      child: Row(
        mainAxisAlignment:
        MainAxisAlignment
            .spaceAround,
        children: [
          CustomBgBtn(
              text: userController
                  .userDetailsModelStatic
                  ?.isFollowed ==
                  true
                  ? 'unfollow'.tr
                  : 'follow'.tr,
              img:
              'assets/images/btn.webp',
              onTab: () async {
                Map<String, dynamic>
                data = {};
                if (userController
                    .userDetailsModelStatic
                    ?.isFollowed ==
                    true) {
                  data = await userController
                      .unfollow(
                      userController
                          .userDetailsModelStatic!
                          .id!);
                } else {
                  data = await userController.follow(
                      userController
                          .userDetailsModelStatic!
                          .id!);
                }
                userController
                    .setUserDetailsModel(
                    'isFollowed',
                    data[
                    'isFollowed']);
                userController
                    .getUserData();
              }),
          CustomBgBtn(
              text: userController
                  .userDetailsModelStatic
                  ?.isFriend ==
                  true
                  ? 'remove_friend'
                  .tr
                  : 'add_friend'.tr,
              img:
              'assets/images/btn.webp',
              onTab: () {}),
        ],
      ),
    );
  }
}
