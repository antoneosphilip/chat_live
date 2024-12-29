import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_app/data/model/body/notification_body.dart';
import 'package:live_app/data/model/body/social_log_in_body.dart';
import 'package:live_app/data/model/response/conversation_model.dart';
import 'package:live_app/util/html_type.dart';
import 'package:live_app/view/base/room/widget/edit_room.dart';
import 'package:live_app/view/screens/account_security/account_security.dart';
import 'package:live_app/view/screens/all_families/all_families_screen.dart';
import 'package:live_app/view/screens/app_mode/app_mode_screen.dart';
import 'package:live_app/view/screens/auth/sign_in_screen.dart';
import 'package:live_app/view/screens/auth/sign_up_screen.dart';
import 'package:live_app/view/screens/bind_phone_number/bind_phone_number.dart';
import 'package:live_app/view/screens/black_list/black_list.dart';
import 'package:live_app/view/screens/blocked_moments/blocked_moments.dart';
import 'package:live_app/view/screens/chat/chat_screen.dart';
import 'package:live_app/view/screens/chat/conversation_screen.dart';
import 'package:live_app/view/screens/create_family/create_family_with_data.dart';
import 'package:live_app/view/screens/dashboard/dashboard_screen.dart';
import 'package:live_app/view/screens/delete_massege_history/delete_message_history.dart';
import 'package:live_app/view/screens/family/user_family_screen.dart';
import 'package:live_app/view/screens/general_setting/genral_setting.dart';
import 'package:live_app/view/screens/html/html_viewer_screen.dart';
import 'package:live_app/view/screens/invite_friends/invite_friends.dart';
import 'package:live_app/view/screens/language/language_screen.dart';
import 'package:live_app/view/screens/network_test/network_test.dart';
import 'package:live_app/view/screens/notification/notification_screen.dart';
import 'package:live_app/view/screens/privacy_policy/privacy_policy.dart';
import 'package:live_app/view/screens/profile/profile_screen.dart';
import 'package:live_app/view/screens/profile/update_profile_screen.dart';
import 'package:live_app/view/screens/room/audio_room_screen.dart';
import 'package:live_app/view/screens/search/search_screen.dart';
import 'package:live_app/view/screens/setting/setting_screen.dart';
import 'package:live_app/view/screens/splash/splash_screen.dart';
import 'package:live_app/view/screens/users/edit_profile_Screen.dart';
import 'package:live_app/view/screens/users/gender_screen.dart';
import 'package:live_app/view/screens/users/nick_name_screen.dart';

import '../view/base/room/setting_room_screen.dart';
import '../view/screens/room/agora/audio_room_Screen.dart';
import '../view/screens/store/store_home_screen.dart';
import '../view/screens/users/signuture_screen.dart';

class RouteHelper {
  static const String initial = '/';
  static const String splash = '/splash';
  static const String language = '/language';
  static const String onBoarding = '/on-boarding';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String verification = '/verification';
  static const String accessLocation = '/access-location';
  static const String pickMap = '/pick-map';
  static const String interest = '/interest';
  static const String main = '/main';
  static const String forgotPassword = '/forgot-password';
  static const String resetPassword = '/reset-password';
  static const String search = '/search';
  static const String room = '/room';
  static const String store = '/store';
  static const String agoraRoom = '/agoraRoom';

