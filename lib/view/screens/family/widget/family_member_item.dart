import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_app/data/model/response/family_model.dart';
import 'package:live_app/view/screens/family/widget/person_photo.dart';

import '../../../../util/dimensions.dart';
import '../../../../util/styles.dart';

class FamilyMemberItem extends StatelessWidget {
  const FamilyMemberItem({super.key, });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const PersonPhoto(),
        SizedBox(height: 10.h,),
        Text(
          "VIP UAE",
          style: robotoWhiteVeryBold.copyWith(
              color: Colors.purpleAccent,
              fontSize: Dimensions.fontSizeDefault),
        ),
      ],
    );
  }
}
