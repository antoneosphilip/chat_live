import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_app/view/screens/family/widget/custom_netwok_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../util/styles.dart';

class CreateFamilyAppbar extends StatelessWidget {
 final String image;
   const CreateFamilyAppbar({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      leading: Padding(
        padding:  EdgeInsets.only(right: 30.w,left: 10.w),
        child: Icon(Icons.arrow_back_ios_outlined,size: 20.sp,),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      flexibleSpace: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              'assets/images/create_family.webp',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: 30.h),
            child: Align(
              alignment: Alignment.center,
              child: CustomNetworkImage(image:image,height: 70.h,width: 70.w,),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/family_name.webp',
              fit: BoxFit.cover,
              height: 100.h,
              width: 100.w,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 27.h),
            child:  Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: SizedBox(
                      height:50.h,
                      child: TabBar(
                        isScrollable: true,
                        padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                        indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(width: 3.0.w, color: Colors.white),
                          insets: EdgeInsets.symmetric(horizontal: 30.0.w),
                        ),
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: Colors.white,
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.white,
                        labelStyle:robotoBlack2.copyWith(color: Colors.white,fontWeight: FontWeight.w600),
                        unselectedLabelStyle: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16.sp,
                        ),
                        tabs: const [
                          Tab(text: 'Family'),
                          Tab(text: 'Clan'),
                          Tab(text: 'Tribe'),
                          Tab(text: 'Nation'),
                          Tab(text: 'Kingdom'),
                        ],
                        labelPadding: EdgeInsets.symmetric(horizontal: 10.0.w),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
