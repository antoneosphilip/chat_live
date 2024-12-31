import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:live_app/controller/user_controller.dart';

import '../../../../util/app_constants.dart';

class UserDetailsBackGrounImage extends StatelessWidget {
  final UserController userController;
  const UserDetailsBackGrounImage({super.key, required this.userController});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.3,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    // ${AppConstants.mediaUrl}/profile/
                    "${userController.userDetailsModelStatic?.image}"),
                fit: BoxFit.fill),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black38,
        ),
      ],
    );
  }
}
