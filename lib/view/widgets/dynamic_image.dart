import 'package:flutter/material.dart';

class DynamicImage extends StatelessWidget {
  final double? width;
  final double? height;
  final bool fromAssets;
  final String? image;
  const DynamicImage(
      {super.key, this.width, this.height, this.fromAssets = true, this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: fromAssets
              ? AssetImage("$image") as ImageProvider<Object>
              : NetworkImage("$image"),
          fit: BoxFit.fill, // adjust this as per your needs
        ),
      ),
    );
  }
}
