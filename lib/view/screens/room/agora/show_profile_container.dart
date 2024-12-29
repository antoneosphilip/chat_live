import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:live_app/data/model/response/room_model.dart';

import 'package:live_app/view/screens/family/widget/custom_netwok_image.dart';

import '../../../../controller/user_controller.dart';
import '../../../widgets/show_bottom_sheet_with_select_menu.dart';
import '../../users/user_details_screen.dart';
import 'button_item.dart';

class showProfileUserContainer extends StatelessWidget {
  final User user;

  const showProfileUserContainer({super.key, required this.user});



  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Colors.white,
        ),
        child: Stack(
          children: [
            const Positioned.fill(
              child: Image(
                image: AssetImage('assets/images/member_image.webp'),
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                SizedBox(height: 10.h),
                SizedBox(
                  width: 80.w,
                  child: ClipOval(
                    child: FadeInImage.assetNetwork(
                      placeholder:
                      'https://www.bing.com/th?id=OIP.roQHQEuNf8SdJJ7wS3RxtgHaHa&w=150&h=150&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2',
                      image: user.image,
                      fit: BoxFit.cover,

                      // Ensure the image covers the entire circular area
                      imageErrorBuilder: (context, error, stackTrace) {
                        return const Image(
                            image: NetworkImage(
                                'https://www.bing.com/th?id=OIP.roQHQEuNf8SdJJ7wS3RxtgHaHa&w=150&h=150&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2')); // Handle image loading error
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10.h,),
                Text(
                  user.name ?? " ",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.lightBlueAccent,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      user.uuid.toString(),
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Icon(
                      Icons.copy_rounded,
                      color: Colors.grey,
                      size: 25.sp,
                    ),
                  ],
                ),
                SizedBox(height: 80.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const ButtonItem(
                      text: 'Send a Gift',
                      image: 'assets/images/send_gift.webp',
                    ),
                    SizedBox(width: 10.w),
                    const ButtonItem(
                      text: 'Follow',
                      image: 'assets/images/send_gift.webp',
                    ),
                    SizedBox(width: 10.w),
                    const ButtonItem(
                      text: 'Message',
                      image: 'assets/images/send_gift.webp',
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        Get.find<UserController>().getUserDetails(user.id);
                        Get.to(const UserDetailsScreen());
                      },
                      child: const ButtonItem(
                        text: 'Show Profile',
                        image: 'assets/images/send_gift.webp',
                      ),
                    ),
                    SizedBox(width: 10.w,),
                    SizedBox(
                      width: 80.w,
                      height: 40.h,
                      child: TextButton(
                          onPressed: (){}, child: Text('')),
                    ),
                    SizedBox(width: 10.w,),
                    SizedBox(
                        width: 80.w,
                        height: 40.h,
                        child: TextButton(onPressed: (){}, child: Text(''))),

                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r), // زوايا الـ Dialog
      ),
    );

  }
}
