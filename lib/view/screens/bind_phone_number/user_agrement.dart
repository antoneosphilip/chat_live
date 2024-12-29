import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../util/colors.dart';
import '../../../util/styles.dart';

class UserAgreementUserAgreement extends StatefulWidget {
  const UserAgreementUserAgreement({super.key});

  @override
  State<UserAgreementUserAgreement> createState() =>
      _UserAgreementUserAgreementState();
}

class _UserAgreementUserAgreementState
    extends State<UserAgreementUserAgreement> {
  bool _isChecked=false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
            activeColor: ColorManger.primary,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            checkColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.r), // Circular shape
            ),
            value: _isChecked,
            onChanged: (bool ? value) {
              setState(() {
                _isChecked = value ?? false;
              });
            }),
        SizedBox(
          width: 5.w,
        ),
        Text.rich(TextSpan(children: [
          TextSpan(text: "i have agreed ".tr, style: robotoGreySmall),
          TextSpan(
              text: "User Agreement ".tr,
              style: robotoGreySmall.copyWith(
                  color: ColorManger.primary, fontWeight: FontWeight.w400)),
          TextSpan(text: "And ", style: robotoGreySmall),
          TextSpan(
              text: "Privacy Policy".tr,
              style: robotoGreySmall.copyWith(
                  color: ColorManger.primary, fontWeight: FontWeight.w400)),
        ]))
      ],
    );
  }
}
