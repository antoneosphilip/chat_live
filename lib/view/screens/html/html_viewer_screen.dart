import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/splash_controller.dart';
import 'package:live_app/util/html_type.dart';
import 'package:live_app/view/base/custom_app_bar.dart';
import 'package:live_app/view/base/web_page_title_widget.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../util/dimensions.dart';
import '../../base/footer_view.dart';

class HtmlViewerScreen extends StatefulWidget {
  final HtmlType htmlType;
  const HtmlViewerScreen({Key? key, required this.htmlType}) : super(key: key);

  @override
  State<HtmlViewerScreen> createState() => _HtmlViewerScreenState();
}

class _HtmlViewerScreenState extends State<HtmlViewerScreen> {
  @override
  void initState() {
    super.initState();

    Get.find<SplashController>().getHtmlText(widget.htmlType);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: widget.htmlType == HtmlType.termsAndCondition
              ? 'terms_conditions'.tr
              : widget.htmlType == HtmlType.aboutUs
                  ? 'about_us'.tr
                  : widget.htmlType == HtmlType.privacyPolicy
                      ? 'privacy_policy'.tr
                      : widget.htmlType == HtmlType.shippingPolicy
                          ? 'shipping_policy'.tr
                          : widget.htmlType == HtmlType.refund
                              ? 'refund_policy'.tr
                              : widget.htmlType == HtmlType.cancellation
                                  ? 'cancellation_policy'.tr
                                  : 'no_data_found'.tr),
      endDrawerEnableOpenDragGesture: false,
      body: GetBuilder<SplashController>(builder: (splashController) {
        return Center(
          child: splashController.htmlText != null
              ? SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      WebScreenTitleWidget(
                          title: widget.htmlType == HtmlType.termsAndCondition
                              ? 'terms_conditions'.tr
                              : widget.htmlType == HtmlType.aboutUs
                                  ? 'about_us'.tr
                                  : widget.htmlType == HtmlType.privacyPolicy
                                      ? 'privacy_policy'.tr
                                      : widget.htmlType ==
                                              HtmlType.shippingPolicy
                                          ? 'shipping_policy'.tr
                                          : widget.htmlType == HtmlType.refund
                                              ? 'refund_policy'.tr
                                              : widget.htmlType ==
                                                      HtmlType.cancellation
                                                  ? 'cancellation_policy'.tr
                                                  : 'no_data_found'.tr),
                      FooterView(
                          child: Ink(
                        width: Dimensions.webMaxWidth,
                        color: Theme.of(context).cardColor,
                        padding:
                            const EdgeInsets.all(Dimensions.paddingSizeSmall),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              HtmlWidget(
                                splashController.htmlText ?? '',
                                key: Key(widget.htmlType.toString()),
                                onTapUrl: (String url) {
                                  return launchUrlString(url,
                                      mode: LaunchMode.externalApplication);
                                },
                              )
                              // : Text('${splashController.htmlText}')
                            ]),
                      ))
                    ],
                  ),
                )
              : const CircularProgressIndicator(),
        );
      }),
    );
  }
}
