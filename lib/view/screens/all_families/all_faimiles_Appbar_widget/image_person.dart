import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImagePerson extends StatelessWidget {
  const ImagePerson({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 240.h),
      child: Center(
        child: ClipOval(
          child: Image(
            image: const NetworkImage(
                'https://th.bing.com/th/id/OIP.hLTThhxHPeGqFQVjpD1-hwHaE8?rs=1&pid=ImgDetMain'),
            width: 100.w,
            height: 100.h,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
