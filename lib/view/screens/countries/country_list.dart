import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/country_controller.dart';
import 'package:live_app/helper/responsive_helper.dart';
import 'package:live_app/util/dimensions.dart';
import 'package:live_app/util/styles.dart';
import 'package:live_app/view/base/custom_app_bar.dart';
import 'package:live_app/view/base/custom_image.dart';
import 'package:live_app/view/base/no_data_screen.dart';

import '../../../util/app_constants.dart';
import '../../widgets/loading_idicator.dart';
import '../rooms/room_list_screen.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({Key? key}) : super(key: key);

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  @override
  void initState() {
    super.initState();

    Get.find<CountryController>().getCountryList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'All Countries'.tr,
      ),
      body: SafeArea(
        child: GetBuilder<CountryController>(builder: (countryController) {
          return countryController.isLoading == false
              ? countryController.countryList.isNotEmpty
                  ? Center(
                      child: Container(
                        width: Dimensions.webMaxWidth,
                        padding:
                            const EdgeInsets.all(Dimensions.paddingSizeSmall),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: GridView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount:
                                      countryController.countryList.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount:
                                        ResponsiveHelper.isDesktop(context)
                                            ? 4
                                            : ResponsiveHelper.isTab(context)
                                                ? 3
                                                : 2,
                                    childAspectRatio: (1 / 0.35),
                                  ),
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        countryController.selectCountry(
                                            countryController
                                                .countryList[index].id);
                                        Get.to(
                                          RoomLisScreen(
                                            title:
                                                "${countryController.countryList[index].name}",
                                            filter:
                                                'country_id=${countryController.countryList[index].id}',
                                          ),
                                        );
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.all(
                                            Dimensions.paddingSizeExtraSmall),
                                        padding: const EdgeInsets.symmetric(
                                          vertical:
                                              Dimensions.paddingSizeExtraSmall,
                                          horizontal:
                                              Dimensions.paddingSizeSmall,
                                        ),
                                        decoration: BoxDecoration(
                                          color: countryController
                                                      .selectedCountryId ==
                                                  countryController
                                                      .countryList[index].id
                                              ? Theme.of(context).primaryColor
                                              : Theme.of(context).cardColor,
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.radiusDefault),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey[
                                                    Get.isDarkMode
                                                        ? 800
                                                        : 200]!,
                                                blurRadius: 5,
                                                spreadRadius: 1)
                                          ],
                                        ),
                                        alignment: Alignment.center,
                                        child: Row(children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                                Dimensions.radiusDefault),
                                            child: CustomImage(
                                              image: AppConstants.getMedia(
                                                  'country',
                                                  "${countryController.countryList[index].flag}"),
                                              height: 30,
                                              width: 30,
                                            ),
                                          ),
                                          const SizedBox(
                                              width: Dimensions
                                                  .paddingSizeExtraSmall),
                                          Flexible(
                                              child: Text(
                                            "${countryController.countryList[index].name}",
                                            style: robotoMedium.copyWith(
                                              fontSize:
                                                  Dimensions.fontSizeSmall,
                                              color: countryController
                                                          .selectedCountryId ==
                                                      countryController
                                                          .countryList[index].id
                                                  ? Theme.of(context).cardColor
                                                  : Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .color,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          )),
                                        ]),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ]),
                      ),
                    )
                  : NoDataScreen(text: 'no_category_found'.tr)
              : const LoadingIndicator();
        }),
      ),
    );
  }
}
