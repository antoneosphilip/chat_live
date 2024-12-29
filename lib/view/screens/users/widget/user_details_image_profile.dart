import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controller/user_controller.dart';
import '../../../../util/app_constants.dart';
import '../../../../util/images.dart';
import '../../../base/custom_image.dart';

class UserDetailsImageProfile extends StatelessWidget {
  final UserController userController;

  const UserDetailsImageProfile({super.key, required this.userController});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment:
          MainAxisAlignment.center,
          crossAxisAlignment:
          CrossAxisAlignment.center,
          children: [
            userController.userDetailsModelStatic
                ?.country !=
                null
                ? Container(
              width: 30,
              height: 20,
              decoration: BoxDecoration(
                borderRadius:
                BorderRadius.circular(
                    5),
                image: DecorationImage(
                    image: NetworkImage(
                      "${AppConstants.mediaUrl}/country/${userController.userDetailsModelStatic?.country?.flag}",
                    ),
                    fit: BoxFit.fill),
              ),
            )
                : SizedBox(
              width: 30.h,
            ),
            SizedBox(
              width: 10.h,
            ),
            ClipOval(
              child: CustomImage(
                placeholder: Images.guestIcon,
                image:
                '${AppConstants.mediaUrl}/profile/${userController.userDetailsModelStatic?.image}',
                height: 70.h,
                width: 70.w,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 10.h,
            ),
            userController.userDetailsModelStatic
                ?.country !=
                null
                ? Container(
              width: 30.w,
              height: 20.h,
              decoration: BoxDecoration(
                borderRadius:
                BorderRadius.circular(
                    5),
                image: DecorationImage(
                    image: NetworkImage(
                      "${AppConstants.mediaUrl}/country/${userController.userDetailsModelStatic?.country?.flag}",
                    ),
                    fit: BoxFit.fill),
              ),
            )
                : SizedBox(
              width: 30.h,
            ),
          ],
        ),
        Row(
          mainAxisAlignment:
          MainAxisAlignment.center,
          children: [
            Text(
              '${userController.userDetailsModelStatic?.name}',
              style:
              const TextStyle(color: Colors.white),
            ),
          ],
        ),
        Row(
          mainAxisAlignment:
          MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius:
                BorderRadius.circular(5),
                color: Colors.black54,
              ),
              padding: EdgeInsets.symmetric(
                  vertical: 2.h, horizontal: 10.w),
              child: Text(
                '${'id'.tr}:${userController.userDetailsModelStatic?.uuid}',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            InkWell(
                onTap: () {
                  Clipboard.setData(ClipboardData(
                      text:
                      "${userController.userDetailsModelStatic?.uuid}"))
                      .then((_) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(
                        content: Text(
                            'Copied_to_your_clipboard'
                                .tr)));
                  });
                },
                child: const Icon(
                  Icons.copy,
                  size: 15,
                  color: Colors.white,
                )),
          ],
        ),
      ],
    );
  }
}
