import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/helper/route_helper.dart';
import 'package:live_app/util/colors.dart';
import 'package:live_app/util/styles.dart';
import 'package:live_app/view/screens/create_family/widget/custom_rules_item.dart';
import 'package:live_app/view/screens/create_family/widget/elvated_button.dart';
import 'package:live_app/view/screens/create_family/widget/privilage_widget.dart';

class FamilyTabBarScreen extends StatelessWidget {
  final String image;
  final bool hasFamily;
  final String gold;
  final int id;

  const FamilyTabBarScreen(
      {super.key,
      required this.image,
      required this.hasFamily,
      required this.gold, required this.id});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 5.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const PrivilegeWidget(
                text: 'Privilege',
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 30.w,
                  ),
                  const CustomRulesItem(
                    text1: 'Family Family',
                    text2: "Frame",
                  ),
                  SizedBox(
                    width: 30.w,
                  ),
                  const CustomRulesItem(
                    text1: 'Family Family',
                    text2: "logo",
                  ),
                  SizedBox(
                    width: 30.w,
                  ),
                  const CustomRulesItem(
                    text1: 'Set admins 2',
                    text2: "Max",
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                width: 150,
                height: 100,
                child: Column(
                  children: [
                    Image(
                        image: const AssetImage('assets/icon/invite.webp'),
                        fit: BoxFit.cover,
                        height: 50.h,
                        width: 70.w,
                        color: ColorManger.deepGrey),
                    Text("Family Members",
                        style: robotoGreySmall.copyWith(
                            color: ColorManger.deepGrey)),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Center(
                            child: Text("50 Max",
                                style: robotoGreySmall.copyWith(
                                    color: ColorManger.deepGrey))))
                  ],
                ),
              ),
              SizedBox(
                height: 23.h,
              ),
              const PrivilegeWidget(
                text: 'Requirements',
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("1. Wealth level > Lv.40",
                        style: robotoGreySmall.copyWith(
                            color: ColorManger.deepGrey,
                            fontWeight: FontWeight.w500)),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        Text("2. Diamond cost: 15000",
                            style: robotoGreySmall.copyWith(
                                color: ColorManger.deepGrey,
                                fontWeight: FontWeight.w500)),
                        Image(
                          image: const AssetImage('assets/images/juail.png'),
                          width: 20.w,
                          height: 20.h,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text("Note: initial family level=Lv.1",
                        style: robotoGreySmall.copyWith(
                            color: ColorManger.deepGrey,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              !hasFamily
                  ? ElevatedButtonWidget(
                      text: 'Create a Family',
                      backGroundColor: ColorManger.deepGold,
                      textColor: ColorManger.whiteColor,
                      borderColor: ColorManger.deepGold,
                      onTap: () {
                        Get.toNamed(
                          RouteHelper.createFamilyWithData,
                          arguments: {'image': image,'gold':gold},
                        );
                      },
                    )
                  : ElevatedButtonWidget(
                text: 'show Family',
                backGroundColor: ColorManger.deepGold,
                textColor: ColorManger.whiteColor,
                borderColor: ColorManger.deepGold,
                onTap: () {
                  Get.toNamed(
                    RouteHelper.userFamily,
                    arguments: {'id':id},
                  );
                },
              ),
              SizedBox(
                height: 10.h,
              ),
              const ElevatedButtonWidget(
                text: 'All families',
                backGroundColor: ColorManger.whiteColor,
                textColor: Colors.black,
                borderColor: Colors.black,
                navigateTo: RouteHelper.allFamilies,
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          )
        ],
      ),
    );
  }
}
