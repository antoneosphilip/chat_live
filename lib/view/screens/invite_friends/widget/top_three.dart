import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_app/util/app_constants.dart';
import 'package:live_app/view/screens/users/user_details_screen.dart';
import 'package:live_app/view/widgets/avatar_with_frame.dart';



class TopThreeInviteFriends extends StatelessWidget {
  const TopThreeInviteFriends({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  AvatarWithFrame(
                    radius: 40,
                    frame: AssetImage(
                      'assets/images/top2.webp',
                    ),
                    avatar: NetworkImage(
                        'https://www.bing.com/th?id=OIP.roQHQEuNf8SdJJ7wS3RxtgHaHa&w=150&h=150&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2')

                  ),
                  Text('antoneos',
                    style: TextStyle(fontSize: 10),
                  ),

                ],
              ),
            ),
            Column(
              children: [
                AvatarWithFrame(
                  radius: 40,
                  frame: AssetImage(
                    'assets/images/top1.webp',
                  ),
                  avatar:NetworkImage(
                      'https://www.bing.com/th?id=OIP.roQHQEuNf8SdJJ7wS3RxtgHaHa&w=150&h=150&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2')

                ),

                Text(
                  'antoneos',
                  style: TextStyle(fontSize: 10),
                ),

              ],
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: AvatarWithFrame(
                    radius: 40,
                    frame: AssetImage(
                      'assets/images/top3.webp',
                    ),
                    avatar: NetworkImage(
                        'https://www.bing.com/th?id=OIP.roQHQEuNf8SdJJ7wS3RxtgHaHa&w=150&h=150&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2')
                  ),
                ),
                Text(
                   'tony',
                  style: TextStyle(fontSize: 10),
                ),

              ],
            )
          ],
        )
      ],
    );
  }
}
