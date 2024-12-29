import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/user_controller.dart';
import 'package:live_app/util/dimensions.dart';
import 'package:live_app/view/screens/me/widget/mine_other.dart';
import 'package:live_app/view/screens/me/widget/mine_wallet.dart';
import 'package:live_app/view/screens/me/widget/shop_card.dart';
import 'package:live_app/view/screens/me/widget/user_image.dart';
import 'package:live_app/view/screens/me/widget/user_information_mine.dart';
import 'package:live_app/view/screens/me/widget/user_name_id.dart';

import '../../../controller/reltionship_controller.dart';

class MyDashboardScreen extends StatefulWidget {
  const MyDashboardScreen({Key? key}) : super(key: key);

  @override
  State<MyDashboardScreen> createState() => _MyDashboardScreenState();
}

class _MyDashboardScreenState extends State<MyDashboardScreen> {
  @override
  void initState() {
    Get.put(RelationshipController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      builder: (userController) {
        // final bool isLoggedIn = Get.find<AuthController>().isLoggedIn();
        return
            // userController.userInfoStatic != null
            Scaffold(
                backgroundColor: Theme.of(context).cardColor,
                body: SingleChildScrollView(
                  child: Ink(
                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                    padding:
                        const EdgeInsets.only(top: Dimensions.paddingSizeLarge),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 120.h,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(24.r),
                                      topLeft: Radius.circular(24.r))),
                              padding: EdgeInsets.only(top: 10.h),
                              child: Column(children: [
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: Dimensions.paddingSizeDefault,
                                            right:
                                                Dimensions.paddingSizeDefault),
                                        child: Column(
                                          children: [
                                            UserInformationMine(
                                              userController: userController,
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            UserNameId(
                                              userController: userController,
                                            )
                                          ],
                                        ),
                                      ),
                                      const ShopCard(),
                                      MineWallet(
                                        userController: userController,
                                      ),
                                      MineOther(
                                        userController: userController,
                                      ),
                                    ]),
                                SizedBox(
                                  height: 100.h,
                                )
                              ]),
                            ),
                          ],
                        ),
                        UserMineImage(
                          userController: userController,
                        ),
                      ],
                    ),
                  ),
                ));
        // : const LoadingIndicator();
      },
    );
  }
}
