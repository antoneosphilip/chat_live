import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/util/dimensions.dart';
import 'package:live_app/util/styles.dart';
import 'package:live_app/view/widgets/app_bar.dart';

import '../../../controller/user_controller.dart';
import '../../../data/model/response/update_profile_model.dart';
import '../../../data/model/response/userinfo_model.dart';

class NickNameScreen extends StatefulWidget {
  final String firstName;
  const NickNameScreen({super.key, required this.firstName});

  @override
  State<NickNameScreen> createState() => _NickNameScreenState();
}

class _NickNameScreenState extends State<NickNameScreen> {
  int _charCount = 0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      builder: (userController) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBarCustom(
            name: 'Nickname',
            actions: [
              InkWell(
                onTap: () {
                  userController.updateUserInfo(UpdateProfileModel(fName: userController.nameController.text));
                },
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(right: 16.w),
                    child: Text(
                      "Confirm",
                      style: robotoWhite.copyWith(
                        color: _charCount > 0 ? Colors.pink : Colors.grey,
                        fontSize: Dimensions.fontSizeLarge,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: userController.nameController,
                    maxLines: null,
                    onChanged: (text) {
                      setState(() {
                        _charCount = text.length;
                      });
                    },
                    decoration:  InputDecoration(
                      border: InputBorder.none,
                      hintText: userController.userDetailsModel?.name?.split(' ').first,
                    ),
                  ),
                ),
                SizedBox(width: 6.w),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '$_charCount/50',
                        style: TextStyle(fontSize: 16.sp),
                      ),
                      SizedBox(width: 6.w),
                      Container(
                        width: 20.w,
                        height: 20.h,
                        decoration:   const BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                        child: InkWell(
                          onTap: () {
                            userController.nameController.clear();
                            setState(() {
                              _charCount=0;
                            });
                          },
                          child: const Center(
                            child: Icon(
                              Icons.close,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
