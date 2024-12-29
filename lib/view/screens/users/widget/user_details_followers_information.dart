import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controller/user_controller.dart';

class UserDetailsFollowersInformation extends StatelessWidget {
  final UserController userController;

  const UserDetailsFollowersInformation({super.key, required this.userController});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 80.h,
      decoration: BoxDecoration(
        image: const DecorationImage(
            matchTextDirection: true,
            image: AssetImage(
                'assets/images/counts_bg.webp'),
            fit: BoxFit.fill),
        borderRadius:
        BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment:
        MainAxisAlignment.spaceEvenly,
        crossAxisAlignment:
        CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment:
            MainAxisAlignment.center,
            children: [
              Text(
                "${userController.userDetailsModelStatic?.wealth}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.sp),
              ),
              Text(
                'Wealth'.tr,
                style: const TextStyle(
                    color: Colors.white),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(
                vertical: 10.h),
            child: Image(
              width: 3.w,
              image: const AssetImage(
                  'assets/images/v_line.png'),
            ),
          ),
          Column(
            mainAxisAlignment:
            MainAxisAlignment.center,
            children: [
              Text(
                "${userController.userDetailsModelStatic?.charm}",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25),
              ),
              Text(
                'Charm'.tr,
                style: const TextStyle(
                    color: Colors.white),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(
                vertical: 10.h),
            child: Image(
              width: 3.w,
              image: const AssetImage(
                  'assets/images/v_line.png'),
            ),
          ),
          Column(
            mainAxisAlignment:
            MainAxisAlignment.center,
            children: [
              Text(
                "${userController.userDetailsModelStatic?.followersCount}",
                style:  TextStyle(
                    color: Colors.white,
                    fontSize: 25.sp),
              ),
              Text(
                'followers'.tr,
                style: const TextStyle(
                    color: Colors.white),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(
                vertical: 10.h),
            child: Image(
              width: 3.w,
              image: const AssetImage(
                  'assets/images/v_line.png'),
            ),
          ),
          Column(
            mainAxisAlignment:
            MainAxisAlignment.center,
            children: [
              Text(
                "${userController.userDetailsModelStatic?.visitorsCount}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.sp),
              ),
              Text(
                'visitors'.tr,
                style: const TextStyle(
                    color: Colors.white),
              )
            ],
          ),
        ],
      ),
    );
  }
}
