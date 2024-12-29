import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/user_controller.dart';
import 'package:live_app/data/model/response/user_model.dart';
import 'package:live_app/view/screens/users/widget/user_Details_send_buttons.dart';
import 'package:live_app/view/screens/users/widget/user_details_container.dart';
import 'package:live_app/view/screens/users/widget/user_details_container_details.dart';
import 'package:live_app/view/screens/users/widget/user_details_follow_buttons.dart';
import 'package:live_app/view/screens/users/widget/user_details_followers_information.dart';
import 'package:live_app/view/screens/users/widget/user_details_gender.dart';
import 'package:live_app/view/screens/users/widget/user_details_icon.dart';
import 'package:live_app/view/screens/users/widget/user_details_image_profile.dart';
import 'package:live_app/view/screens/users/widget/user_details_sections.dart';
import 'package:live_app/view/screens/users/widget/user_details_user_profile_image.dart';
import 'package:live_app/view/widgets/loading_idicator.dart';

class UserDetailsScreen extends StatefulWidget {
  final UserModel? user;

  const UserDetailsScreen({super.key, this.user});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: false,
        body: GetBuilder<UserController>(
          builder: (userController) {
            return
              userController.isLoading
                ? const LoadingIndicator()
                : Stack(
                    children: [
                      UserDetailsBackGrounImage(
                        userController: userController,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 25.h,
                              ),
                              UserDetailsIcon(
                                userController: userController,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.20,
                                width: MediaQuery.of(context).size.width,
                                child: UserDetailsImageProfile(
                                  userController: userController,
                                ),
                              ),
                              Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 20.h),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(15.r),
                                          topLeft: Radius.circular(15.r),
                                        ),
                                      ),
                                      child: Stack(
                                        children: [
                                          const UserDetailsContainer(),
                                          Container(
                                            padding: EdgeInsets.only(
                                                right: 10.w,
                                                left: 10.w,
                                                top: 10.h),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 25.h,
                                                ),
                                                UserDetailsFollowButtons(
                                                  userController:
                                                      userController,
                                                ),
                                                UserDetailsGender(
                                                  userController:
                                                      userController,
                                                ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 5.h),
                                                  child: Text(
                                                      "${userController.userDetailsModelStatic?.pio}"),
                                                ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                UserDetailsFollowersInformation(
                                                  userController:
                                                      userController,
                                                ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                UserDetailsSections(
                                                  userController:
                                                      userController,
                                                ),
                                                SizedBox(
                                                  height: 100.h,
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const UserDetailsContainerDetails(),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      UserDetailsSendButtons(
                        userController: userController,
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }

  getData() {
    Get.find<UserController>().getUserDetails(widget.user!.id!);
  }
}
