import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_app/data/model/response/family_model.dart';
import 'package:live_app/view/screens/family/widget/custom_netwok_image.dart';

import '../../../../util/styles.dart';

class CustomVipContainer extends StatelessWidget {
  final SenderLevel? senderLevel;

  const CustomVipContainer({super.key, this.senderLevel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 15.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(48.r), color: Colors.blue),
          child: Row(
            children: [
              SizedBox(
                width: 3.w,
              ),
             ClipOval(child:  Image(image: NetworkImage('https://www.bing.com/th?id=OIP.roQHQEuNf8SdJJ7wS3RxtgHaHa&w=150&h=150&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2'))),
              SizedBox(
                width: 2.w,
              ),
              Text(
                senderLevel?.currentNo.toString() ?? "",
                style: robotoWhite,
              ),
              SizedBox(
                width: 10.w,
              )
            ],
          ),
        )
      ],
    );
  }
}
