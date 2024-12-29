import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_app/view/base/custom_app_bar.dart';

class ImageViewerScreen extends StatelessWidget {
  const ImageViewerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String?> imageList = [];
    final PageController pageController = PageController();

    return Scaffold(
      appBar: CustomAppBar(title: 'product_images'.tr),
      body: Container(),
    );
  }
}
