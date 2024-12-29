import 'package:get/get.dart';
import 'package:live_app/controller/localization_controller.dart';
import 'package:live_app/data/api/api_client.dart';
import 'package:live_app/util/app_constants.dart';
import 'package:live_app/util/html_type.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashRepo {
  ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  SplashRepo({required this.sharedPreferences, required this.apiClient});

  Future<Response> getConfigData() async {
    return await apiClient.getData(AppConstants.configUri);
  }

  Future<Response> getLandingPageData() async {
    return await apiClient.getData(AppConstants.landingPageUri);
  }

  Future<void> initSharedData() async {
    if (!sharedPreferences.containsKey(AppConstants.theme)) {
      sharedPreferences.setBool(AppConstants.theme, false);
    }
    if (!sharedPreferences.containsKey(AppConstants.countryCode)) {
      sharedPreferences.setString(
          AppConstants.countryCode, AppConstants.languages[0].countryCode!);
    }
    if (!sharedPreferences.containsKey(AppConstants.languageCode)) {
      sharedPreferences.setString(
          AppConstants.languageCode, AppConstants.languages[0].languageCode!);
    }

    if (!sharedPreferences.containsKey(AppConstants.searchHistory)) {
      sharedPreferences.setStringList(AppConstants.searchHistory, []);
    }
    if (!sharedPreferences.containsKey(AppConstants.notification)) {
      sharedPreferences.setBool(AppConstants.notification, true);
    }
    if (!sharedPreferences.containsKey(AppConstants.intro)) {
      sharedPreferences.setBool(AppConstants.intro, true);
    }
    if (!sharedPreferences.containsKey(AppConstants.notificationCount)) {
      sharedPreferences.setInt(AppConstants.notificationCount, 0);
    }
  }

  void disableIntro() {
    sharedPreferences.setBool(AppConstants.intro, false);
  }

  bool? showIntro() {
    return sharedPreferences.getBool(AppConstants.intro);
  }

  Future<Response> getHtmlText(HtmlType htmlType) async {
    return await apiClient.getData(
      htmlType == HtmlType.termsAndCondition
          ? AppConstants.termsAndConditionUri
          : htmlType == HtmlType.privacyPolicy
              ? AppConstants.privacyPolicyUri
              : htmlType == HtmlType.aboutUs
                  ? AppConstants.aboutUsUri
                  : htmlType == HtmlType.shippingPolicy
                      ? AppConstants.shippingPolicyUri
                      : htmlType == HtmlType.cancellation
                          ? AppConstants.cancellationUri
                          : AppConstants.refundUri,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        AppConstants.localizationKey:
            Get.find<LocalizationController>().locale.languageCode,
      },
    );
  }

  Future<Response> subscribeEmail(String email) async {
    return await apiClient
        .postData(AppConstants.subscriptionUri, {'email': email});
  }

  bool getSavedCookiesData() {
    return sharedPreferences.getBool(AppConstants.acceptCookies)!;
  }

  Future<void> saveCookiesData(bool data) async {
    try {
      await sharedPreferences.setBool(AppConstants.acceptCookies, data);
    } catch (e) {
      rethrow;
    }
  }

  void cookiesStatusChange(String? data) {
    if (data != null) {
      sharedPreferences.setString(AppConstants.cookiesManagement, data);
    }
  }

  bool getAcceptCookiesStatus(String data) =>
      sharedPreferences.getString(AppConstants.cookiesManagement) != null &&
      sharedPreferences.getString(AppConstants.cookiesManagement) == data;

  bool getSuggestedLocationStatus() {
    return sharedPreferences.getBool(AppConstants.suggestedLocation)!;
  }

  Future<void> saveSuggestedLocationStatus(bool data) async {
    try {
      await sharedPreferences.setBool(AppConstants.suggestedLocation, data);
    } catch (e) {
      rethrow;
    }
  }
}
