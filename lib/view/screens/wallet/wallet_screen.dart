import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/user_controller.dart';
import 'package:live_app/view/screens/wallet/diamonds_screen.dart';
import 'package:live_app/view/screens/wallet/game_coins_screen.dart';
import 'package:live_app/view/screens/wallet/silver_coins_screen.dart';

import '../../../util/dimensions.dart';
import '../../../util/styles.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen>
    with TickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, initialIndex: 0, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: TabBar(
            controller: tabController,
            indicatorColor: Colors.black54,
            indicatorWeight: 3,
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 15),
            labelColor: Colors.black,
            unselectedLabelColor: Theme.of(context).disabledColor,
            unselectedLabelStyle: robotoRegular.copyWith(
                color: Colors.black, fontSize: Dimensions.fontSizeSmall),
            tabs: [
              Tab(text: 'Diamond'.tr),
              Tab(text: 'Silver Coins'.tr),
              Tab(text: 'Game Coins'.tr),
            ],
          ),
          leading: InkWell(
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onTap: () => Get.back(),
          ),
        ),
        body: GetBuilder<UserController>(
          builder: (controller) {
            return Container(
              padding: EdgeInsets.all(10),
              child: TabBarView(
                controller: tabController,
                children: [
                  DiamondCoinsScreen(
                    user: controller.userModelStatic,
                  ),
                  SilverCoinsScreen(
                    user: controller.userModelStatic,
                  ),
                  GameCoinsScreen(
                    user: controller.userModelStatic,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
