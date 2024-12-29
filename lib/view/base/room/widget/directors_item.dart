import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_app/data/model/response/show_room_model.dart';

import '../../../../util/app_constants.dart';
import '../../../../util/colors.dart';
import '../../../../util/styles.dart';
import '../../../screens/family/widget/custom_netwok_image.dart';

class DirectorsItem extends StatelessWidget {
  final Admin admin;
  final int index;

  const DirectorsItem({super.key, required this.admin, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        SizedBox(
          width: 10.w,
        ),
        Padding(
          padding:  EdgeInsets.only(top: 15.h),
          child: Text('${index+1}.', style: robotoGreySmall.copyWith(color: Colors.black)),
        ),
        SizedBox(
          width: 5.w,
        ),
        CustomNetworkImage(
          image: '${AppConstants.mediaUrl}/profile/${admin.image}',
          width: 50.w,
          height: 50.w,
        ),
        SizedBox(
          width: 15.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              admin.name,
              style: robotoLargeBold.copyWith(fontWeight: FontWeight.w500),
            ),
            Container(
              width: 40.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.r),
                color: Colors.lightBlueAccent.shade100,
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(
                  admin.gender == 'male' ? Icons.male : Icons.female,
                  color: admin.gender == 'male' ? Colors.blue : Colors.pink,
                ),
              ),
            )
          ],
        ),
        const Spacer(),
        Container(
          height: 30.h,
          decoration: BoxDecoration(
            border: Border.all(color: ColorManger.colorPurple),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Delete',
                style: robotoWhite.copyWith(color: ColorManger.colorPurple),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 15.w,
        )
      ],
    );
  }
}
