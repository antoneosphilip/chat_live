import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:live_app/controller/user_controller.dart';

import '../../../../util/app_constants.dart';
import '../../../../util/images.dart';
import '../../../base/custom_image.dart';
import 'choose_picture_Container.dart';

class ProfileImagePerson extends StatelessWidget {
  const ProfileImagePerson({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 16.w,
          ),
          Container(
            width: 100.w,
            height: 100.h,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: CustomImage(
                placeholder: Images.guestIconLight,
                image: '${AppConstants.mediaUrl}/profile'
                    '/${(userController.userInfoModel != null) ? userController.userInfoModel!.image : ''}',
                height: 80.h,
                width: 80.w,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 20.w),
          Container(
            width: 100.w,
            height: 100.h,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
                  ),
                  builder: (BuildContext context) {
                    return const ChoosePictureContainer();
                  },
                );
              },
              child: Center(
                  child: Icon(
                Icons.add,
                color: Colors.grey[400],
                size: 40.sp,
              )),
            ),
          ),
        ],
      ),
    );
  }
}
