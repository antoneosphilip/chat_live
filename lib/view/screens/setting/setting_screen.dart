import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_app/view/screens/setting/widget/setting_item.dart';
import 'package:live_app/view/screens/setting/widget/setting_list_view.dart';

import '../../../util/dimensions.dart';
import '../../base/custom_app_bar.dart';
import '../../widgets/app_bar.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:const AppBarCustom(name: 'Settings',),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            const SettingListView(),
          ],
        ),
      ),
    );
  }
}
