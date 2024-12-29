import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../util/styles.dart';

class RankingContainer extends StatelessWidget {
  final String text;
  final Color? color;
  const RankingContainer({super.key, required this.text,  this.color, required });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: color??Colors.deepPurpleAccent,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: Colors.white)
      ),
      child: Center(child: Text(text,style: robotoWhite,)),
    );
  }
}
