import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/data/model/body/setting_model.dart';
import 'package:live_app/helper/route_helper.dart';
import 'package:live_app/view/screens/setting/widget/setting_item.dart';

import '../../../widgets/delete_show_dialog.dart';

class SettingListView extends StatelessWidget {
  const SettingListView({super.key});

  @override
  Widget build(BuildContext context) {
    List<SettingModel> list = [
      SettingModel(title: "App Mode", navigateTo: RouteHelper.appMode),
      SettingModel(title: "Account security",navigateTo: RouteHelper.accountSecurity),
      SettingModel(title: "General setting",navigateTo: RouteHelper.generalSetting),
      SettingModel(title: "Delete message history",navigateTo: RouteHelper.deleteMessage),
      SettingModel(title: "Blacklist",navigateTo: RouteHelper.blackList),
      SettingModel(title: "Blocked Moments",navigateTo: RouteHelper.blockedMoments),
      SettingModel(title: "clear cache space"),
      SettingModel(title: "Privacy Policy",navigateTo: RouteHelper.privacyPolicy),
      SettingModel(title: "Give us a good comment"),
    ];
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              index==6?  showDialog(context: context, builder: (context){
                return const DeleteShowDialog();
              }):Get.toNamed(list[index].navigateTo ?? "");
            },
            child: SizedBox(
              width: double.infinity,
              height:45.h,
              child: SettingItem(
                title: list[index].title,
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 0.h,
          );
        },
        itemCount: list.length);
  }
}
