import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../controller/user_controller.dart';
import '../../../../helper/route_helper.dart';

class UserDetailsIcon extends StatelessWidget {
  final UserController userController;

  const UserDetailsIcon({super.key, required this.userController});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(vertical: 0.0,horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: const Icon(
                    Icons.arrow_back_ios, color: Colors.white
                ),
                onTap: () {
                  print("ssss");
                },
              ),
              InkWell(
                child: const Icon(
                    Icons.edit, color: Colors.white
                ),
                onTap: () {
                  Get.toNamed(RouteHelper.editProfile,arguments: {
                    'userModel':userController.userModelStatic!
                  });
                },
              ),

            ],
          ),
        ),
      ],
    );
  }
}
