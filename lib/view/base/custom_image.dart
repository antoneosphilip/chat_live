import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:live_app/util/images.dart';

class CustomImage extends StatelessWidget {
  final String image;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final bool isNotification;
  final String placeholder;
  final double?placeHolderHeight;
  final double?placeHolderWidth;

  const CustomImage({
    Key? key,
    required this.image,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.isNotification = false,
    this.placeholder = '',
    this.placeHolderHeight,
    this.placeHolderWidth=10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      height: height,
      width: width,
      fit: fit,
      placeholder: (context, url) => Image.asset(
        placeholder.isNotEmpty
            ? placeholder
            : isNotification
                ? Images.notificationPlaceholder
                : Images.loading,
        height: 10,
        width: 10,
        fit: fit,
      ),
      errorWidget: (context, url, error) => Image.asset(
        placeholder.isNotEmpty
            ? placeholder
            : isNotification
                ? Images.notificationPlaceholder
                : Images.loading,
        height: height,
        width: width,
        fit: fit,
      ),
    );
  }
}
