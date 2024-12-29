import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_app/util/dimensions.dart';
import 'package:live_app/util/styles.dart';
import 'package:live_app/view/widgets/app_bar.dart';

import '../family/widget/join_family_button.dart';

class NetworkTest extends StatelessWidget {
  const NetworkTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(name: 'Network Test'),
      body: Scaffold(
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 16.h,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Click the button to test your current network conditions and result will be automayiclly sent to live app to help us repair and improve our services for better users experrience",
                  style: robotoWhite.copyWith(color: Colors.black,fontSize: Dimensions.fontSizeDefault,fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(height: 200.h,),
              Icon(Icons.network_wifi_rounded,color: Colors.grey,size: 40,),
              SizedBox(height: 280.h,),
              JoinFamilyButton(
                text: 'Run test', onTap: () {  },
                width: 350,
              )
            ],
          ),
        ),
      ),
    );
  }
}
