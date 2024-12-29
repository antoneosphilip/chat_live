import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:live_app/util/dimensions.dart';
import 'package:live_app/view/base/custom_image.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class CarouselViewWidget extends StatelessWidget {
  final double width;
  final double height;
  final List? itemList;
  final Function(int index, CarouselPageChangedReason carouselPageChangedReason)
      onPageChanged;
  final void Function(int index) onTap;
  final int duration;
  final String? baseUrl;
  final String imageIndexName;
  final Axis scrollDirection;
  const CarouselViewWidget(
      {super.key,
      required this.onPageChanged,
      required this.onTap,
      this.baseUrl,
      required this.width,
      required this.height,
      this.itemList,
      required this.imageIndexName,
      this.scrollDirection = Axis.horizontal,
      this.duration = 7});

  @override
  Widget build(BuildContext context) {
    return (itemList != null && itemList!.isEmpty)
        ? const SizedBox()
        : Container(
            width: width,
            height: height,
            padding: const EdgeInsets.only(top: Dimensions.paddingSizeSmall),
            child: itemList != null
                ? CarouselSlider.builder(
                    options: CarouselOptions(
                      scrollDirection: scrollDirection,
                      autoPlay: true,
                      enlargeCenterPage: false,
                      disableCenter: true,
                      viewportFraction: 1,
                      autoPlayInterval: Duration(seconds: duration),
                      onPageChanged: (index, reason) {
                        onPageChanged(index, reason);
                      },
                    ),
                    itemCount: itemList!.isEmpty ? 1 : itemList?.length,
                    itemBuilder: (context, index, _) {
                      return InkWell(
                        onTap: () {
                          print(itemList?[index].image);
                          onTap(index);
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child:
                          CustomImage(
                            image:
                                '${itemList?[index]}',
                                // '$baseUrl/${itemList?[index].toJson()[imageIndexName]}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  )
                : Shimmer(
                    duration: const Duration(seconds: 2),
                    enabled: itemList == null,
                    child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radiusSmall),
                          color: Colors.grey[300],
                        )),
                  ),
          );
  }
}
