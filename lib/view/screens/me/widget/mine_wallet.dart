import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:live_app/controller/user_controller.dart';

import '../../../widgets/custom_card.dart';
import '../../wallet/wallet_screen.dart';

class MineWallet extends StatelessWidget {
  final UserController userController;
  const MineWallet({super.key, required this.userController});

  @override
  Widget build(BuildContext context) {
    return        InkWell(
      onTap: () {
        Get.to(() => const WalletScreen());
      },
      child: CustomCard(
        // backgroundImage: 'assets/images/one_bg.png',
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Text('my_wallet'.tr),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width:
                MediaQuery.of(context).size.width,
                height: MediaQuery.of(context)
                    .size
                    .height *
                    0.15,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                  'assets/images/wallet_bg.webp'),
                            ),
                          ),
                          child: Center(
                            child: Row(
                              children: [
                                Image(
                                  width: 30.w,
                                  height: 30.h,
                                  image: AssetImage(
                                    'assets/images/diamond_icon.webp',
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  '${userController.userModelStatic?.wallet?.diamond}',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors
                                          .white),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding:
                                EdgeInsets.all(5),
                                child: Container(
                                  padding: EdgeInsets
                                      .symmetric(
                                      horizontal:
                                      15),
                                  decoration:
                                  BoxDecoration(
                                    image:
                                    DecorationImage(
                                      fit:
                                      BoxFit.fill,
                                      image: AssetImage(
                                          'assets/images/gold_bg.webp'),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Image(
                                        width: 25,
                                        height: 25,
                                        image:
                                        AssetImage(
                                          'assets/images/gold_icon.webp',
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '${userController.userModelStatic?.wallet?.gold}',
                                        style: TextStyle(
                                            fontSize:
                                            15,
                                            color: Colors
                                                .white),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding:
                                EdgeInsets.all(5),
                                child: Container(
                                  padding: const EdgeInsets
                                      .symmetric(
                                      horizontal:
                                      15),
                                  decoration:
                                  BoxDecoration(
                                    image:
                                    DecorationImage(
                                      fit:
                                      BoxFit.fill,
                                      image: AssetImage(
                                          'assets/images/game_bg.webp'),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Image(
                                        width: 25,
                                        height: 25,
                                        image:
                                        AssetImage(
                                          'assets/images/game_icon.webp',
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '${userController.userModelStatic?.wallet?.gameCoins}',
                                        style: TextStyle(
                                            fontSize:
                                            15,
                                            color: Colors
                                                .white),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
