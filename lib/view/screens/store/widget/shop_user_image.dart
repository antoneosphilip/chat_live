import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:live_app/controller/store_controller.dart';
import 'package:svgaplayer_flutter/player.dart';

import '../../../../controller/user_controller.dart';
import '../../../../util/app_constants.dart';

class ShopUserImage extends StatelessWidget {
  final StoreController storeController;
  const ShopUserImage({super.key, required this.storeController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.3,
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(
                  // ${AppConstants.mediaUrl}/profile/
                  "${Get.find<UserController>().userModelStatic?.image}"),
            ),
            Container(
              width: 120,
              height: 120,
              child: Center(
                  child:
                  (storeController.selectedTypeStatic !=
                      null &&
                      storeController
                          .selectedItem !=
                          null &&
                      storeController
                          .selectedTypeStatic
                          ?.relatedTo ==
                          'user_avatar' &&
                      storeController
                          .selectedItem
                          ?.type ==
                          'svg')
                      ? SVGASimpleImage(
                    resUrl:
                    "${AppConstants.baseUrl}/${storeController.selectedItem?.svg}",
                  )
                      : SizedBox()),
            )
          ],
        ),
      ),
    );
  }
}
