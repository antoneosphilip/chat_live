import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:live_app/controller/home_controller.dart';

import '../../../../controller/country_controller.dart';
import '../../../base/custom_image.dart';
import '../../../widgets/arrow_btn.dart';
import '../../countries/country_list.dart';
import '../../rooms/room_list_screen.dart';

class CountriesHome extends StatelessWidget {
  final HomeController homeController;
  const CountriesHome({super.key, required this.homeController});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...homeController.countriesStatic
                      .map((country) {
                    return TextButton(
                      onPressed: () {
                        Get.find<
                            CountryController>()
                            .selectCountry(
                            country.id);
                        Get.to(
                          RoomLisScreen(
                            title:
                            "${country.name}",
                            filter:
                            'country_id=${country.id}',
                          ),
                        );
                      },
                      child: Container(
                        height: 30,
                        width: 40,
                        padding: const EdgeInsets
                            .symmetric(
                          horizontal: 2,
                          // 10,
                          vertical:1,
                          // 5
                        ),
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius
                                .circular(5),
                            color:
                            Colors.black12),
                        child: CustomImage(
                          height: 20,
                          width: 30,
                          image:country.flag!,
                          // AppConstants
                          //     .getMedia(
                          //   'country',
                          //   "${country.flag}",
                          // ),
                        ),
                      ),
                    );
                  })
                ],
              ),
            ),
          ),
          ArrowBtn(
            onTap: () {
              Get.to(
                      () => const CountriesScreen());
            },
          )
        ],
      ),
    );
  }
}
