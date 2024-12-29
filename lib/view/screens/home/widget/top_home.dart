import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/cupertino.dart';
import 'package:live_app/controller/home_controller.dart';

import '../../../../util/app_constants.dart';
import 'banner_view.dart';

class TopHome extends StatelessWidget {
  final HomeController homeController;
  const TopHome({super.key, required this.homeController});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CarouselViewWidget(
        width: MediaQuery.of(context).size.width -
            20,
        height:
        MediaQuery.of(context).size.height *
            0.15,
        imageIndexName: 'image',
        baseUrl:
        "${AppConstants.mediaUrl}/banner",
        itemList: homeController.staticBannerImage,
        // homeController.mainBanners,
        onPageChanged: (int index,
            CarouselPageChangedReason
            carouselPageChangedReason) {},
        onTap: (int index) async {},
      ),
    );
  }
}
