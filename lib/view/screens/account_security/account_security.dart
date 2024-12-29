import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/util/colors.dart';
import 'package:live_app/view/screens/account_security/widget/password_item.dart';
import 'package:live_app/view/screens/account_security/widget/phone_number_item.dart';
import 'package:live_app/view/screens/account_security/widget/socail_media_item.dart';
import 'package:live_app/view/widgets/app_bar.dart';

import '../../../util/styles.dart';

class AccountSecurity extends StatelessWidget {
  const AccountSecurity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.whiteColor,
      body: Column(
        children: [
          AppBarCustom(name: "Account Security".tr),
          SizedBox(
            height: 20.h,
          ),
          Column(
            children: [
              const ChangePhoneNumberItem(),
              SizedBox(
                height: 20.h,
              ),
              const ChangePasswordItem(),
              SizedBox(
                height: 20.h,
              ),
              const SocialMediaItem(icon: 'assets/images/google.webp', name: "FaceBook", isBind: false),
              SizedBox(
                height: 20.h,
              ),
              const SocialMediaItem(icon: 'assets/images/google.webp', name: "Google", isBind: true),
              SizedBox(
                height: 20.h,
              ),
              const SocialMediaItem(icon: 'assets/images/sanp_chat.webp', name: "SnapChat", isBind: true),
            ],
          )
        ],
      ),
    );
  }
}
