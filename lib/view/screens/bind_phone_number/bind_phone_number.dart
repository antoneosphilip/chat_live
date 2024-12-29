import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/util/colors.dart';
import 'package:live_app/view/screens/bind_phone_number/user_agrement.dart';
import 'package:live_app/view/screens/bind_phone_number/widget/button.dart';

import '../../../controller/localization_controller.dart';
import '../../../helper/responsive_helper.dart';
import '../../../util/styles.dart';
import '../../base/custom_text_field.dart';

class BindPhoneNumber extends StatefulWidget {
  BindPhoneNumber({super.key});

  @override
  State<BindPhoneNumber> createState() => _BindPhoneNumberState();
}

class _BindPhoneNumberState extends State<BindPhoneNumber> {
  final FocusNode _phoneFocus = FocusNode();

  final FocusNode _passwordFocus = FocusNode();

  final TextEditingController _phoneController = TextEditingController();

  bool isCheck = false;

  String? _countryDialCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorManger.whiteColor,
        leading: Icon(
          Icons.arrow_back_ios,
          size: 20.sp,
          color: Colors.black54,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 80.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 24.w),
              child: Text(
                "Blind phone number".tr,
                style: robotoLargeBold,
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: CustomTextField(
                showBorder: false,
                titleText: ResponsiveHelper.isDesktop(context)
                    ? 'phone'.tr
                    : 'enter_phone_number'.tr,
                hintText: '',
                controller: _phoneController,
                focusNode: _phoneFocus,
                nextFocus: _passwordFocus,
                inputType: TextInputType.phone,
                isPhone: true,
                showTitle: ResponsiveHelper.isDesktop(context),
                onCountryChanged: (CountryCode countryCode) {
                  _countryDialCode = countryCode.dialCode;
                },
                countryDialCode: _countryDialCode ??
                    Get.find<LocalizationController>().locale.countryCode,
                onChanged: (value) {
                  _phoneController.addListener(() {
                    if (_phoneController.text.length > 8) {
                      isCheck = true;
                    } else {
                      isCheck = false;
                    }
                    setState(() {});
                  });
                },
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            ButtonWidget(isCheck: isCheck,),
            SizedBox(height: 350.h,),
            const UserAgreementUserAgreement(),
            SizedBox(height: 30.h,),
          ],
        ),
      ),
    );
  }
}
