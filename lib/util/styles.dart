import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_app/util/app_constants.dart';
import 'package:live_app/util/dimensions.dart';

final robotoRegular = TextStyle(
  fontFamily: AppConstants.fontFamily,
  fontWeight: FontWeight.w400,
  fontSize: Dimensions.fontSizeDefault,
);

final robotoMedium = TextStyle(
  fontFamily: AppConstants.fontFamily,
  fontWeight: FontWeight.w500,
  fontSize: Dimensions.fontSizeDefault,
);

final robotoBold = TextStyle(
  fontFamily: AppConstants.fontFamily,
  fontWeight: FontWeight.w700,
  fontSize: Dimensions.fontSizeDefault,
);
final robotoLargeBold = TextStyle(
  fontFamily: AppConstants.fontFamily,
  fontWeight: FontWeight.w700,
  fontSize: Dimensions.fontSizeExtraLarge,
);
final robotoBlack = TextStyle(
  fontFamily: AppConstants.fontFamily,
  fontWeight: FontWeight.w900,
  fontSize: Dimensions.fontSizeLarge,
);
final robotoWhiteVeryBold = TextStyle(
  fontFamily: AppConstants.fontFamily,
  fontWeight: FontWeight.w900,
  fontSize: Dimensions.fontSizeLarge,
);

final robotoWhite = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: Dimensions.fontSizeSmall,
    color: Colors.white);
final robotoWhiteMedium = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: Dimensions.fontSizeDefault,
    color: Colors.white);
final robotoWhiteBold = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: Dimensions.fontSizeLarge,
    color: Colors.white);
final robotoWhiteDefaultBold = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: Dimensions.fontSizeDefault,
    color: Colors.white);
final robotoWhite700 = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: Dimensions.fontSizeLarge,
    color: Colors.white);
final robotoBlack2 = TextStyle(
  fontFamily: AppConstants.fontFamily,
  fontWeight: FontWeight.w300,
  fontSize: Dimensions.fontSizeLarge,
);
final robotoBlack3 = TextStyle(
  fontFamily: AppConstants.fontFamily,
  fontWeight: FontWeight.w600,
  fontSize: Dimensions.fontSizeDefault,
);
final robotoGreySmall = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontWeight: FontWeight.w300,
    fontSize: Dimensions.fontSizeDefault,
    color: Colors.grey);

final BoxDecoration riderContainerDecoration = BoxDecoration(
  borderRadius: const BorderRadius.all(Radius.circular(Dimensions.radiusSmall)),
  color: Theme.of(Get.context!).primaryColor.withOpacity(0.1),
  shape: BoxShape.rectangle,
);
