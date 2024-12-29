import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controller/user_controller.dart';

class ShopBuyCustom extends StatelessWidget {
  const ShopBuyCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.1,
      decoration:
      const BoxDecoration(color: Colors.purpleAccent),
      child: Row(
        mainAxisAlignment:
        MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                vertical: 5.h, horizontal: 10.w),
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius:
                BorderRadius.circular(30)),
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/diamond_icon.webp',
                  width: 25,
                  height: 25,
                ),
                SizedBox(
                  width: 20.h,
                ),
                Text(
                  '${Get.find<UserController>().userModelStatic?.wallet?.diamond}',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.sp),
                ),
                SizedBox(
                  width: 20.w,
                ),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.circular(25)),
                    child: Icon(
                      Icons.add,
                      color: Colors.black,
                      size: 20.sp,
                      weight: 2000,
                    ),
                  ),
                )
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              shape: MaterialStateProperty.all<
                  RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(30),
                ),
              ),
              padding: MaterialStateProperty.all<
                  EdgeInsetsGeometry>(
                EdgeInsets.symmetric(
                    horizontal: 20.w, vertical: 10.h),
              ),
            ),
            child: Text('Buy'.tr),
          ),
        ],
      ),
    );
  }
}
