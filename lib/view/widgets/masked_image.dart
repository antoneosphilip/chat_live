import 'package:flutter/material.dart';
import 'package:live_app/view/widgets/dynamic_image.dart';

import '../../util/dimensions.dart';
import '../../util/images.dart';
import '../base/custom_image.dart';

class MaskedImage extends StatelessWidget {
  final bool isLocked;
  final String image;
  final double? lockRadius;
  final String? no;
  final String? hot;
  final String? hotIcon;
  final String? name;
  final String? numOfVisitors;
  final String? country;
  final String? frame;
  final Color? color;
  final List<Map<String, dynamic>>? levels;
  const MaskedImage({
    super.key,
    this.isLocked = false,
    required this.image,
    this.lockRadius,
    this.no,
    this.hot,
    this.hotIcon,
    this.name,
    this.numOfVisitors,
    this.country,
    this.levels,
    this.frame,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double width = constraints.maxWidth;
      double height = constraints.maxHeight;
      return Container(
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
              child: CustomImage(
                image: image,
                height: height,
                width: width,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: height,
              width: width,
              padding: const EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        no != null
                            ? DynamicImage(
                                fromAssets: true,
                                image: 'assets/images/no$no.webp',
                                width: width * 0.25,
                                height: height * 0.25,
                              )
                            : const SizedBox(),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            children: [
                              hotIcon != null
                                  ? Image.asset(
                                      "$hotIcon",
                                      width: 20,
                                      height: 20,
                                    )
                                  : const SizedBox(),
                              hot != null
                                  ? Text(
                                      "$hot",
                                      style: TextStyle(
                                          color: color ?? Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    )
                                  : const SizedBox()
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            name != null
                                ? Container(
                                    width: width * 0.4,
                                    child: Text(
                                      "$name",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: color ?? Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                : const SizedBox(),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  country != null
                                      ? Container(
                                          width: width * 0.15,
                                          height: height * 0.075,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage("$country"),
                                            ),
                                          ),
                                        )
                                      : const SizedBox(),
                                  ...?levels?.map(
                                    (e) => Stack(
                                      children: [
                                        CustomImage(
                                          image: e['image'],
                                          width: width * 0.3,
                                          height: height * 0.1,
                                        ),
                                        Center(
                                          child: Text(
                                            e['text'],
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: color ?? Colors.white,
                                              fontSize: width * 0.03,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        numOfVisitors != null
                            ? Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/wave.gif',
                                      width: 15,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "$numOfVisitors",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: color ?? Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : const SizedBox()
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // frame != null
            //     ? Container(
            //         height: height,
            //         width: width,
            //         decoration: BoxDecoration(
            //           image: DecorationImage(
            //               image: NetworkImage(
            //                 "$frame",
            //               ),
            //               fit: BoxFit.fill),
            //         ),
            //       )
            //     : const SizedBox(),
            Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius:
                      BorderRadius.circular(Dimensions.radiusDefault)),
              child: Center(
                child: isLocked == true
                    ? Image.asset(
                        Images.lockImg,
                        width: lockRadius ?? width * 0.2,
                        height: lockRadius ?? width * 0.2,
                      )
                    : const SizedBox(),
              ),
            ),
          ],
        ),
      );
    });
  }
}
