import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  final String text;
  final String image;
  final double width;
  final double height;
  final double fontSize;
  final double space;
  final Color color;
  final Function()? onTap;
  const ImageButton({
    super.key,
    required this.text,
    required this.image,
    this.width = 50,
    this.height = 50,
    this.space = 0,
    required this.onTap,
    this.fontSize = 12,
    this.color = Colors.black38,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Image(width: width, height: height, image: AssetImage(image)),
          SizedBox(
            height: space,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              color: color,
            ),
          )
        ],
      ),
    );
  }
}
