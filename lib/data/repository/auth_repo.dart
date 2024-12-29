import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:live_app/data/api/api_client.dart';
import 'package:live_app/data/model/body/signup_body.dart';
import 'package:live_app/data/model/body/social_log_in_body.dart';
import 'package:live_app/util/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> registration(SignUpBody signUpBody) async {
    return await apiClient.postData(
        AppConstants.registerUri, signUpBody.toJson());
  }

  Future<Response> login({String? phone, String? password}) async {
    Map<String, String> data = {
      "phone": phone!,
      "password": password!,
    };
    return await apiClient.postData(AppConstants.loginUri, data);
  }

  Future<Response> loginWithSocialMedia(
      SocialLogInBody socialLogInBody, int timeout) async {
    return await apiClient.postData(
        AppConstants.socialLoginUri, socialLogInBody.toJson(),
        timeout: timeout);
  }

  Future<Response> registerWithSocialMedia(
      SocialLogInBody socialLogInBody) async {
    return await apiClient.postData(
        AppConstants.socialRegisterUri, socialLogInBody.toJson());
  }

  Future<Response> updateToken({String notificationDeviceToken = ''}) async {
    String? deviceToken;
    if (notificationDeviceToken.isEmpty) {
      if (GetPlatform.isIOS && !GetPlatform.isWeb) {
        FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
            alert: true, badge: true, sound: true);
        NotificationSettings settings =
            await FirebaseMessaging.instance.requestPermission(
          alert: true,
          announcement: false,
          badge: true,
          carPlay: false,
          criticalAlert: false,
          provisional: false,
          sound: true,
        );
        if (settings.authorizationStatus == AuthorizationStatus.authorized) {
          deviceToken = await _saveDeviceToken();
        }
      } else {
        deviceToken = await _saveDeviceToken();
      }
      if (!GetPlatform.isWeb) {
        FirebaseMessaging.instance.subscribeToTopic(AppConstants.topic);
      }
    }
    return await apiClient.postData(AppConstants.tokenUri, {
      "_method": "put",
      "cm_firebase_token": notificationDeviceToken.isNotEmpty
          ? notificationDeviceToken
          : deviceToken
    });
  }

  Future<String?> _saveDeviceToken() async {
    String? deviceToken = '@';
    if (!GetPlatform.isWeb) {
      try {
        deviceToken = (await FirebaseMessaging.instance.getToken())!;
      } catch (_) {}
    }
    if (deviceToken != null) {
      if (kDebugMode) {
        print('--------Device Token---------- $deviceToken');
      }
    }
    return deviceToken;
  }

  Future<Response> forgetPassword(String? phone) async {
    return await apiClient
        .postData(AppConstants.forgetPasswordUri, {"phone": phone});
  }

  Future<Response> verifyToken(String? phone, String token) async {
    return await apiClient.postData(
        AppConstants.verifyTokenUri, {"phone": phone, "reset_token": token});
  }

  Future<Response> resetPassword(String? resetToken, String number,
      String password, String confirmPassword) async {
    return await apiClient.postData(
      AppConstants.resetPasswordUri,
      {
        "_method": "put",
        "reset_token": resetToken,
        "phone": number,
        "password": password,
        "confirm_password": confirmPassword
      },
    );
  }

  Future<Response> checkEmail(String email) async {
    return await apiClient
        .postData(AppConstants.checkEmailUri, {"email": email});
  }

  Future<Response> verifyEmail(String email, String token) async {
    return await apiClient.postData(
        AppConstants.verifyEmailUri, {"email": email, "token": token});
  }

  Future<Response> verifyPhone(String? phone, String otp) async {
    return await apiClient
        .postData(AppConstants.verifyPhoneUri, {"phone": phone, "otp": otp});
  }

  // for  user token
  Future<bool> saveUserToken(String token) async {
    apiClient.token = token;
    if (sharedPreferences.getString(AppConstants.userAddress) != null) {
      apiClient.updateHeader(
        token,
        sharedPreferences.getString(AppConstants.languageCode),
      );
    } else {
      apiClient.updateHeader(
        token,
        sharedPreferences.getString(AppConstants.languageCode),
      );
    }

    return await sharedPreferences.setString(AppConstants.token, token);
  }

  String getUserToken() {
    return sharedPreferences.getString(AppConstants.token) ?? "";
  }

  bool isLoggedIn() {
    return sharedPreferences.containsKey(AppConstants.token);
  }

  bool clearSharedData() {
    if (!GetPlatform.isWeb) {
      FirebaseMessaging.instance.unsubscribeFromTopic(AppConstants.topic);
      apiClient.postData(
          AppConstants.tokenUri, {"_method": "put", "cm_firebase_token": '@'});
    }
    sharedPreferences.remove(AppConstants.token);
    sharedPreferences.remove(AppConstants.guestId);
    sharedPreferences.setStringList(AppConstants.cartList, []);
    sharedPreferences.remove(AppConstants.userAddress);
    apiClient.token = null;
    apiClient.updateHeader(null, null);
    return true;
  }

  // for  Remember Email
  Future<void> saveUserNumberAndPassword(
      String number, String password, String countryCode) async {
    try {
      await sharedPreferences.setString(AppConstants.userPassword, password);
      await sharedPreferences.setString(AppConstants.userNumber, number);
      await sharedPreferences.setString(
          AppConstants.userCountryCode, countryCode);
    } catch (e) {
      rethrow;
    }
  }

  String getUserNumber() {
    return sharedPreferences.getString(AppConstants.userNumber) ?? "";
  }

  String getUserCountryCode() {
    return sharedPreferences.getString(AppConstants.userCountryCode) ?? "";
  }

  String getUserPassword() {
    return sharedPreferences.getString(AppConstants.userPassword) ?? "";
  }

  bool isNotificationActive() {
    return sharedPreferences.getBool(AppConstants.notification) ?? true;
  }

  void setNotificationActive(bool isActive) {
    if (isActive) {
      updateToken();
    }
    sharedPreferences.setBool(AppConstants.notification, isActive);
  }

  Future<bool> clearUserNumberAndPassword() async {
    await sharedPreferences.remove(AppConstants.userPassword);
    await sharedPreferences.remove(AppConstants.userCountryCode);
    return await sharedPreferences.remove(AppConstants.userNumber);
  }
}
