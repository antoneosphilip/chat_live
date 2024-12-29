import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/auth_controller.dart';
import 'package:live_app/controller/splash_controller.dart';
import 'package:live_app/data/model/body/notification_body.dart';
import 'package:live_app/util/images.dart';
import 'package:live_app/view/base/no_internet_screen.dart';
import 'package:live_app/view/screens/auth/sign_in_screen.dart';

import '../../../helper/route_helper.dart';
import '../../../util/styles.dart';

class SplashScreen extends StatefulWidget {
  final NotificationBody? body;

  const SplashScreen({Key? key, required this.body}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  // late StreamSubscription<ConnectivityResult> _onConnectivityChanged;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Get.toNamed(RouteHelper.signIn);
    },);
    // bool firstTime = true;
    // _onConnectivityChanged = Connectivity()
    //     .onConnectivityChanged
    //     .listen((ConnectivityResult result) {
    //   if (!firstTime) {
    //     bool isNotConnected = result != ConnectivityResult.wifi &&
    //         result != ConnectivityResult.mobile;
    //     isNotConnected
    //         ? const SizedBox()
    //         : ScaffoldMessenger.of(context).hideCurrentSnackBar();
    //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //       backgroundColor: isNotConnected ? Colors.red : Colors.green,
    //       content: Text(
    //         isNotConnected ? 'no_connection'.tr : 'connected'.tr,
    //         textAlign: TextAlign.center,
    //       ),
    //     ));
    //     if (!isNotConnected) {
    //       _route();
    //     }
    //   }
    //   firstTime = false;
    // });
    // if (Get.find<AuthController>().isLoggedIn()) {
    //   Get.find<SplashController>().initSharedData();
    // }
    // _route();
  }

  @override
  void dispose() {
    super.dispose();

    // _onConnectivityChanged.cancel();
  }

  // void _route() {
  //   Get.find<SplashController>().getConfigData().then((isSuccess) {
  //     if (isSuccess) {
  //       Timer(const Duration(seconds: 1), () async {
  //         if (widget.body != null) {
  //           if (widget.body!.notificationType == NotificationType.order) {
  //           } else if (widget.body!.notificationType ==
  //               NotificationType.general) {
  //             Get.offNamed(
  //                 RouteHelper.getNotificationRoute(fromNotification: true));
  //           } else {
  //             Get.offNamed(RouteHelper.getChatRoute(
  //                 notificationBody: widget.body,
  //                 conversationID: widget.body!.conversationId,
  //                 fromNotification: true));
  //           }
  //         } else {
  //           if (Get.find<AuthController>().isLoggedIn()) {
  //             Get.find<AuthController>().updateToken();
  //             Get.offNamed(RouteHelper.getInitialRoute(fromSplash: true));
  //           }
  //           else{
  //             Get.toNamed(RouteHelper.signIn);
  //           }
  //         }
  //       });
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // if (Get.find<AuthController>().isLoggedIn()) {
    //   Get.find<SplashController>().initSharedData();
    // }
    return Scaffold(
      key: _globalKey,
      body: GetBuilder<SplashController>(builder: (splashController) {
        return Stack(
          children: [
            Container(
              width: Get.width,
              height: Get.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/image/back_ground2.webp'),
                    fit: BoxFit.fill),
              ),
            ),
            Center(
              child: splashController.hasConnection
                  ? Container(
                    height: 140.h,
                    width: 140.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        image: const DecorationImage(
                          image: AssetImage(Images.logo2),
                        )),
                  )
                  : NoInternetScreen(child: SplashScreen(body: widget.body)),
            ),
          ],
        );
      }),
    );
  }
}
