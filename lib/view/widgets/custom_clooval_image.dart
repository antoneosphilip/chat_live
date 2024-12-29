import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomClipOvalImage extends StatelessWidget {
  final String image;
  final int width;
  final double padding;
  const CustomClipOvalImage({super.key, required this.image,  this.width=75,  this.padding=20});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child:Padding(
        padding:  EdgeInsets.only(top: padding),
        child: SizedBox(
          width: width.w,
          child: ClipOval(
            child: FadeInImage.assetNetwork(
              placeholder:
              'https://www.bing.com/th?id=OIP.roQHQEuNf8SdJJ7wS3RxtgHaHa&w=150&h=150&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2',
              image: image,
              fit: BoxFit.cover,
              // Ensure the image covers the entire circular area
              imageErrorBuilder: (context, error, stackTrace) {
                return const Image(
                    image: NetworkImage(
                        'https://www.bing.com/th?id=OIP.roQHQEuNf8SdJJ7wS3RxtgHaHa&w=150&h=150&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2')); // Handle image loading error
              },
            ),
          ),
        ),
      ),
    );
  }
}
