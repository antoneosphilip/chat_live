import 'dart:async';

import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/auth_controller.dart';
import 'package:live_app/controller/splash_controller.dart';
import 'package:live_app/helper/responsive_helper.dart';
import 'package:live_app/util/colors.dart';
import 'package:live_app/util/dimensions.dart';
import 'package:live_app/util/images.dart';
import 'package:live_app/view/base/custom_snackbar.dart';
import 'package:live_app/view/screens/create_family/widget/elvated_button.dart';
import 'package:live_app/view/screens/dashboard/widget/bottom_nav_item.dart';
import 'package:live_app/view/screens/dashboard/widget/container_gifts_daily_login.dart';
import 'package:live_app/view/screens/dashboard/widget/daily_login_alert_dialog.dart';
import 'package:live_app/view/screens/dashboard/widget/daily_login_container.dart';
import 'package:live_app/view/screens/dashboard/widget/daily_login_image.dart';
import 'package:live_app/view/screens/dashboard/widget/daily_login_remind_me.dart';
import 'package:live_app/view/screens/home/home_screen.dart';
import 'package:live_app/view/screens/me/my_dashboard_screen.dart';

import '../chat/conversation_screen.dart';
import '../chat/widget/chat_screen_widget.dart';

class DashboardScreen extends StatefulWidget {
  final int pageIndex;
  final bool fromSplash;

  const DashboardScreen(
      {Key? key, required this.pageIndex, this.fromSplash = false})
      : super(key: key);

  @override
  DashboardScreenState createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  PageController? _pageController;
  int _pageIndex = 0;
  late List<Widget> _screens;
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey();
  bool _canExit = GetPlatform.isWeb ? true : false;

  GlobalKey<ExpandableBottomSheetState> key = GlobalKey();

  late bool _isLogin;
  bool active = false;

  @override
  void initState() {
    super.initState();

    _isLogin = Get.find<AuthController>().isLoggedIn();

    _pageIndex = widget.pageIndex;

    _pageController = PageController(initialPage: widget.pageIndex);

    _screens = [
      const HomeScreen(),
      const MyDashboardScreen(),
      // const SizedBox(),
      const ConversationScreen(),
      // const SizedBox(),
    ];

    Future.delayed(const Duration(seconds: 1), () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return  const DailyLoginAlertDialog();
        },
      );
    });
  }

  Future<void> suggestAddressBottomSheet() async {}

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GetBuilder<SplashController>(builder: (splashController) {
      return WillPopScope(
          onWillPop: () async {
            if (_pageIndex != 0) {
              _setPage(0);
              return false;
            } else {
              if (splashController.isRefreshing) {
                showCustomSnackBar('please_wait_until_refresh_complete'.tr,
                    isError: true);
                return false;
              }
              if (!ResponsiveHelper.isDesktop(context)) {
                return false;
              } else {
                if (_canExit) {
                  return true;
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('back_press_again_to_exit'.tr,
                        style: const TextStyle(color: Colors.white)),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.green,
                    duration: const Duration(seconds: 2),
                    margin: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                  ));
                  _canExit = true;
                  Timer(const Duration(seconds: 2), () {
                    _canExit = false;
                  });
                  return false;
                }
              }
            }
          },
          child: Scaffold(
            key: _scaffoldKey,
            body: ExpandableBottomSheet(
              background: Stack(children: [
                PageView.builder(
                  controller: _pageController,
                  itemCount: _screens.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return _screens[index];
                  },
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child:
                      GetBuilder<SplashController>(builder: (splashController) {
                    return Stack(
                      children: [
                        Positioned(
                          bottom: 0,
                          child: Container(
                            width: size.width,
                            height: 40,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15))),
                          ),
                        ),
                        Container(
                          width: size.width,
                          height: 60,
                          decoration: BoxDecoration(
                            // color: Theme.of(context).cardColor,
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(Dimensions.radiusLarge)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 5)
                            ],
                          ),
                          child: Center(
                            child: SizedBox(
                              width: size.width,
                              height: 80,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    BottomNavItem(
                                      title: _pageIndex == 0 ? '' : 'rooms'.tr,
                                      selectedIcon: Images.homeSelected,
                                      unSelectedIcon: Images.homeUnselected,
                                      isSelected: _pageIndex == 0,
                                      onTap: () => _setPage(0),
                                    ),
                                    BottomNavItem(
                                      title: _pageIndex == 1 ? '' : 'mine'.tr,
                                      selectedIcon: Images.hmineSelected,
                                      unSelectedIcon: Images.mineUnselected,
                                      isSelected: _pageIndex == 1,
                                      onTap: () => _setPage(1),
                                    ),
                                    // BottomNavItem(
                                    //   title: _pageIndex == 2 ? '' : 'game'.tr,
                                    //   selectedIcon: Images.gameSelected,
                                    //   unSelectedIcon: Images.gameUnselected,
                                    //   isSelected: _pageIndex == 2,
                                    //   onTap: () => _setPage(2),
                                    // ),
                                    BottomNavItem(
                                      title:
                                          _pageIndex == 3 ? '' : 'message'.tr,
                                      selectedIcon: Images.msgSelected,
                                      unSelectedIcon: Images.msgUnselected,
                                      isSelected: _pageIndex == 3,
                                      onTap: () =>
                                          Get.to(() => ChatScreenWidget()),
                                    ),
                                    // BottomNavItem(
                                    //   title: _pageIndex == 4 ? '' : 'room'.tr,
                                    //   selectedIcon: Images.roomSelected,
                                    //   unSelectedIcon: Images.roomUnselected,
                                    //   isSelected: _pageIndex == 4,
                                    //   onTap: () => _setPage(4),
                                    // ),
                                  ]),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ]),
              persistentContentHeight: 100,
              onIsContractedCallback: () {},
              onIsExtendedCallback: () {},
              enableToggle: true,
              expandableContent: (widget.fromSplash &&
                      active &&
                      !ResponsiveHelper.isDesktop(context))
                  ? const SizedBox()
                  : (ResponsiveHelper.isDesktop(context) || !_isLogin)
                      ? const SizedBox()
                      : Dismissible(
                          key: UniqueKey(),
                          onDismissed: (direction) {},
                          child: Container()),
            ),
          ));
    });
  }

  void _setPage(int pageIndex) {
    setState(() {
      _pageController!.jumpToPage(pageIndex);
      _pageIndex = pageIndex;
    });
  }

  Widget trackView(BuildContext context, {required bool status}) {
    return Container(
        height: 3,
        decoration: BoxDecoration(
            color: status
                ? Theme.of(context).primaryColor
                : Theme.of(context).disabledColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault)));
  }
}
