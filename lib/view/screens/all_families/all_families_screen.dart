import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/family_controller.dart';

import '../../widgets/loading_idicator.dart';
import 'all_faimiles_Appbar_widget/all_families_centers.dart';
import 'all_faimiles_Appbar_widget/all_families_tab_bar.dart';
import 'all_faimiles_Appbar_widget/country_toggle.dart';
import 'all_faimiles_Appbar_widget/dayes_tab_bar.dart';
import 'all_faimiles_Appbar_widget/family_members_count.dart';
import 'all_faimiles_Appbar_widget/get_all_families_item.dart';
import 'all_faimiles_Appbar_widget/image_person.dart';
import 'all_faimiles_Appbar_widget/person_name.dart';

class AllFamiliesScreen extends StatefulWidget {
  const AllFamiliesScreen({super.key});

  @override
  State<AllFamiliesScreen> createState() => _AllFamiliesScreenState();
}

class _AllFamiliesScreenState extends State<AllFamiliesScreen> {
  @override
  void initState() {
    // Get.find<FamilyController>().getAllFamilyData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      /*  appBar: PreferredSize(
        preferredSize:  Size.fromHeight(800.0.h), // Adjust height for TabBar + Image
        child: const AllFamiliesAppbarWidget(),
      ),*/
      body: GetBuilder<FamilyController>(
        builder: (GetxController controller) {
          return Get.find<FamilyController>().isLoading
              ? const LoadingIndicator()
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            height: 450.h,
                            width: double.infinity,
                            child: Image.asset(
                              'assets/images/all_families_app_bar.webp',
                              fit: BoxFit.cover,
                            ),
                          ),
                          const CountryToggle(),
                          const AllFamiliesTabBar(),
                          const DayesTabBar(),
                          SizedBox(
                            height: 20.h,
                          ),
                          const ImagePerson(),
                          Padding(
                            padding: EdgeInsets.only(top: 180.h),
                            child: Center(
                                child: Image.asset(
                              'assets/images/all_familes_top1.webp',
                              width: 200.w,
                              height: 200.h,
                            )),
                          ),
                          const PersonName(),
                          SizedBox(
                            height: 10.h,
                          ),
                          const FamilyMembersCount(),
                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 460),
                                child: Column(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 180.h,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(16.r),
                                              topLeft: Radius.circular(16.r)),
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/all_families_2.webp'),
                                              fit: BoxFit.cover)),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 450.h),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 10.w),
                                      child: const AllFamiliesCenters(
                                        image: 'assets/images/family_name.webp',
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    const AllFamiliesCenters(
                                      image: 'assets/images/family_name_1.webp',
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    const AllFamiliesCenters(
                                      image: 'assets/images/family_name_3.webp',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10.w,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                            child: ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return GetAllFamiliesItem(
                                 familiesData:    Get.find<FamilyController>()
                                      .getAllFamiliesStatic!
                                      .familiesData![index],

                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    height: 10.h,
                                  );
                                },
                                itemCount: Get.find<FamilyController>()
                                    .getAllFamiliesStatic!
                                    .familiesData!
                                    .length),
                          )
                        ],
                      )
                    ],
                  ),
                );
        },
      ),
    );
  }
}
