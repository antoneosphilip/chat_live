import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/images.dart';
import '../../custom_image.dart';

class EditRoomImagePerson extends StatelessWidget {
  const EditRoomImagePerson ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 100.w,
      decoration: const BoxDecoration(
          shape: BoxShape.circle, color: Colors.white),
      child: const Padding(
        padding: EdgeInsets.all(2.0),
        child: ClipOval(
          child: CustomImage(
            placeholder: Images.guestIconLight,
            image:
            'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?cs=srgb&dl=pexels-pixabay-220453.jpg&fm=jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
