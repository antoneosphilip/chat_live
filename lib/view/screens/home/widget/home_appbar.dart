import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/notification_controller.dart';
import '../../../../helper/route_helper.dart';
import '../../../../util/dimensions.dart';
import '../../../../util/styles.dart';
import '../../../widgets/notification_sign.dart';
import '../../search/search_screen.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  final double _preferredHeight = 80;
  final TabController? tabController;
  const HomeAppbar({super.key, this.tabController});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/appbar_bg.webp"),
          fit: BoxFit.fill,
        ),
      ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: TabBar(
          controller: tabController,
          indicatorColor: Colors.white,
          indicatorWeight: 3,
          indicatorPadding: const EdgeInsets.symmetric(horizontal: 40),
          labelColor: Colors.white,
          unselectedLabelColor: Theme.of(context).disabledColor,
          unselectedLabelStyle: robotoRegular.copyWith(
              color: Theme.of(context).disabledColor,
              fontSize: Dimensions.fontSizeSmall),
          padding: EdgeInsets.only(bottom: 3),
          tabs: [
            Tab(text: 'Home'.tr),
            Tab(text: 'MY Room'.tr),
          ],
        ),
        leading: InkWell(
          child: const Icon(CupertinoIcons.search_circle,
              size: 30, color: Colors.white),
          onTap: () => Get.to(() => const SearchScreen(
                queryText: '',
              )),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              child: GetBuilder<NotificationController>(
                  builder: (notificationController) {
                return Stack(alignment: Alignment.center, children: [
                  Icon(CupertinoIcons.bell, size: 25, color: Colors.white),
                  NotificationSign(
                    isActive: notificationController.hasNotification,
                  )
                ]);
              }),
              onTap: () => Get.toNamed(RouteHelper.getNotificationRoute()),
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(_preferredHeight);
}
