import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_app/controller/create_family_controller.dart';
import 'package:live_app/util/colors.dart';
import 'package:live_app/view/screens/family/widget/custom_netwok_image.dart';

class UploadImageCircleAvatar extends StatelessWidget {
  final CreateFamilyController createFamilyController;
  final String? image;

  const UploadImageCircleAvatar(
      {super.key, required this.createFamilyController, required this.image});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        clipBehavior: Clip.none, // Ensures the camera icon doesn't get clipped
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              createFamilyController.pickedFile != null &&
                      createFamilyController.pickedFile!.path.isNotEmpty
                  ? CircleAvatar(
                      radius: 70,
                      // Set the radius for the avatar
                      backgroundImage: FileImage(
                          File(createFamilyController.pickedFile!.path)),
                      // User's image
                      backgroundColor: ColorManger.colorPurple,
                    )
                  : CircleAvatar(
                      radius: 70,
                      child: CustomNetworkImage(image: image,width: 300,height: 300,isBottom: false,),
                    ),
            ],
          ),
          GestureDetector(
            onTap: () async {
              createFamilyController.pickImage();
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16, right: 18, left: 10),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: ColorManger.colorPurple,
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 24.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
