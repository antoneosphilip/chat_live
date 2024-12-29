import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_app/controller/create_family_controller.dart';

import '../../../../util/dimensions.dart';
import '../../../../util/styles.dart';
import '../../../base/custom_text_field.dart';

class CreateFamilyTextFormFields extends StatefulWidget {
  final CreateFamilyController createFamilyController;
  const CreateFamilyTextFormFields({super.key, required this.createFamilyController});

  @override
  State<CreateFamilyTextFormFields> createState() => _CreateFamilyTextFormFieldsState();
}

class _CreateFamilyTextFormFieldsState extends State<CreateFamilyTextFormFields> {
  @override
  void initState() {
    widget.createFamilyController.checkIfIntroduceFilled();
    widget.createFamilyController.checkIfNameFilled();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.createFamilyController.formKey,
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.deepPurpleAccent.shade200,
                size: 20.sp,
              ),
              Text(
                "Family name",
                style: robotoBlack2.copyWith(
                    fontSize: Dimensions.fontSizeExtraLarge),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 2.w, right: 24.w),
            child:  CustomTextField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Name is required';
                }
                return null;
              },
              controller: widget.createFamilyController.nameController,
              showBorder: false,
              titleText: "Enter up to 20 character",
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.deepPurpleAccent.shade200,
                size: 20.sp,
              ),
              Text(
                "Family Logo",
                style: robotoBlack2.copyWith(
                    fontSize: Dimensions.fontSizeExtraLarge),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 2.w, right: 24.w),
            child:  CustomTextField(
              controller: widget.createFamilyController.logo,
              showBorder: false,
              titleText: "logo",
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.deepPurpleAccent.shade200,
                size: 20.sp,
              ),
              Text(
                "Family introduction",
                style: robotoBlack2.copyWith(
                    fontSize: Dimensions.fontSizeExtraLarge),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 2.w, right: 24.w),
            child:  CustomTextField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Name is required';
                }
                return null;
              },
              controller: widget.createFamilyController.introduce,
              showBorder: false,
              titleText: "Enter up to 100 character",
              maxLines: 7,
            ),
          ),
        ],
      ),
    );
  }
}
