import 'package:flutter/material.dart';

import '../../../../util/app_constants.dart';

class CustomInRoomMessage extends StatelessWidget {
  final dynamic message;
  final dynamic image;
  const CustomInRoomMessage({super.key, this.message, this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
      width: double.infinity,
      alignment: Alignment.center,
      color: Colors.transparent,
      child: Row(
        children: [
          CircleAvatar(
            radius: 15,
            backgroundImage: NetworkImage(
              '${AppConstants.mediaUrl}/profile/${image}',
            ),
          ),
          SizedBox(
            width: 3,
          ),
          Text(
            '${message.user.name} : ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/image/main/msg_inroom_bg.png',
                  ),
                  fit: BoxFit.fill),
            ),
            child: Text(
              '${message.message}',
              style: TextStyle(fontSize: 10, color: Colors.yellow),
              maxLines: 10,
            ),
          )
        ],
      ),
    );
  }
}
