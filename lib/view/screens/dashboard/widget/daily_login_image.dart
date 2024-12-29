import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DailyLoginImage extends StatelessWidget {
  const DailyLoginImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      // Clip the image to ensure rounded corners
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.r),
        topRight: Radius.circular(16.r),
      ),
      child: Image.asset(
        'assets/image/image_dash_board.webp',
        fit: BoxFit.cover,
        width: double.infinity,
        height: 160.h
      ),
    );
  }
}
