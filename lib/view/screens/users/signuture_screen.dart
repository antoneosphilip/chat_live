import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/user_controller.dart';
import 'package:live_app/data/model/response/update_profile_model.dart';
import 'package:live_app/util/dimensions.dart';
import 'package:live_app/util/styles.dart';
import 'package:live_app/view/widgets/app_bar.dart';

class SignatureScreen extends StatefulWidget {

  SignatureScreen({super.key});

  @override
  State<SignatureScreen> createState() => _SignatureScreenState();
}

class _SignatureScreenState extends State<SignatureScreen> {
  int _charCount = 0;

  @override
  Widget build(BuildContext context) {
    final userController= Get.find<UserController>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarCustom(
        name: 'Signature',
        actions: [
          InkWell(
            onTap: () {
              userController.updateUserInfo(UpdateProfileModel(
                pio: userController.pioController.text
              ));
            },
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(right: 16.w),
                child: Text(
                  "Confirm",
                  style: robotoWhite.copyWith(
                    color:_charCount>0? Colors.pink:Colors.grey,
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
                controller:userController.pioController ,
                maxLines: null,
                onChanged: (text) {
                  setState(() {
                    _charCount = text.length;
                  });
                },
                decoration:  InputDecoration(
                  border: InputBorder.none,
                  hintText: userController.userDetailsModel?.pio??"",
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
                    '${_charCount}/50',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  SizedBox(width: 6.w),
                  Container(
                    width: 20.w,
                    height: 20.h,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                    child: InkWell(
                      onTap: () {
                        userController.pioController.clear();
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
  }
}
