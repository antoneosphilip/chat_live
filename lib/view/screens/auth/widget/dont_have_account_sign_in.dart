import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../helper/responsive_helper.dart';
import '../../../../helper/route_helper.dart';
import '../../../../util/dimensions.dart';
import '../../../../util/styles.dart';
import '../sign_up_screen.dart';

class DontHaveAccountSignIn extends StatelessWidget {
  const DontHaveAccountSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('do_not_have_account'.tr,
                  style: robotoRegular.copyWith(
                      color:
                      Theme.of(context).hintColor)),
              InkWell(
                onTap: () {
                  if (ResponsiveHelper.isDesktop(
                      context)) {
                    Get.back();
                    Get.dialog(const SignUpScreen());
                  } else {
                    Get.toNamed(
                        RouteHelper.getSignUpRoute());
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(
                      Dimensions.paddingSizeExtraSmall),
                  child: Text('sign_up'.tr,
                      style: robotoMedium.copyWith(
                          color: Theme.of(context)
                              .primaryColor)),
                ),
              ),
            ]),
        const SizedBox(
            height: Dimensions.paddingSizeSmall),

        ResponsiveHelper.isDesktop(context)
            ? const SizedBox()
            : const SizedBox(),

        ResponsiveHelper.isDesktop(context)
            ? Row(
            mainAxisAlignment:
            MainAxisAlignment.center,
            children: [
              Text('do_not_have_account'.tr,
                  style: robotoRegular.copyWith(
                      color: Theme.of(context)
                          .hintColor)),
              InkWell(
                onTap: () {
                  if (ResponsiveHelper.isDesktop(
                      context)) {
                    Get.back();
                    Get.dialog(
                        const SignUpScreen());
                  } else {
                    Get.toNamed(RouteHelper
                        .getSignUpRoute());
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(
                      Dimensions
                          .paddingSizeExtraSmall),
                  child: Text('sign_up'.tr,
                      style:
                      robotoMedium.copyWith(
                          color: Theme.of(
                              context)
                              .primaryColor)),
                ),
              ),
            ])
            : const SizedBox(),
      ],
    );
  }
}
