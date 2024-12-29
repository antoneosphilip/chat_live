import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_app/util/dimensions.dart';
import 'package:live_app/util/styles.dart';

void showCustomSnackBar(String? message,
    {bool isError = true,
    Color color = Colors.red,
    bool getXSnackBar = false}) {
  if (message != null && message.isNotEmpty) {
    if (getXSnackBar) {
      Get.showSnackbar(GetSnackBar(
        backgroundColor: isError ? color : Colors.green,
        message: message,
        maxWidth: 500,
        duration: const Duration(seconds: 3),
        snackStyle: SnackStyle.FLOATING,
        margin: const EdgeInsets.only(
            left: Dimensions.paddingSizeSmall,
            right: Dimensions.paddingSizeSmall,
            bottom: 30),
        borderRadius: Dimensions.radiusSmall,
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
      ));
    } else {
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        dismissDirection: DismissDirection.horizontal,
        margin: EdgeInsets.only(
          right: Dimensions.paddingSizeSmall,
          top: Dimensions.paddingSizeSmall,
          bottom: Dimensions.paddingSizeSmall,
          left: Dimensions.paddingSizeSmall,
        ),
        duration: const Duration(seconds: 3),
        backgroundColor: isError ? Colors.red : Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.radiusSmall)),
        content: Center(
            child: Text(message,
                style: robotoMedium.copyWith(color: Colors.white))),
      ));
    }
  }
}
