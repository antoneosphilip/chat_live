import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/home_controller.dart';
import 'package:live_app/util/styles.dart';
import 'package:live_app/view/base/custom_text_field.dart';
import 'package:live_app/view/screens/users/widget/country_item.dart';
import 'package:live_app/view/screens/wallet/widget/custom_line.dart';
import 'package:live_app/view/widgets/app_bar.dart';

import '../../../util/app_constants.dart';
import '../../base/custom_image.dart';

class PhoneScreen extends StatefulWidget {
  @override
  _PhoneScreenState createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {

  List<Map<String, String>> filteredCountries = [];

  @override
  void initState() {
    super.initState();
    filteredCountries = countries;
  }

  // Function to filter countries based on search input
  @override
  Widget build(BuildContext context) {
    final homeController=Get.find<HomeController>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarCustom(name: 'Country/region'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomLine(),
            SizedBox(height: 16.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  CustomTextField(
                    titleText: 'search',
                    prefixIcon: Icons.search,
                    filledColor: Colors.grey[200],
                    textColor: Colors.black,
                  ),
                  SizedBox(height: 20.h,),
                  // List of countries
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: homeController.countries.length, // Display only filtered list
                    itemBuilder: (context, index) {
                      return CountryItem(country: homeController.countries[index]);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 10.h,);
                  },
        
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
List<Map<String, String>> countries = [
  {'name': 'Saudi Arabia', 'flag': 'assets/flags/saudi_arabia.svg'},
  {'name': 'Kuwait', 'flag': 'assets/flags/kuwait.svg'},
  {'name': 'Comoros', 'flag': 'assets/flags/comoros.svg'},
  {'name': 'Djibouti', 'flag': 'assets/flags/djibouti.svg'},
  {'name': 'Egypt', 'flag': 'assets/flags/egypt.svg'},
  {'name': 'Iraq', 'flag': 'assets/flags/iraq.svg'},
  {'name': 'Jordan', 'flag': 'assets/flags/Jordan.svg'},
  {'name': 'Lebanon', 'flag': 'assets/flags/lebanon.svg'},
  {'name': 'Libya', 'flag': 'assets/flags/libya.svg'},
  {'name': 'Mauritania', 'flag': 'assets/flags/mauritania.svg'},
  {'name': 'Morocco', 'flag': 'assets/flags/morocco.svg'},
  {'name': 'Oman', 'flag': 'assets/flags/oman.svg'},
  {'name': 'Palestine', 'flag': 'assets/flags/palestine.svg'},
  {'name': 'Qatar', 'flag': 'assets/flags/qatar.svg'},
  {'name': 'Somalia', 'flag': 'assets/flags/somalia.svg'},
  {'name': 'Sudan', 'flag': 'assets/flags/sudan.svg'},
  {'name': 'Syria', 'flag': 'assets/flags/syria.svg'},
  {'name': 'Tunisia', 'flag': 'assets/flags/tunisia.svg'},
  {'name': 'United Arab Emirates', 'flag': 'assets/flags/uae.svg'},
  {'name': 'Yemen', 'flag': 'assets/flags/yemen.svg'},
  {'name': 'Algeria', 'flag': 'assets/flags/algeria.svg'},
  {'name': 'Bahrain', 'flag': 'assets/flags/bahrain.svg'},
];

