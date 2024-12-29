import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../controller/splash_controller.dart';
import '../../data/model/response/config_model.dart';
import '../../helper/responsive_helper.dart';
import '../../helper/route_helper.dart';
import '../../util/dimensions.dart';
import '../../util/images.dart';
import '../../util/styles.dart';
import 'custom_snackbar.dart';
import 'hover/text_hover.dart';

class FooterView extends StatefulWidget {
  final Widget child;
  final double minHeight;
  final bool visibility;
  const FooterView(
      {Key? key,
      required this.child,
      this.minHeight = 0.65,
      this.visibility = true})
      : super(key: key);

  @override
  State<FooterView> createState() => _FooterViewState();
}

class _FooterViewState extends State<FooterView> {
  final TextEditingController _newsLetterController = TextEditingController();
  final ConfigModel? _config = Get.find<SplashController>().configModel;
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      ConstrainedBox(
        constraints: BoxConstraints(
            minHeight:
                (widget.visibility && ResponsiveHelper.isDesktop(context))
                    ? MediaQuery.of(context).size.height * widget.minHeight
                    : MediaQuery.of(context).size.height * 0.7),
        child: widget.child,
      ),
      (widget.visibility && ResponsiveHelper.isDesktop(context))
          ? Container(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              width: context.width,
              margin: const EdgeInsets.only(top: Dimensions.paddingSizeLarge),
              child: Center(
                  child: Column(children: [
                Container(
                  margin: const EdgeInsets.only(
                      top: Dimensions.paddingSizeExtremeLarge),
                  padding: const EdgeInsets.symmetric(
                      horizontal: Dimensions.paddingSizeDefault,
                      vertical: Dimensions.paddingSizeDefault),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor.withOpacity(0.85),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radiusDefault),
                        topRight: Radius.circular(Dimensions.radiusDefault)),
                  ),
                  width: Dimensions.webMaxWidth,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(width: Dimensions.paddingSizeExtraLarge),
                        Expanded(
                            flex: 4,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                      height: Dimensions.paddingSizeExtraLarge),
                                  Image.asset(Images.logo,
                                      width: 126, height: 40),
                                  const SizedBox(
                                      height: Dimensions.paddingSizeSmall),
                                  Text(
                                      'subscribe_to_out_new_channel_to_get_latest_updates'
                                          .tr,
                                      style: robotoRegular.copyWith(
                                          fontSize: Dimensions.fontSizeSmall)),
                                  const SizedBox(
                                      height: Dimensions.paddingSizeSmall),
                                  Container(
                                    width: 300,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.radiusDefault),
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.05),
                                            blurRadius: 2)
                                      ],
                                    ),
                                    child: Row(children: [
                                      const SizedBox(width: 20),
                                      Expanded(
                                          child: TextField(
                                        controller: _newsLetterController,
                                        expands: false,
                                        style: robotoMedium.copyWith(
                                            color: Colors.black,
                                            fontSize:
                                                Dimensions.fontSizeExtraSmall),
                                        decoration: InputDecoration(
                                            hintText: 'your_email_address'.tr,
                                            hintStyle: robotoRegular.copyWith(
                                                color: Colors.grey,
                                                fontSize: Dimensions
                                                    .fontSizeExtraSmall),
                                            border: InputBorder.none,
                                            isCollapsed: true),
                                        maxLines: 1,
                                      )),
                                      GetBuilder<SplashController>(
                                          builder: (splashController) {
                                        return InkWell(
                                          onTap: () {
                                            String email = _newsLetterController
                                                .text
                                                .trim()
                                                .toString();
                                            if (email.isEmpty) {
                                              showCustomSnackBar(
                                                  'enter_email_address'.tr);
                                            } else if (!GetUtils.isEmail(
                                                email)) {
                                              showCustomSnackBar(
                                                  'enter_a_valid_email_address'
                                                      .tr);
                                            } else {
                                              Get.find<SplashController>()
                                                  .subscribeMail(email)
                                                  .then((value) {
                                                if (value) {
                                                  _newsLetterController.clear();
                                                }
                                              });
                                            }
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 2, vertical: 2),
                                            decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimensions
                                                            .radiusDefault)),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 5),
                                            child: !splashController.isLoading
                                                ? Text('subscribe'.tr,
                                                    style: robotoRegular.copyWith(
                                                        color: Colors.white,
                                                        fontSize: Dimensions
                                                            .fontSizeExtraSmall))
                                                : const SizedBox(
                                                    height: 15,
                                                    width: 20,
                                                    child:
                                                        CircularProgressIndicator(
                                                            color:
                                                                Colors.white)),
                                          ),
                                        );
                                      }),
                                    ]),
                                  ),
                                ])),
                        Expanded(
                          flex: 8,
                          child: Padding(
                            padding: const EdgeInsets.all(
                                Dimensions.paddingSizeExtremeLarge),
                            child: Container(
                              padding: const EdgeInsets.all(
                                  Dimensions.paddingSizeDefault),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    Dimensions.radiusDefault),
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.05),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                //crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox(
                                          height:
                                              Dimensions.paddingSizeDefault),
                                      FooterButton(
                                          title: 'privacy_policy'.tr,
                                          route: RouteHelper.getHtmlRoute(
                                              'privacy-policy')),
                                      const SizedBox(
                                          height:
                                              Dimensions.paddingSizeDefault),
                                      FooterButton(
                                          title: 'terms_and_condition'.tr,
                                          route: RouteHelper.getHtmlRoute(
                                              'terms-and-condition')),
                                    ],
                                  ),
                                  Column(children: [
                                    Image.asset(Images.sendUsMail,
                                        width: 50, height: 50),
                                    const SizedBox(
                                        height: Dimensions.paddingSizeSmall),
                                    Text('send_us_mail'.tr, style: robotoBold),
                                    const SizedBox(
                                        height: Dimensions.paddingSizeSmall),
                                  ]),
                                  Column(children: [
                                    Image.asset(Images.contactUs,
                                        width: 50, height: 50),
                                    const SizedBox(
                                        height: Dimensions.paddingSizeSmall),
                                    Text('contact_us'.tr, style: robotoBold),
                                    const SizedBox(
                                        height: Dimensions.paddingSizeSmall),
                                  ]),
                                  Column(children: [
                                    Image.asset(Images.findUsHere,
                                        width: 50, height: 50),
                                    const SizedBox(
                                        height: Dimensions.paddingSizeSmall),
                                    Text('find_us_here'.tr, style: robotoBold),
                                    const SizedBox(
                                        height: Dimensions.paddingSizeSmall),
                                  ]),
                                ],
                              ),
                            ),
                          ),
                        )
                      ]),
                ),
                Divider(
                  thickness: 0.5,
                  color: Theme.of(context).disabledColor,
                  indent: 0,
                  height: 0,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: Dimensions.paddingSizeExtraSmall),
                  color: Theme.of(context).primaryColor.withOpacity(0.2),
                  child: Center(
                    child: SizedBox(
                      width: Dimensions.webMaxWidth,
                      height: 50,
                      child: Center(),
                    ),
                  ),
                ),
              ])),
            )
          : const SizedBox.shrink(),
    ]);
  }

  _launchURL(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class FooterButton extends StatelessWidget {
  final String title;
  final String route;
  final bool url;
  const FooterButton(
      {Key? key, required this.title, required this.route, this.url = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextHover(builder: (hovered) {
      return InkWell(
        hoverColor: Colors.transparent,
        onTap: route.isNotEmpty
            ? () async {
                if (url) {
                  if (await canLaunchUrlString(route)) {
                    launchUrlString(route,
                        mode: LaunchMode.externalApplication);
                  }
                } else {
                  Get.toNamed(route);
                }
              }
            : null,
        child: Text(title,
            style: hovered
                ? robotoMedium.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontSize: Dimensions.fontSizeExtraSmall)
                : robotoRegular.copyWith(
                    fontSize: Dimensions.fontSizeExtraSmall)),
      );
    });
  }
}