  static const String orderDetails = '/order-details';
  static const String profile = '/profile';
  static const String updateProfile = '/update-profile';
  static const String coupon = '/coupon';
  static const String notification = '/notification';
  static const String map = '/map';
  static const String address = '/address';
  static const String orderSuccess = '/order-successful';
  static const String payment = '/payment';
  static const String checkout = '/checkout';
  static const String orderTracking = '/track-order';
  static const String basicCampaign = '/basic-campaign';
  static const String html = '/html';
  static const String categories = '/categories';
  static const String categoryItem = '/category-item';
  static const String popularItems = '/popular-items';
  static const String itemCampaign = '/item-campaign';
  static const String support = '/help-and-support';
  static const String rateReview = '/rate-and-review';
  static const String update = '/update';
  static const String cart = '/cart';
  static const String addAddress = '/add-address';
  static const String editAddress = '/edit-address';
  static const String storeReview = '/store-review';
  static const String allStores = '/stores';
  static const String itemImages = '/item-images';
  static const String parcelCategory = '/parcel-category';
  static const String parcelLocation = '/parcel-location';
  static const String parcelRequest = '/parcel-request';
  static const String searchStoreItem = '/search-store-item';
  static const String order = '/order';
  static const String itemDetails = '/item-details';
  static const String wallet = '/wallet';
  static const String referAndEarn = '/refer-and-earn';
  static const String messages = '/messages';
  static const String conversation = '/conversation';
  static const String restaurantRegistration = '/restaurant-registration';
  static const String deliveryManRegistration = '/delivery-man-registration';
  static const String refund = '/refund';

  static const String selectRideMapLocation = '/select-rider-map-location';
  static const String selectCarScreen = '/select-car-screen';
  static const String carDetailsScreen = '/car-details-screen';
  static const String bookingCheckoutScreen = '/booking-checkout-screen';
  static const String tripHistoryScreen = '/trip-history-screen';
  static const String orderStatusScreen = '/order-status-screen';
  static const String tripCompletedConfirmationScreen =
      '/trip-complete-confirmation-screen';
  static const String taxiCouponScreen = '/taxi-coupon-screen';
  static const String digitalPaymentScreen = '/digital-payment-screen';
  static const String offlinePaymentScreen = '/offline-payment-screen';
  static const String flashSaleDetailsScreen = '/flash-sale-details-screen';
  static const String guestTrackOrderScreen = '/guest-track-order-screen';
  static const String settingScreen = '/setting_screen';
  static const String appMode = '/app_mode';
  static const String deleteMessage = '/delete_message';
  static const String accountSecurity = '/account_security';
  static const String changePhoneNumberScreen = '/change_phone_number_screen';
  static const String blackList = '/black_list';
  static const String blockedMoments = '/blocked_moments';
  static const String privacyPolicy = '/privacy_policy';
  static const String generalSetting = '/general_setting';
  static const String createFamilyWithData = '/create_family_with_data';
  static const String allFamilies = '/all_families';
  static const String roomSetting = '/room_setting';
  static const String userFamily = '/user_familt';
  static const String editProfile = '/edit_profile';
  static const String nickName = '/nick_name';
  static const String signature = '/signature';
  static const String inviteFriends = '/invite_friends';
  static const String networkTest = '/network_test';
  static const String genderScreen = '/gender_screen';
  static const String editRoom = '/edit_room';

  static String getInitialRoute({bool fromSplash = false}) =>
      '$initial?from-splash=$fromSplash';

  static String getSplashRoute(NotificationBody? body) {
    String data = 'null';
    if (body != null) {
      List<int> encoded = utf8.encode(jsonEncode(body.toJson()));
      data = base64Encode(encoded);
    }
    return '$splash?data=$data';
  }

  static String getLanguageRoute(String page) => '$language?page=$page';

  static String getSignInRoute(String page) => '$signIn?page=$page';

  static String getSignUpRoute() => signUp;

  static String getVerificationRoute(
      String? number, String? token, String page, String pass) {
    return '$verification?page=$page&number=$number&token=$token&pass=$pass';
  }

  static String getInterestRoute() => interest;

  static String getMainRoute(String page) => '$main?page=$page';

  static String getForgotPassRoute(
      bool fromSocialLogin, SocialLogInBody? socialLogInBody) {
    String? data;
    if (fromSocialLogin) {
      data = base64Encode(utf8.encode(jsonEncode(socialLogInBody!.toJson())));
    }
    return '$forgotPassword?page=${fromSocialLogin ? 'social-login' : 'forgot-password'}&data=${fromSocialLogin ? data : 'null'}';
  }

