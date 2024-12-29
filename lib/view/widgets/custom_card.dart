import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/dimensions.dart';

class CustomCard extends StatelessWidget {
  final Widget? child;
  final String? backgroundImage;
  const CustomCard({super.key, this.child, this.backgroundImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backgroundImage == null
          ? BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[Get.isDarkMode ? 800 : 200]!,
                    spreadRadius: 1,
                    blurRadius: 5)
              ],
            )
          : BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
              image: DecorationImage(
                image: AssetImage(backgroundImage!),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[Get.isDarkMode ? 800 : 200]!,
                    spreadRadius: 1,
                    blurRadius: 5)
              ],
            ),
      padding: const EdgeInsets.symmetric(
          vertical: Dimensions.paddingSizeDefault,
          horizontal: Dimensions.paddingSizeDefault),
      margin: const EdgeInsets.all(Dimensions.paddingSizeDefault),
      child: child,
    );
  }
}
