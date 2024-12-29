import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/model/response/room_model.dart';

class CustomChair extends StatelessWidget {
  final Chairs? chair;
  final int numberOfItem;
  final  String? imageChair;

  const CustomChair({super.key,required this.chair, required this.numberOfItem, this.imageChair,});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.w,
      height: 50.h,
      decoration: chair!.teamNumber == 0
          ? const BoxDecoration()
          : BoxDecoration(
        shape: BoxShape.circle,
        color: chair!.teamNumber == 1
            ? Colors.red
            : Colors.green,
      ),
      child: Padding(
        padding: EdgeInsets.all(chair!.teamNumber == 0 ? 0 : 1.0),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                 Image(
                  image: AssetImage(imageChair??'assets/images/special_chair.webp'),
                  fit: BoxFit
                      .cover, // Ensure the image covers the circle
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 5), // Reduced padding
                  child: Text(
                    numberOfItem.toString(),
                    style: const TextStyle(
                        color: Colors.yellowAccent,
                        fontSize: 12), // Reduced font size
                  ),
                ),
              ],
            ),
            chair!.isLocked == 1
                ? Padding(
              padding:
              EdgeInsets.only(bottom: 1.h, right: 1.w),
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(
                    Icons.lock,
                    color: Colors.grey,
                    size: 20.sp,
                  )),
            )
                : chair!.isMuted == 1
                ? Padding(
              padding: EdgeInsets.only(
                  bottom: 1.h, right: 1.w),
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(
                    Icons.volume_off,
                    color: Colors.grey,
                    size: 20.sp,
                  )),
            )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
