import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/colors.dart';

class CustomNetworkImage extends StatelessWidget {
  final String? image;
  final double width;
  final double height;
  final bool isBottom;

  const CustomNetworkImage(
      {super.key, required this.image, this.width = 80, this.height = 90,  this.isBottom=true});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom:isBottom? 20.h:0.h),
        child: ClipOval(
          child: CachedNetworkImage(
            imageUrl: image ??
                'https://www.bing.com/th?id=OIP.roQHQEuNf8SdJJ7wS3RxtgHaHa&w=150&h=150&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2',
            height: height.h,
            width: width.w,
            fit: BoxFit.cover,
            placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(
              color: ColorManger.primary,
            )),
            errorWidget: (context, url, error) => const Image(
              image: CachedNetworkImageProvider(
                  'https://www.bing.com/th?id=OIP.roQHQEuNf8SdJJ7wS3RxtgHaHa&w=150&h=150&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2'),
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}
