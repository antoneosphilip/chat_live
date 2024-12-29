import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_app/view/screens/all_families/all_faimiles_Appbar_widget/person_name.dart';

import 'all_families_tab_bar.dart';
import 'country_toggle.dart';
import 'dayes_tab_bar.dart';
import 'family_members_count.dart';
import 'image_person.dart';

class AllFamiliesAppbarWidget extends StatelessWidget {
  const AllFamiliesAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: EdgeInsets.only(right: 30.w, left: 10.w),
        child: Icon(
          Icons.arrow_back_ios_outlined,
          size: 20.sp,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      flexibleSpace: Stack(
        children: [
          Positioned.fill(
            child: Stack(
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
                  padding:  EdgeInsets.only( bottom:230.h),
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
                Padding(
                  padding: const EdgeInsets.only(top: 460),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 300.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(16.r),topLeft: Radius.circular(16.r)),
                            image:  const DecorationImage(image: AssetImage('assets/images/all_families_2.webp'),fit: BoxFit.cover)
                        ),
                      )
                    ],
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
