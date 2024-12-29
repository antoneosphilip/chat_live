import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:live_app/view/screens/app_mode/widget/app_mode_item.dart';
import 'package:live_app/view/screens/app_mode/widget/app_mode_listview.dart';

import '../../../util/dimensions.dart';
import '../../../util/styles.dart';
import '../../base/custom_app_bar.dart';
import '../../widgets/app_bar.dart';

class AppModeScreen extends StatelessWidget {
  const AppModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  AppBarCustom(name: 'App Mode'.tr,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
             AppModeListview(),
          ],
        ),
      ),
    );
  }
}
