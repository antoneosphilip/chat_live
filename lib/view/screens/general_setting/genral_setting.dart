import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_app/view/screens/general_setting/widget/first_section.dart';
import 'package:live_app/view/screens/general_setting/widget/second_section.dart';
import 'package:live_app/view/widgets/app_bar.dart';

import '../../../util/styles.dart';

class GeneralSetting extends StatelessWidget {
  const GeneralSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: const AppBarCustom(name: "General setting"),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 20.h),
                child: Text(
                  "Gifts announcement lines setting",
                  style: robotoLargeBold,
                ),
              ),
              const FirstSection(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 20.h),
                child: Text(
                  "General setting",
                  style: robotoLargeBold,
                ),
              ),
              const SecondSection(),



            ],
          ),
        ));
  }
}
