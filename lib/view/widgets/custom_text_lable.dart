import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextLabel extends StatelessWidget {
  final String? image;
  final String? text;
  final Color? color;
  const CustomTextLabel({super.key, this.image, this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image(
          width: 20,
          height: 20,
          image: AssetImage(
            image != null ? "$image" : 'assets/image/other_icon.png',
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          "$text",
          style: TextStyle(fontSize: 12, color: color),
        )
      ],
    );
  }
}
