import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/user_controller.dart';
import 'package:live_app/data/model/response/my_profile_model.dart';
import 'package:live_app/helper/route_helper.dart';
import 'package:live_app/util/dimensions.dart';
import 'package:live_app/util/styles.dart';
import 'package:live_app/view/screens/users/phone_screen.dart';
import 'package:live_app/view/screens/users/widget/image_person.dart';
import 'package:live_app/view/screens/users/widget/list_profile_item.dart';
import 'package:live_app/view/screens/users/widget/my_profile_item.dart';
import 'package:live_app/view/screens/wallet/widget/custom_line.dart';
import 'package:live_app/view/widgets/loading_idicator.dart';

import '../../widgets/app_bar.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      builder: (userController) {
        return userController.isLoading&&userController.userDetailsModelStatic==null?
        const Center(child: LoadingIndicator()):
        Scaffold(
          backgroundColor: Colors.white,
          appBar: const AppBarCustom(
            name: 'Edit information',
          ),
          body: SingleChildScrollView(
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15.h,
                ),
                const ProfileImagePerson(),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Signature:",
                        style: robotoBlack.copyWith(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(width: 5.w,),
                      Text(userController.userDetailsModelStatic?.pio??'',style:  robotoWhite.copyWith(fontWeight: FontWeight.w400,color: Colors.black,fontSize:
                      Dimensions.fontSizeDefault),)
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                const CustomLine(),
                SizedBox(
                  height: 16.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Text(
                    "My Profile",
                    style: robotoBlack.copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      List<MyProfileModel> profileItems = [
                        MyProfileModel(
                          icon: getIconForText('Nickname'),
                          text: 'Nickname',
                          text2: userController.userDetailsModelStatic?.name
                              ?.split(' ')
                              .first ??
                              '',
                          isIcon: true,
                          onPressed: () {
                            Get.toNamed(RouteHelper.nickName, arguments: {
                              'name':
                              userController.userModelStatic!.name!.split(' ').first,
                            });

                          },
                          colorIcon: getColorForText('Nickname'),
                        ),
                        MyProfileModel(
                          icon: getIconForText('Gender'),
                          text: 'Gender',
                          text2: userController.userDetailsModelStatic?.gender ?? "",
                          isIcon: true,
                          onPressed: () {
                            Get.toNamed(RouteHelper.genderScreen);
                          },
                          colorIcon: getColorForText('Gender'),
                        ),
                        MyProfileModel(
                          icon: getIconForText('Location'),
                          text: 'Location',
                          text2:
                          userController.userDetailsModelStatic?.country?.name ?? " ",
                          isIcon: true,
                          onPressed: () {
                            Get.to(PhoneScreen());
                          },
                          colorIcon: getColorForText('Location'),
                        ),
                        MyProfileModel(
                          icon: getIconForText('Level'),
                          text: 'Level',
                          text2: 'Lv.0',
                          isIcon: false,
                          onPressed: () {},
                          colorIcon: getColorForText('Level'),
                        ),
                        MyProfileModel(
                          icon: getIconForText('Signature'),
                          text: 'Signature',
                          text2: userController.userDetailsModelStatic?.pio??'',
                          isIcon: true,
                          onPressed: () {
                            Get.toNamed(RouteHelper.signature);
                          },
                          colorIcon: getColorForText('Signature'),
                        ),
                      ];

                      return MyProfileItem(
                        icon: profileItems[index].icon,
                        text: profileItems[index].text,
                        text2: profileItems[index].text2,
                        isIcon: profileItems[index].isIcon,
                        onPressed: profileItems[index].onPressed,
                        iconColor: profileItems[index].colorIcon,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 15.h,
                      );
                    },
                    itemCount: 5)
              ],
            ),
          ),
        );
      },
    );
  }
}
