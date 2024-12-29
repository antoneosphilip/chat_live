import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../helper/responsive_helper.dart';
import '../../../../helper/route_helper.dart';
import '../../../../util/dimensions.dart';
import '../../../base/custom_button.dart';

class CustomButtonSignIn extends StatelessWidget {
  const CustomButtonSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomButton(
      height: ResponsiveHelper.isDesktop(context)
          ? 45
          : null,
      width: ResponsiveHelper.isDesktop(context)
          ? 180
          : null,
      buttonText:
      ResponsiveHelper.isDesktop(context)
          ? 'login'
          : 'sign_in'.tr,
      onPressed: () =>
          Get.toNamed(RouteHelper.getInitialRoute(fromSplash: true)),
      // isLoading: authController.isLoading,
      radius: ResponsiveHelper.isDesktop(context)
          ? Dimensions.radiusSmall
          : Dimensions.radiusDefault,
      isBold: !ResponsiveHelper.isDesktop(context),
      fontSize: ResponsiveHelper.isDesktop(context)
          ? Dimensions.fontSizeExtraSmall
          : null,
    );
  }
}
