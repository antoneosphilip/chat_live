import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/recharge_controller.dart';
import 'package:live_app/data/model/response/user_model.dart';
import 'package:live_app/util/styles.dart';
import 'package:live_app/view/screens/create_family/widget/elvated_button.dart';
import 'package:live_app/view/screens/wallet/widget/custom_line.dart';
import 'package:live_app/view/screens/wallet/widget/google_play_container.dart';
import 'package:live_app/view/screens/wallet/widget/recharge_show_dialog.dart';

class RechargeWidget extends StatelessWidget {
  final UserModel? user;
  const RechargeWidget({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RechargeController>(builder: (controller) {
      return Container(
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10),
            itemCount: controller.rechargeList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  controller.setSelectedItem(controller.rechargeList[index]);
                  showDialog(
                    context: context,
                    builder: (context) {
                      return RechargeShowDialog(
                        usd: controller.rechargeList[index].usd!,
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                width: double.infinity,
                                height: MediaQuery.of(context).size.height / 2,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                     GooglePlayContainer(rechargeModel:controller.rechargeList[index]),
                                     ElevatedButtonWidget(
                                        vertical: 12,
                                        text: "Buy",
                                        backGroundColor: Colors.blue.shade900,
                                        textColor: Colors.white,
                                        borderColor: Colors.blue.shade900)
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/diamond_icon.webp',
                        width: 40,
                        height: 40,
                      ),
                      Text(
                        '${controller.rechargeList[index].diamond}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'USD ${controller.rechargeList[index].usd}',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              );
            }),
      );
    });
  }
}
