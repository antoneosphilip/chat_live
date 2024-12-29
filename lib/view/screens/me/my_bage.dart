import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/my_bag_controller.dart';
import 'package:live_app/controller/user_controller.dart';
import 'package:live_app/util/app_constants.dart';
import 'package:live_app/view/screens/me/widget/bage_container_tab_bar.dart';
import 'package:live_app/view/screens/me/widget/bage_top_container.dart';
import 'package:live_app/view/screens/me/widget/bage_user_image.dart';
import 'package:live_app/view/widgets/loading_idicator.dart';
import 'package:svgaplayer_flutter/player.dart';

import '../../../util/images.dart';

class MyBagScreen extends StatefulWidget {
  const MyBagScreen({super.key});

  @override
  State<MyBagScreen> createState() => _MyBagScreenState();
}

class _MyBagScreenState extends State<MyBagScreen> {
  TabController? tabController;
  @override
  void initState() {
    super.initState();
    if (Get.find<MyBagController>().typesListStatic.isEmpty) {
      Get.find<MyBagController>().getTypes();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<MyBagController>(
          builder: (controller) {
            if (false) {
              return LoadingIndicator();
            } else {
              return Container(
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
                              BageUserImage(myBagController: controller,),
                              SizedBox(
                                height: 20.h,
                              ),
                              Expanded(
                                child: Container(
                                  color: Colors.white70,
                                  child: Column(
                                    children: [
                                      BageTopContainer(myBagController: controller,),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Expanded(
                                        // Use Expanded instead of Flexible
                                        child: Container(
                                          padding: const EdgeInsets.all(10.0),
                                          child: controller.loading
                                              ? const LoadingIndicator()
                                              : BageContainerTabBar(myBagController: controller,)
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ]),
                        Center(
                            child: (controller.selectedType != null &&
                                    controller.selectedItemStatic != null &&
                                    controller.selectedType?.relatedTo ==
                                        'entry_effect' &&
                                    controller.selectedItemStatic?.type == 'svg' &&
                                    controller.isPreview == true)
                                ? InkWell(
                                    onTap: () {
                                      controller.endPreview();
                                    },
                                    child: SVGASimpleImage(
                                      resUrl:
                                          "${AppConstants.baseUrl}/${controller.selectedItemStatic?.svg}",
                                    ),
                                  )
                                : SizedBox()),
                      ],
                    ));
            }
          },
        ),
      ),
    );
  }
}
