import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/family_controller.dart';
import 'package:live_app/view/base/custom_app_bar.dart';
import 'package:live_app/view/screens/family/widget/family_first_section.dart';
import 'package:live_app/view/screens/family/widget/family_information_container.dart';
import 'package:live_app/view/screens/family/widget/family_members.dart';
import 'package:live_app/view/screens/family/widget/family_stars.dart';
import 'package:live_app/view/screens/family/widget/join_family_button.dart';
import 'package:live_app/view/screens/family/widget/user_information.dart';

import '../../../helper/responsive_helper.dart';
import '../../widgets/loading_idicator.dart';
import 'widget/join_family_message.dart';

class UserFamilyScreen extends StatefulWidget {
  final int id;

  const UserFamilyScreen({super.key, required this.id});

  @override
  State<UserFamilyScreen> createState() => _UserFamilyScreenState();
}

class _UserFamilyScreenState extends State<UserFamilyScreen> {
  @override
  void initState() {
    // Get.find<FamilyController>().getFamilyData(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: const CustomAppBar(
            title: 'family',
            color: Colors.white,
            backgroundColor: Colors.transparent,
          ),
          body: GetBuilder<FamilyController>(
            builder: (familyController) {
              return SizedBox(
                  height: ResponsiveHelper.ofHeight(context, 1),
                  width: ResponsiveHelper.ofWidth(context, 1),
                  child: familyController.isLoading
                      ? const LoadingIndicator()
                      :familyController.familyResponseStatic!=null? Stack(
                          children: [
                            FamilyFirstSection(
                              familyResponse: familyController.familyResponseStatic!,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 50.h,
                                  ),
                                  SizedBox(
                                    height: ResponsiveHelper.ofHeight(
                                        context, 0.23),
                                    width: ResponsiveHelper.ofWidth(context, 1),
                                  ),
                                  Stack(
                                    children: [
                                      FamilyInformationContainer(
                                        familyResponse:
                                            familyController.familyResponseStatic!,
                                      ),
                                      UserInformation(
                                        owner: familyController
                                            .familyResponseStatic!.data!.owner!,
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            height: ResponsiveHelper.ofHeight(
                                                context, 0.19),
                                          ),
                                          ClipPath(
                                            // clipper: CurveClipper(),
                                            child: Container(
                                              width: ResponsiveHelper.ofWidth(
                                                  context, 1),
                                              padding: const EdgeInsets.all(10),
                                              decoration: const BoxDecoration(
                                                color: Color(0xfff2f2f2),
                                              ),
                                              child: Column(
                                                children: [
                                                  FamilyMembers(
                                                    familyResponse:
                                                        familyController
                                                            .familyResponseStatic!,
                                                  ),
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  FamilyStars(
                                                    familyResponse:
                                                        familyController
                                                            .familyResponseStatic!,
                                                  ),
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  // LiveRooms(),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            familyController.familyResponseStatic!.data!
                                        .currentUserType ==
                                    "none"
                                ? JoinFamilyButton(
                                    text: 'Join Family',
                                    onTap: () async {
                                      await familyController.joinFamily(
                                          familyId: familyController
                                              .familyResponseStatic!.data!.id);
                                      if(familyController.errorMessage.isNotEmpty) {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return JoinFamilyMessage(
                                              message:
                                                  familyController.errorMessage,
                                            );
                                          });
                                      }
                                    },
                                  )
                                : familyController.familyResponseStatic!.data!
                                            .currentUserType ==
                                        "owner"
                                    ? JoinFamilyButton(
                                        text: 'Delete Family',
                                        onTap: () {},
                                      )
                                    : JoinFamilyButton(
                                        text: 'Leave Family',
                                        onTap: () async {
                                          // await familyController.joinFamily(
                                          //     familyId: familyController
                                          //         .familyResponseStatic!.data!.id);
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return JoinFamilyMessage(
                                                  message:"test"
                                                  // familyController.errorMessage,
                                                );
                                              });
                                        },
                                      )
                          ],
                        ):SizedBox()

              );
            },
          )),
    );
  }
}
