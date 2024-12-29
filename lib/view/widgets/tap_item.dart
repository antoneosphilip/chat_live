import 'package:flutter/material.dart';

class TapItem extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final Color? color;
  const TapItem({super.key, this.onTap, required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        text,
        style: TextStyle(color: color, fontSize: 15),
      ),
    );
  }
}
