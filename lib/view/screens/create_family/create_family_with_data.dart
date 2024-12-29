import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/create_family_controller.dart';
import 'package:live_app/view/screens/create_family/widget/create_famile_text_form_fields.dart';
import 'package:live_app/view/screens/create_family/widget/show_dialog_family.dart';
import 'package:live_app/view/screens/create_family/widget/upload_image_circle_avatar.dart';
import 'package:live_app/view/widgets/app_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../util/colors.dart';
import '../../widgets/delete_show_dialog.dart';
import '../../widgets/flutter_Show_toast.dart';

class CreateFamilyWithData extends StatefulWidget {
  final String image;
  final String gold;

  const CreateFamilyWithData(
      {super.key, required this.image, required this.gold});


  @override
  State<CreateFamilyWithData> createState() => _CreateFamilyWithDataState();
}

class _CreateFamilyWithDataState extends State<CreateFamilyWithData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: const AppBarCustom(name: "Create a Family"),
      body: SingleChildScrollView(child: GetBuilder<CreateFamilyController>(
        builder: (createFamilyController) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30.h,
              ),
              UploadImageCircleAvatar(
                createFamilyController: createFamilyController,
                image: widget.image,

              ),
              SizedBox(
                height: 40.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: Column(
                    children: [
                      CreateFamilyTextFormFields(
                        createFamilyController: createFamilyController,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        width: 330.w,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor:
                            createFamilyController.checkIntroduceFilled &&
                                createFamilyController.checkNameFilled
                                ? ColorManger.colorPurple
                                : ColorManger.grey,
                            // Text color
                            padding: EdgeInsets.symmetric(
                                horizontal: 100.w, vertical: 16.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  24.r), // Rounded corners
                            ),
                          ),
                          onPressed: () {
                            showDialog(context: context, builder: (context) {

                              return FamilyShowDialog(
                                onTap: () async {
                                  print("sss");
                                  if(double.parse(widget.gold) > 1500) {
                                    if( createFamilyController.checkIntroduceFilled &&
                                        createFamilyController.checkNameFilled &&
                                        !createFamilyController.isLoading) {
                                      createFamilyController.createFamily();
                                    Navigator.pop(context);
                                    }
                                  }
                                  else
                                  {
                                    flutterShowToast(message: 'doesnt enough', toastCase: ToastCase.error);
                                  }
                              },);
                            },);
                          },
                          child: !createFamilyController.isLoading
                              ? Text(
                            "Create Family",
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: ColorManger.whiteColor),
                          )
                              : Row(
                            children: [
                              SizedBox(
                                  width: 20.w,
                                  height: 20.h,
                                  child: const Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ))),
                              SizedBox(
                                width: 20.w,
                              ),
                              const Text(
                                "Loading.....",
                                style: TextStyle(fontSize: 14),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )

              // Positioned camera icon at the bottom-right
            ],
          );
        },
      )),
    );
  }
}
