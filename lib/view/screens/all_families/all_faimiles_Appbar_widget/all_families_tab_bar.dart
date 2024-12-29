import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/styles.dart';

class AllFamiliesTabBar extends StatefulWidget {
  const AllFamiliesTabBar({super.key});

  @override
  State<AllFamiliesTabBar> createState() => _AllFamiliesTabBarState();
}

class _AllFamiliesTabBarState extends State<AllFamiliesTabBar> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // Initialize TabController and set the initial index to 4 (for 'Family')
    _tabController = TabController(length: 5, vsync: this, initialIndex: 4);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(top: 100.h),
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: SizedBox(
                height: 50.h,
                child: TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                        width: 3.0.w, color: Colors.white),
                    insets:
                    EdgeInsets.symmetric(horizontal: 30.0.w),
                  ),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: Colors.white,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white,
                  labelStyle: robotoBlack2.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                  unselectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16.sp,
                  ),
                  tabs: const [
                    Tab(text: 'Billionaire'),
                    Tab(text: 'Wealth'),
                    Tab(text: 'Charm'),
                    Tab(text: 'Rooms'),
                    Tab(text: 'Family'),
                  ],
                  labelPadding:
                  EdgeInsets.symmetric(horizontal: 15.0.w),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
