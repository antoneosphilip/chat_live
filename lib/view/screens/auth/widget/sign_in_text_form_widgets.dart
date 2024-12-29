import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/localization_controller.dart';
import '../../../../helper/responsive_helper.dart';
import '../../../../util/dimensions.dart';
import '../../../base/custom_text_field.dart';

class SignInTextFormWidget extends StatefulWidget {

  SignInTextFormWidget({super.key});

  @override
  State<SignInTextFormWidget> createState() => _SignInTextFormWidgetState();
}

class _SignInTextFormWidgetState extends State<SignInTextFormWidget> {
  final FocusNode _phoneFocus = FocusNode();

  final FocusNode _passwordFocus = FocusNode();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  String? _countryDialCode;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          titleText: ResponsiveHelper.isDesktop(context)
              ? 'phone'.tr
              : 'enter_phone_number'.tr,
          hintText: '',
          controller: _phoneController,
          focusNode: _phoneFocus,
          nextFocus: _passwordFocus,
          inputType: TextInputType.phone,
          isPhone: true,
          showTitle:
          ResponsiveHelper.isDesktop(context),
          onCountryChanged: (CountryCode countryCode) {
            _countryDialCode = countryCode.dialCode;
          },
          countryDialCode: _countryDialCode ??
              Get.find<LocalizationController>()
                  .locale
                  .countryCode,
        ),
        const SizedBox(
            height: Dimensions.paddingSizeExtraLarge),
        CustomTextField(
          titleText: ResponsiveHelper.isDesktop(context)
              ? 'password'.tr
              : 'enter_your_password'.tr,
          hintText: 'enter_your_password'.tr,
          controller: _passwordController,
          focusNode: _passwordFocus,
          inputAction: TextInputAction.done,
          inputType: TextInputType.visiblePassword,
          prefixIcon: Icons.lock,
          isPassword: true,
          showTitle:
          ResponsiveHelper.isDesktop(context),
          // onSubmit: (text) => (GetPlatform.isWeb)
          //     ? _login(
          //     authController, _countryDialCode!)
          //     : null,
          onChanged: (value) {
            // if (value != null && value.isNotEmpty) {
            //   if (!authController.showPassView) {
            //     authController.showHidePass();
            //   }
            //   authController.validPassCheck(value);
            // } else {
            //   if (authController.showPassView) {
            //     authController.showHidePass();
            //   }
            // }
          },
        ),
      ],
    );
  }
}
