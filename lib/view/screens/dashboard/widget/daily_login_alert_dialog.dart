import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_app/view/screens/dashboard/widget/sign_in_button.dart';

import '../../../../util/colors.dart';
import '../../create_family/widget/elvated_button.dart';
import 'container_gifts_daily_login.dart';
import 'daily_login_container.dart';
import 'daily_login_image.dart';
import 'daily_login_remind_me.dart';

class DailyLoginAlertDialog extends StatelessWidget {
  const DailyLoginAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.white,
      content: Container(
        width: 300.w,
        height: 400.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Colors.white,
        ),
        child: Stack(
          children: [
            const DailyLoginImage(),
            const DailyLoginRemindMe(),
            const DailyLoginContainer(),
            Padding(
              padding: EdgeInsets.only(
                top: 160.h,
                left: 16.w,
                right: 16.w,
              ),
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 5.0.w,
                  mainAxisSpacing: 10.0.h,
                  childAspectRatio: 1,
                  mainAxisExtent: MediaQuery.of(context).size.width * 0.20,
                ),
                itemCount: 8,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: ContainerGiftsDailyLogin(
                      isDay: index == 0,
                    ),
                  );
                },
              ),
            ),
            const SignInButton(),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            16.r), // Dialog border radius
      ),
    );
  }
}
