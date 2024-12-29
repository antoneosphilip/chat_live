import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/auth_controller.dart';
import 'package:live_app/controller/banner_controller.dart';
import 'package:live_app/controller/chat_controller.dart';
import 'package:live_app/controller/country_controller.dart';
import 'package:live_app/controller/create_family_controller.dart';
import 'package:live_app/controller/events_controller.dart';
import 'package:live_app/controller/family_controller.dart';
import 'package:live_app/controller/home_controller.dart';
import 'package:live_app/controller/localization_controller.dart';
import 'package:live_app/controller/notification_controller.dart';
import 'package:live_app/controller/recharge_controller.dart';
import 'package:live_app/controller/room_controller.dart';
import 'package:live_app/controller/splash_controller.dart';
import 'package:live_app/controller/theme_controller.dart';
import 'package:live_app/controller/user_controller.dart';
import 'package:live_app/data/api/api_client.dart';
import 'package:live_app/data/model/response/language_model.dart';
import 'package:live_app/data/repository/auth_repo.dart';
import 'package:live_app/data/repository/banner_repo.dart';
import 'package:live_app/data/repository/create_family_repo.dart';
import 'package:live_app/data/repository/family_repo.dart';
import 'package:live_app/data/repository/language_repo.dart';
import 'package:live_app/data/repository/notification_repo.dart';
import 'package:live_app/data/repository/room_repo.dart';
import 'package:live_app/data/repository/splash_repo.dart';
import 'package:live_app/data/repository/user_repo.dart';
import 'package:live_app/data/repository/wallet_repo.dart';
import 'package:live_app/services/scho_service.dart';
import 'package:live_app/util/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/gift_controller.dart';
import '../controller/my_bag_controller.dart';
import '../controller/store_controller.dart';
import '../data/repository/chat_repo.dart';
import '../data/repository/country_repo.dart';
import '../data/repository/gift_repo.dart';

Future<Map<String, Map<String, String>>> init() async {
  // Core
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  Get.put(EventsController());
  Get.put(EchoService());

  Get.lazyPut(() => ApiClient(
      appBaseUrl: AppConstants.baseUrl, sharedPreferences: Get.find()));
  Get.lazyPut(() => HomeController());
  // Repository
  Get.lazyPut(
      () => SplashRepo(sharedPreferences: Get.find(), apiClient: Get.find()));
  Get.lazyPut(() => LanguageRepo());

  Get.lazyPut(
      () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));


  Get.lazyPut(() => UserRepo(apiClient: Get.find()));
  Get.lazyPut(() => BannerRepo(apiClient: Get.find()));
  Get.lazyPut(
      () => RoomRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(
      () => GiftRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(
      () => CountryRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

  Get.lazyPut(() =>
      NotificationRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

  Get.lazyPut(
      () => WalletRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(
      () => ChatRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

  // Controller
  Get.lazyPut(() => ThemeController(sharedPreferences: Get.find()));
  Get.lazyPut(() => SplashController(splashRepo: Get.find()));
  Get.lazyPut(() => LocalizationController(
      sharedPreferences: Get.find(), apiClient: Get.find()));

  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => UserController(userRepo: Get.find(),));
  Get.lazyPut(() => BannerController(bannerRepo: Get.find()));
  Get.lazyPut(() => RoomController(roomRepo: Get.find()));
  Get.lazyPut(() => GiftController(giftRepo: Get.find()));
  Get.lazyPut(() => CountryController(countryRepo: Get.find()));
  Get.lazyPut(() => FamilyRepo(apiClient: Get.find()));

  Get.lazyPut(() => FamilyController(familyRepo: Get.find()));
  Get.lazyPut(() => CreateFamilyRepo(apiClient: Get.find()));
  Get.lazyPut(() => CreateFamilyController(createFamilyRepo: Get.find()));

  Get.lazyPut(() => NotificationController(notificationRepo: Get.find()));

  Get.lazyPut(() => ChatController(chatRepo: Get.find()));
  Get.lazyPut(() => StoreController());
  Get.lazyPut(() => MyBagController());
  Get.lazyPut(() => RechargeController());

  // Retrieving localized data
  Map<String, Map<String, String>> languages = {};
  for (LanguageModel languageModel in AppConstants.languages) {
    String jsonStringValues = await rootBundle
        .loadString('assets/language/${languageModel.languageCode}.json');
    Map<String, dynamic> mappedJson = jsonDecode(jsonStringValues);
    Map<String, String> json = {};
    mappedJson.forEach((key, value) {
      json[key] = value.toString();
    });
    languages['${languageModel.languageCode}_${languageModel.countryCode}'] =
        json;
  }
  return languages;
}
