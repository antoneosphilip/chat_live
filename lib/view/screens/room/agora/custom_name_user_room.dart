import 'package:flutter/cupertino.dart';

import '../../../../util/styles.dart';

class CustomNameUserRoom extends StatelessWidget {
  final String text;
  const CustomNameUserRoom({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      // Reduce top padding
      child: Text(
          text,
        // Show only the first name
        style: robotoWhite.copyWith(fontSize: 10),
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        // Avoid overflow
        maxLines: 1,
      ),
    );
  }
}
