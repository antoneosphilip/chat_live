import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_app/util/styles.dart';

import '../../../../helper/responsive_helper.dart';

class InvitedFriendsButton extends StatelessWidget {
  final String text;
  const InvitedFriendsButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: ResponsiveHelper.ofWidth(context, 1),
      child: Center(
        child: InkWell(
          child: Container(
            height: 50,
            width: ResponsiveHelper.ofWidth(context, 0.4),
            decoration:  BoxDecoration(
                borderRadius:BorderRadius.circular(24.r),
                color: Colors.amber
            ),
            child:  Center(
              child: Text(
                text,
                style:robotoWhite.copyWith(color: Colors.black,fontSize: 15.sp),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
