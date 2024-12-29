import 'package:flutter/material.dart';

class ArrowBtn extends StatelessWidget {
  final Function()? onTap;
  const ArrowBtn({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 30,
        height: 30,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/arrow.png',
              ),
              fit: BoxFit.fill,
              matchTextDirection: true),
        ),
      ),
    );
  }
}
