import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../util/styles.dart';

class RememberMeSignIn extends StatelessWidget {
  const RememberMeSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: ListTile(
          // onTap: () =>
          //     authController.toggleRememberMe(),
          leading: Checkbox(
            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            activeColor: Theme.of(context).primaryColor,
            value: true,
            onChanged: (value) {},
            // (bool? isChecked) =>
            //             authController.toggleRememberMe(),
          ),
          title: Text('remember_me'.tr),
          contentPadding: EdgeInsets.zero,
          visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
          dense: true,
          horizontalTitleGap: 0,
        ),
      ),
      TextButton(
        // onPressed: () => Get.toNamed(
        //     // RouteHelper.getForgotPassRoute(
        //     //     false, null)
        //
        // ),
        onPressed: () {},
        child: Text('${'forgot_password'.tr}?',
            style:
                robotoRegular.copyWith(color: Theme.of(context).primaryColor)),
      ),
    ]);
  }
}
