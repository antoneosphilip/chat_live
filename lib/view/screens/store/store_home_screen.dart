import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/store_controller.dart';
import 'package:live_app/controller/user_controller.dart';
import 'package:live_app/util/app_constants.dart';
import 'package:live_app/view/screens/store/widget/shop_buy_custom.dart';
import 'package:live_app/view/screens/store/widget/shop_container.dart';
import 'package:live_app/view/screens/store/widget/shop_user_image.dart';
import 'package:svgaplayer_flutter/player.dart';

import '../../../util/images.dart';
import '../../widgets/loading_idicator.dart';

class StoreHomeScreen extends StatefulWidget {
  const StoreHomeScreen({super.key});

  @override
  State<StoreHomeScreen> createState() => _StoreHomeScreenState();
}

class _StoreHomeScreenState extends State<StoreHomeScreen> {
  @override
  void initState() {
    super.initState();
    // Get.find<StoreController>().typesListStatic.isEmpty
    if (true) {
      Get.find<StoreController>().getTypes();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: GetBuilder<StoreController>(
        builder: (storeController) {
          return
            storeController.loading
              ? const LoadingIndicator()
              : Container(
                  height: Get.height,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/image/main/app_bg.jpeg'),
                          fit: BoxFit.fill)),
                  child: Stack(
                    children: [
                      Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ShopUserImage(storeController: storeController),
                            SizedBox(
                              height: 20.h,
                            ),
                            ShopContainer(storeController: storeController,),
                            const ShopBuyCustom(),
                          ]),
                      Center(
                        child: (storeController.selectedTypeStatic != null &&
                                storeController.selectedItem != null &&
                                storeController.selectedTypeStatic?.relatedTo ==
                                    'entry_effect' &&
                                storeController.selectedItem?.type == 'svg' &&
                                storeController.isPreview == true)
                            ? InkWell(
                                onTap: () {
                                  storeController.endPreview();
                                },
                                child: SVGASimpleImage(
                                  resUrl:
                                      "${AppConstants.baseUrl}/${storeController.selectedItem?.svg}",
                                ),
                              )
                            : SizedBox(),
                      ),
                    ],
                  ),
                );
        },
      )),
    );
  }
}
