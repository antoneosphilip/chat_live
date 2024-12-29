import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/styles.dart';

class AllFamiliesCenters extends StatelessWidget {
  const AllFamiliesCenters({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ClipOval(
                child: Image(
                  image: const NetworkImage(
                      'https://th.bing.com/th/id/OIP.hLTThhxHPeGqFQVjpD1-hwHaE8?rs=1&pid=ImgDetMain'),
                  height: 65.h,
                  width: 80.w,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Image(
              image: AssetImage(image),
              height: 100.h,
              width: 100.w,
            ),
          ],
        ),
        Text(
          'فورتكس',
          style: robotoGreySmall.copyWith(color: Colors.black),
        ),
        Row(
          children: [
            Image.asset(
              'assets/images/fire.webp',
              height: 15.h,
              width: 15.w,
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              "6,417,977",
              style: robotoGreySmall,
            ),
          ],
        )
      ],
    );
  }
}
