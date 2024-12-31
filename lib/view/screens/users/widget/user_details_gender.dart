import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../controller/user_controller.dart';
import '../../../../util/app_constants.dart';
import '../../../base/custom_image.dart';

class UserDetailsGender extends StatelessWidget {
  final UserController userController;

  const UserDetailsGender ({super.key, required this.userController});

  @override
  Widget build(BuildContext context) {
    return   Container(
      child: Row(
        children: [
          Image.asset(
            userController
                .userDetailsModelStatic
                ?.gender ==
                'male'
                ? 'assets/images/male.webp'
                : 'assets/images/female.webp',
            width: 15,
            height: 15,
            fit: BoxFit.fill,
          ),
          SizedBox(
            width: 5.w,
          ),
          CustomImage(
            image:
            //     ${AppConstants.baseUrl}/
            "${userController.userDetailsModelStatic?.consigneeLevel?.currentImage}",
            width: 50,
          ),
          SizedBox(
            width: 5.w,
          ),
          CustomImage(
            image:
            //     ${AppConstants.baseUrl}/
            "${userController.userDetailsModelStatic?.senderLevel?.currentImage}",
            width: 50.w,
          ),
        ],
      ),
    );
  }
}
