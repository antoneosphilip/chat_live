import 'package:flutter/material.dart';

class CustomBgBtn extends StatelessWidget {
  final String text;
  final String img;
  final Function() onTab;
  const CustomBgBtn(
      {super.key, required this.text, required this.img, required this.onTab});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                img,
              ),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      ),
    );
  }
}
