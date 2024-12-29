import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../helper/route_helper.dart';
import '../../../widgets/custom_card.dart';
import '../../../widgets/image_button.dart';
import '../../vip/vip_screen.dart';
import '../my_bage.dart';

class ShopCard extends StatelessWidget {
  const ShopCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      backgroundImage:
      'assets/images/wallet_card_bg.webp',
      child: Row(
        mainAxisAlignment:
        MainAxisAlignment.spaceEvenly,
        children: [
          ImageButton(
            text: 'vip'.tr,
            image: 'assets/images/vip.webp',
            onTap: () {
              Get.to(VipScreen());
            },
          ),
          // ImageButton(
          //   text: 'pro'.tr,
          //   image: 'assets/images/pro.webp',
          //   onTap: () {},
          // ),
          ImageButton(
            text: 'shop'.tr,
            image: 'assets/images/'
                'shop.webp',
            onTap: () {
              Get.toNamed(RouteHelper.store);
            },
          ),
          ImageButton(
            text: 'my_bag'.tr,
            image: 'assets/images/bag.webp',
            onTap: () {
              Get.to(() => MyBagScreen());
            },
          ),
        ],
      ),
    );
  }
}