  static String getResetPasswordRoute(
          String? phone, String token, String page) =>
      '$resetPassword?phone=$phone&token=$token&page=$page';

  static String getSearchRoute({String? queryText}) =>
      '$search?query=${queryText ?? ''}';

  static String getProfileRoute() => profile;

  static String getUpdateProfileRoute() => updateProfile;

  static String getNotificationRoute({bool? fromNotification}) =>
      '$notification?from=${fromNotification.toString()}';

  static String getHtmlRoute(String page) => '$html?page=$page';

  static String getWalletRoute(bool fromWallet,
          {String? fundStatus, String? token}) =>
      '$wallet?page=${fromWallet ? 'wallet' : 'loyalty_points'}&payment_status=$fundStatus&token=$token';

  static String getChatRoute(
      {required NotificationBody? notificationBody,
      User? user,
      int? conversationID,
      int? index,
      bool? fromNotification}) {
    String notificationBody0 = 'null';
    if (notificationBody != null) {
      notificationBody0 =
          base64Encode(utf8.encode(jsonEncode(notificationBody.toJson())));
    }
    String user0 = 'null';
    if (user != null) {
      user0 = base64Encode(utf8.encode(jsonEncode(user.toJson())));
    }
    return '$messages?notification=$notificationBody0&user=$user0&conversation_id=$conversationID&index=$index&from=${fromNotification.toString()}';
  }

  static String getConversationRoute() => conversation;

  static String getFlashSaleDetailsScreen(int id) =>
      '$flashSaleDetailsScreen?id=$id';

