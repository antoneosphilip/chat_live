import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/vip_controller.dart';
import 'package:live_app/util/app_constants.dart';
import 'package:live_app/view/base/custom_image.dart';
import 'package:live_app/view/widgets/arrow_back.dart';
import 'package:live_app/view/widgets/svg/svg_with_png_and_texy.dart';
import 'package:svgaplayer_flutter/player.dart';

import '../../widgets/loading_idicator.dart';

class VipScreen extends StatefulWidget {
  const VipScreen({super.key});

  @override
  State<VipScreen> createState() => _VipScreenState();
}

class _VipScreenState extends State<VipScreen> {
  @override
  void initState() {
    Get.put(VipController());
    Get.find<VipController>().getVipList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.black54,
          elevation: 0,
          centerTitle: true,
          title: Text('Nobel Center'.tr),
          leading: const ArrowBack(),
        ),
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                'assets/images/vip_bg.webp',
              ),
            )),
            child: GetBuilder<VipController>(
              builder: (vipController) {
                // vipController.isLoading == true
                if (false) {
                  return const Center(
                        child: LoadingIndicator(),
                      );
                } else {
                  return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 45.h,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            child: TabBar(
                              isScrollable: true,
                              controller: vipController.tabController,
                              indicatorColor: Colors.white,
                              indicatorWeight: 3,
                              indicatorPadding:
                                  EdgeInsets.symmetric(horizontal: 20.w),
                              labelColor: Colors.white,
                              unselectedLabelColor:
                                  Theme.of(context).disabledColor,
                              tabs: [
                                ...vipController.vipListStatic.map((e) => Tab(
                                      text: 'vip${e.no}',
                                    ))
                              ],
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.25,
                            child: TabBarView(
                              controller: vipController.tabController,
                              children: [
                                ...vipController.vipListStatic.map(
                                  (e) => Center(
                                    child: Container(
                                      child: SvgWithPngAndText(
                                        width: 200,
                                        height: 200,
                                        svgPath:
                                            "${AppConstants.baseUrl}/${e.thumbnail}",
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/vip_big_bg.webp'),
                                      fit: BoxFit.fill)),
                              child: Column(
                                children: [
                                  Center(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 30),
                                      decoration: const BoxDecoration(
                                        color: Colors.white54,
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(50),
                                          bottomLeft: Radius.circular(50),
                                        ),
                                      ),
                                      child: Text(
                                        '${'Privileges'.tr} ${vipController.selectedVipStatic?.activePrivilegesCount}/${vipController.selectedVipStatic?.allPrivilegesCount}',
                                        style: const TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: GridView.builder(
                                          itemCount:
                                              vipController.selectedVipStatic != null
                                                  ? vipController.selectedVipStatic!
                                                      .privileges?.length
                                                  : 0,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 4,
                                          ),
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () {
                                                if (vipController
                                                        .selectedVipStatic!
                                                        .privileges![index]
                                                        .isActive ==
                                                    true) {
                                                  Widget? content;
                                                  if (vipController
                                                          .selectedVipStatic!
                                                          .privileges![index]
                                                          .image !=
                                                      null) {
                                                    if (vipController
                                                            .selectedVipStatic!
                                                            .privileges![index]
                                                            .imageType ==
                                                        'animated') {
                                                      content = SVGASimpleImage(
                                                        resUrl:
                                                            "${AppConstants.baseUrl}/${vipController.selectedVipStatic!.privileges![index].image}",
                                                      );
                                                    } else {
                                                      content = CustomImage(
                                                          image:
                                                              "${AppConstants.baseUrl}/${vipController.selectedVipStatic!.privileges![index].image}");
                                                    }
                                                  } else {
                                                    String? color =
                                                        vipController
                                                            .selectedVipStatic!
                                                            .privileges![index]
                                                            .color;
                                                    int colorInt =
                                                        int.parse("0xFF$color");
                                                    content = Text(
                                                      '${vipController.selectedVipStatic!.privileges![index].title}',
                                                      style: TextStyle(
                                                        color: Color(colorInt),
                                                      ),
                                                    );
                                                  }
                                                  Get.defaultDialog(
                                                      backgroundColor:
                                                          Colors.white,
                                                      title:
                                                          "${vipController.selectedVipStatic!.privileges![index].title}",
                                                      content: Container(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.3,
                                                        child: Center(
                                                          child: content,
                                                        ),
                                                      ));
                                                }
                                              },
                                              child: Container(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    CustomImage(
                                                      height: 30,
                                                      width: 30,
                                                      image:
                                                          "${AppConstants.baseUrl}/${vipController.selectedVipStatic!.privileges![index].thumbnail}",
                                                    ),
                                                    SizedBox(
                                                      height: 10.h,
                                                    ),
                                                    Text(
                                                      "${vipController.selectedVipStatic!.privileges![index].title}",
                                                      style: TextStyle(
                                                          fontSize: 8,
                                                          color: vipController
                                                                      .selectedVipStatic!
                                                                      .privileges?[
                                                                          index]
                                                                      .isActive ==
                                                                  true
                                                              ? Colors.white
                                                              : Colors.white54),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                bottom: 20, top: 10, left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${'open'.tr} vip${vipController.selectedVipStatic?.no} : ${vipController.selectedVipStatic?.price} ${'for'.tr} ${vipController.selectedVipStatic?.duration} ${'days'.tr}',
                                  style: TextStyle(color: Colors.white),
                                ),
                                ElevatedButton(
                                    onPressed: () {}, child: Text('buy'.tr))
                              ],
                            ),
                          )
                        ],
                      );
                }
              },
            )),
      ),
    );
  }
}
