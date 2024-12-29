import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/localization_controller.dart';
import 'package:live_app/helper/responsive_helper.dart';
import 'package:live_app/util/app_constants.dart';
import 'package:live_app/util/colors.dart';
import 'package:live_app/util/dimensions.dart';
import 'package:live_app/util/images.dart';
import 'package:live_app/util/styles.dart';
import 'package:live_app/view/base/custom_app_bar.dart';
import 'package:live_app/view/base/custom_button.dart';
import 'package:live_app/view/base/custom_snackbar.dart';
import 'package:live_app/view/base/web_page_title_widget.dart';
import 'package:live_app/view/screens/language/widget/language_widget.dart';
import 'package:live_app/view/screens/language/widget/web_language_widget.dart';

class ChooseLanguageScreen extends StatefulWidget {
  final bool fromMenu;
  const ChooseLanguageScreen({Key? key, this.fromMenu = false})
      : super(key: key);

  @override
  State<ChooseLanguageScreen> createState() => _ChooseLanguageScreenState();
}

class _ChooseLanguageScreenState extends State<ChooseLanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D47A1),
      appBar: (widget.fromMenu || ResponsiveHelper.isDesktop(context))
          ? CustomAppBar(title: 'language'.tr, backButton: true)
          : null,
      body: SafeArea(
        child: GetBuilder<LocalizationController>(
            builder: (localizationController) {
          return Column(children: [
            WebScreenTitleWidget(title: 'language'.tr),
            Expanded(
                child: Center(
              child: Scrollbar(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: ResponsiveHelper.isDesktop(context)
                      ? EdgeInsets.zero
                      : const EdgeInsets.all(Dimensions.paddingSizeSmall),
                  child: Center(
                      child: Container(
                    child: SizedBox(
                      width: Dimensions.webMaxWidth,
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            !ResponsiveHelper.isDesktop(context)
                                ? Center(
                                    child: Image.asset(Images.logo3, width: 200))
                                : const SizedBox.shrink(),
                            // Center(child: Text(AppConstants.APP_NAME, style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeLarge))),
                            SizedBox(
                                height: Get.find<LocalizationController>().isLtr
                                    ? 30
                                    : 25),

                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: Dimensions.paddingSizeSmall),
                              child: Text('select_language'.tr,
                                  style: robotoMedium.copyWith(color: Colors.white)),
                            ),
                            const SizedBox(height: Dimensions.paddingSizeLarge),

                            Directionality(
                              textDirection: TextDirection.ltr,
                              child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount:
                                      ResponsiveHelper.isDesktop(context)
                                          ? 2
                                          : ResponsiveHelper.isTab(context)
                                              ? 3
                                              : 2,
                                  childAspectRatio:
                                      ResponsiveHelper.isDesktop(context)
                                          ? 6
                                          : (1 / 1),
                                  mainAxisSpacing:
                                      Dimensions.paddingSizeDefault,
                                  crossAxisSpacing:
                                      Dimensions.paddingSizeDefault,
                                ),
                                itemCount:
                                    localizationController.languages.length,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: Dimensions.paddingSizeSmall),
                                itemBuilder: (context, index) =>
                                    ResponsiveHelper.isDesktop(context)
                                        ? WebLanguageWidget(
                                            languageModel:
                                                localizationController
                                                    .languages[index],
                                            localizationController:
                                                localizationController,
                                            index: index,
                                          )
                                        : LanguageWidget(
                                            languageModel:
                                                localizationController
                                                    .languages[index],
                                            localizationController:
                                                localizationController,
                                            index: index,
                                          ),
                              ),
                            ),
                            const SizedBox(
                                height: Dimensions.paddingSizeExtremeLarge),

                            !ResponsiveHelper.isDesktop(context)
                                ? Center(
                                    child: Text(
                                      'you_can_change_language'.tr,
                                      style: robotoRegular.copyWith(
                                          fontSize: Dimensions.fontSizeSmall,
                                          color:
                                              Theme.of(context).disabledColor),
                                    ),
                                  )
                                : const SizedBox.shrink(),
                            //
                            // ResponsiveHelper.isDesktop(context) ? Padding(
                            //   padding: const EdgeInsets.only(top: Dimensions.paddingSizeLarge),
                            //   child: LanguageSaveButton(localizationController: localizationController, fromMenu: widget.fromMenu),
                            // ) : const SizedBox.shrink(),
                          ]),
                    ),
                  )),
                ),
              ),
            )),
            ResponsiveHelper.isDesktop(context)
                ? const SizedBox.shrink()
                : LanguageSaveButton(
                    localizationController: localizationController,
                    fromMenu: widget.fromMenu),
          ]);
        }),
      ),
    );
  }
}

class LanguageSaveButton extends StatelessWidget {
  final LocalizationController localizationController;
  final bool? fromMenu;
  const LanguageSaveButton(
      {Key? key, required this.localizationController, this.fromMenu})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      // !ResponsiveHelper.isDesktop(context) ? Padding(
      //   padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
      //   child: Text(
      //     'you_can_change_language'.tr,
      //     style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).disabledColor),
      //   ),
      // ) : const SizedBox(),

      CustomButton(
        buttonText: 'save'.tr,
        margin: const EdgeInsets.all(Dimensions.paddingSizeSmall),
        onPressed: () {
          if (localizationController.languages.isNotEmpty &&
              localizationController.selectedIndex != -1) {
            localizationController.setLanguage(Locale(
              AppConstants.languages[localizationController.selectedIndex]
                  .languageCode!,
              AppConstants
                  .languages[localizationController.selectedIndex].countryCode,
            ));
            if (fromMenu!) {
              Navigator.pop(context);
            } else {}
          } else {
            showCustomSnackBar('select_a_language'.tr);
          }
        },
      ),
    ]);
  }
}