  static List<GetPage> routes = [
    GetPage(
      name: initial,
      page: () => getRoute(
        DashboardScreen(
          pageIndex: 0,
          fromSplash: Get.parameters['from-splash'] == 'true',
        ),
      ),
    ),
    GetPage(
      name: generalSetting,
      page: () => getRoute(const GeneralSetting()),
    ),
    GetPage(
      name: editRoom,
      page: () => getRoute(const EditRoom()),
    ),
    GetPage(
      name: userFamily,
      page: () => getRoute( UserFamilyScreen(id: Get.arguments['id'])),
    ),
    GetPage(
      name: privacyPolicy,
      page: () => getRoute(
        const PrivacyPolicy(),
      ),
    ),
    GetPage(
      name: allFamilies,
      page: () => getRoute(
          const AllFamiliesScreen(),
      ),
    ),
    GetPage(
      name: inviteFriends,
      page: () => getRoute(
         InviteFriendsScreen(),
      ),
    ),

    GetPage(
      name: createFamilyWithData,
      page: () => getRoute(
        CreateFamilyWithData(image: Get.arguments['image'], gold:  Get.arguments['gold'],),
      ),
    ),
    GetPage(
      name: genderScreen,
      page: () => getRoute(
        GenderScreen(),
      ),
    ),
    GetPage(
      name: roomSetting,
      page: () => getRoute(
         SettingRoomScreen() ,
      ),
    ),
    GetPage(
      name: editProfile,
      page: () => getRoute(
         const EditProfileScreen() ,
      ),
    ),
    GetPage(
      name: nickName,
      page: () => getRoute(
         NickNameScreen(firstName: Get.arguments['name'],) ,
      ),
    ),
    GetPage(
      name: signature,
      page: () => getRoute(
        SignatureScreen() ,
      ),
    ),
    GetPage(
      name: blackList,
      page: () => getRoute(
        const BlackList(),
      ),
    ),
    GetPage(
      name: blockedMoments,
      page: () => getRoute(
        const BlockedMoments(),
      ),
    ),
    GetPage(
      name: changePhoneNumberScreen,
      page: () => getRoute(
        BindPhoneNumber(),
      ),
    ),
    GetPage(
      name: networkTest,
      page: () => getRoute(
        const NetworkTest(),
      ),
    ),
    GetPage(
        name: splash,
        page: () {
          NotificationBody? data;
          if (Get.parameters['data'] != 'null') {
            List<int> decode =
                base64Decode(Get.parameters['data']!.replaceAll(' ', '+'));
            data = NotificationBody.fromJson(jsonDecode(utf8.decode(decode)));
          }
          return SplashScreen(body: data);
        }),
    GetPage(
        name: accountSecurity,
        page: () {
          return const AccountSecurity();
        }),
    GetPage(
        name: language,
        page: () =>
            ChooseLanguageScreen(fromMenu: Get.parameters['page'] == 'menu')),
    GetPage(name: settingScreen, page: () => const SettingScreen()),
    GetPage(
        name: signIn,
        page: () => SignInScreen(
              exitFromApp: Get.parameters['page'] == signUp ||
                  Get.parameters['page'] == splash ||
                  Get.parameters['page'] == onBoarding,
              backFromThis: Get.parameters['page'] != splash &&
                  Get.parameters['page'] != onBoarding,
            )),
    GetPage(name: signUp, page: () => const SignUpScreen()),
    GetPage(
      name: room,
      page: () {
        return const AudioRoomScreen();
      },
    ),
    GetPage(
        name: main,
        page: () {
          Map pages = {
            'home': 0,
            'favourite': 1,
            'cart': 2,
            'order': 3,
            'menu': 4,
          };
          return getRoute(
            DashboardScreen(
              pageIndex: pages[Get.parameters['page']],
            ),
          );
        }),
    GetPage(
        name: search,
        page: () => getRoute(SearchScreen(queryText: Get.parameters['query']))),
    GetPage(name: appMode, page: () => getRoute(const AppModeScreen())),
    GetPage(
        name: deleteMessage,
        page: () => getRoute(const DeleteMessageHistory())),
    GetPage(name: profile, page: () => getRoute(const ProfileScreen())),
    // GetPage(
    //     name: updateProfile, page: () => getRoute(const UpdateProfileScreen())),
    GetPage(
        name: notification,
        page: () => getRoute(NotificationScreen(
            fromNotification: Get.parameters['from'] == 'true'))),
    GetPage(
        name: html,
        page: () => HtmlViewerScreen(
              htmlType: Get.parameters['page'] == 'terms-and-condition'
                  ? HtmlType.termsAndCondition
                  : Get.parameters['page'] == 'privacy-policy'
                      ? HtmlType.privacyPolicy
                      : Get.parameters['page'] == 'shipping-policy'
                          ? HtmlType.shippingPolicy
                          : Get.parameters['page'] == 'cancellation-policy'
                              ? HtmlType.cancellation
                              : Get.parameters['page'] == 'refund-policy'
                                  ? HtmlType.refund
                                  : HtmlType.aboutUs,
            )),
    GetPage(
      name: messages,
      page: () {
        NotificationBody? notificationBody;
        if (Get.parameters['notification'] != 'null') {
          notificationBody = NotificationBody.fromJson(jsonDecode(utf8.decode(
              base64Url.decode(
                  Get.parameters['notification']!.replaceAll(' ', '+')))));
        }
        User? user;
        if (Get.parameters['user'] != 'null') {
          user = User.fromJson(jsonDecode(utf8.decode(
              base64Url.decode(Get.parameters['user']!.replaceAll(' ', '+')))));
        }
        return getRoute(ChatScreen(
          notificationBody: notificationBody,
          user: user,
          index: Get.parameters['index'] != 'null'
              ? int.parse(Get.parameters['index']!)
              : null,
          // fromNotification: Get.parameters['from'] == 'true',
          conversationID: Get.parameters['conversation_id'] != 'null'
              ? int.parse(Get.parameters['conversation_id']!)
              : null,
        ));
      },
    ),
    GetPage(name: conversation, page: () => const ConversationScreen()),
    GetPage(name: store, page: () => const StoreHomeScreen()),
    // GetPage(name: agoraRoom, page: () =>  const AudioRoomAgoraScreen(roomId: 0, userModel: user,))

  ];

  static Widget getRoute(Widget navigateTo,
      {dynamic locationScreen, bool byPuss = false}) {
    return navigateTo;
  }
}
