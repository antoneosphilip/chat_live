import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../controller/user_controller.dart';
import '../../../../util/app_constants.dart';
import '../../../../util/images.dart';
import '../../../base/custom_image.dart';
import '../../users/user_details_screen.dart';

class UserMineImage extends StatelessWidget {
  final UserController userController;
  const UserMineImage({super.key, required this.userController});

  @override
  Widget build(BuildContext context) {
    return      Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 90,left: 20),
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(1),
              child: InkWell(
                onTap: () {
                  // Get.find<UserController>().getUserDetails(
                  //     Get.find<UserController>()
                  //         .userModelStatic!
                  //         .id!);
                  Get.to(const UserDetailsScreen());
                },
                child: ClipOval(
                  child: CustomImage(
                    placeholder: Images.guestIconLight,
                    // && isLoggedIn
                    //
                    // ${AppConstants.mediaUrl}/profile
                    image:
                        '${(userController.userInfoStatic != null ) ? userController.userInfoStatic!.image : ''}',
                    height: 70,
                    width: 70,
                    fit: BoxFit.cover,
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
