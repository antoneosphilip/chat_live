import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/recharge_controller.dart';
import 'package:live_app/data/model/response/user_model.dart';
import 'package:live_app/view/screens/wallet/recharge_widget.dart';

class DiamondCoinsScreen extends StatefulWidget {
  final UserModel? user;
  const DiamondCoinsScreen({super.key, required this.user});
  @override
  State<DiamondCoinsScreen> createState() => _DiamondCoinsScreenState();
}

class _DiamondCoinsScreenState extends State<DiamondCoinsScreen>
    with TickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, initialIndex: 0, vsync: this);
    // Get.find<RechargeController>().getRechargeList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage('assets/images/mine_diamond_bg.webp'),
                  fit: BoxFit.fill,
                  matchTextDirection: true),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  'Diamond Balance'.tr,
                  style: TextStyle(color: Colors.white54),
                ),
                Text(
                  '${widget.user?.wallet?.diamond}',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image:
                        AssetImage('assets/images/first_recharge_banner.png'),
                    fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(10)),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(
                50,
              ),
            ),
            child: TabBar(
              controller: tabController,
              unselectedLabelColor: Colors.black38,
              labelColor: Colors.deepPurple,
              indicator: BoxDecoration(
                  color: Colors.purpleAccent.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(50)),
              tabs: [
                Tab(
                  text: 'Recharge'.tr,
                ),
                Tab(
                  text: 'Details'.tr,
                ),
                Tab(
                  text: 'Recharge Record'.tr,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [RechargeWidget(user: widget.user,), Container(), Container()],
            ),
          )
        ],
      ),
    );
  }
}
