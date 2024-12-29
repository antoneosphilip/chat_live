import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_app/view/screens/invite_friends/widget/top_three.dart';

import '../../../../util/styles.dart';
import '../../../widgets/custom_clooval_image.dart';
import 'list_invite_item.dart';

class InviteContainer extends StatelessWidget {
  const InviteContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:350.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(
            width: 5,
            color: Colors.amber,
          )
      ),
      child: Column(
        children: [
          SizedBox(height: 20.h,),
          const TopThreeInviteFriends(),
          SizedBox(height: 10.h,),
          const ListInviteItem(),
        ],
      ),
    );
  }
}
