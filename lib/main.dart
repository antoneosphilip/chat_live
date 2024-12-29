import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/localization_controller.dart';
import 'package:live_app/controller/splash_controller.dart';
import 'package:live_app/controller/theme_controller.dart';
import 'package:live_app/data/model/body/notification_body.dart';
import 'package:live_app/helper/notification_helper.dart';
import 'package:live_app/helper/responsive_helper.dart';
import 'package:live_app/services/scho_service.dart';
import 'package:live_app/theme/dark_theme.dart';
import 'package:live_app/theme/light_theme.dart';
import 'package:live_app/util/app_constants.dart';
import 'package:live_app/util/messages.dart';
import 'package:live_app/view/screens/splash/splash_screen.dart';
import 'package:live_app/view/widgets/app_mask.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_strategy/url_strategy.dart';

import 'helper/get_di.dart' as di;
import 'helper/route_helper.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  if (ResponsiveHelper.isMobilePhone()) {
    HttpOverrides.global = MyHttpOverrides();
  }
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  Map<String, Map<String, String>> languages = await di.init();
  Get.find<EchoService>().listenPublic('app', 'BigHorn', (event) => {});
  Get.find<EchoService>().listenPublic('app', 'AllRoomGift', (event) => {});
  Get.find<EchoService>().listenPublic('app', 'AllSeatsGift', (event) => {});
  NotificationBody? body;
  try {
    final RemoteMessage? remoteMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (remoteMessage != null) {
      body = NotificationHelper.convertNotification(remoteMessage.data);
    }
    await NotificationHelper.initialize(flutterLocalNotificationsPlugin);
    FirebaseMessaging.onBackgroundMessage(myBackgroundMessageHandler);
  } catch (_) {}

  runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(languages: languages, body: body)));
}

class MyApp extends StatefulWidget {
  final Map<String, Map<String, String>>? languages;
  final NotificationBody? body;

  const MyApp({Key? key, required this.languages, required this.body})
      : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    _route();
  }

  void _route() async {
    // Get.find<SplashController>()
    //     .getConfigData(loadLandingData: GetPlatform.isWeb)
    //     .then((bool isSuccess) async {
    //   if (isSuccess) {
    //     if (Get.find<AuthController>().isLoggedIn()) {
    //       Get.find<AuthController>().updateToken();
    //     }
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(builder: (themeController) {
      return GetBuilder<LocalizationController>(builder: (localizeController) {
        return GetBuilder<SplashController>(builder: (splashController) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            child: GetMaterialApp(
              title: AppConstants.appName,
              debugShowCheckedModeBanner: false,
              navigatorKey: Get.key,
              scrollBehavior: const MaterialScrollBehavior().copyWith(
                dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
              ),
              theme: themeController.darkTheme ? dark() : light(),
              locale: DevicePreview.locale(context),
              // : localizeController.locale,
              translations: Messages(languages: widget.languages),
              fallbackLocale: Locale(AppConstants.languages[0].languageCode!,
                  AppConstants.languages[0].countryCode),
              // initialRoute: RouteHelper.getSplashRoute(widget.body),
              getPages: RouteHelper.routes,
              defaultTransition: Transition.topLevel,
              transitionDuration: const Duration(milliseconds: 500),
              home: SplashScreen(body: widget.body),
              builder: (context, child) {
                Widget app = Stack(
                  alignment: AlignmentDirectional.topStart,
                  fit: StackFit.loose,
                  children: [child!, const AppMask()],
                );
                return DevicePreview.isEnabled(context)
                    ? DevicePreview.appBuilder(context, app)
                    : app;
              },
            ),
          );
        });
      });
    });
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
