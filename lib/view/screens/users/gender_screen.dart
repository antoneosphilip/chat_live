import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/user_controller.dart';
import 'package:live_app/data/model/response/update_profile_model.dart';
import 'package:live_app/view/widgets/app_bar.dart';

enum Gender { male, female }

class GenderScreen extends StatefulWidget {
  @override
  _GenderScreenState createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  Gender selectedGender = Get
      .find<UserController>()
      .userDetailsModel
      ?.gender == 'male' ? Gender.male : Gender.female;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(name: 'Gender'),
      body: Column(
        children: [
          ListTile(
            title: const Text("Male"),
            leading: Radio<Gender>(
              value: Gender.male,
              groupValue: selectedGender,
              onChanged: (Gender? value) {
                setState(() {
                  selectedGender = value!;
                });
                updateGender(selectedGender: 'male',);
              },
            ),
          ),
          ListTile(
            title: const Text("Female"),
            leading: Radio<Gender>(
              value: Gender.female,
              groupValue: selectedGender,
              onChanged: (Gender? value) {
                setState(() {
                  selectedGender = value!;
                });
                updateGender(selectedGender: 'female');
              },
            ),
          ),
        ],
      ),
    );
  }
}

void updateGender({required String selectedGender}) {
  Get.find<UserController>().updateUserInfo(UpdateProfileModel(
    gender: selectedGender,
  ));
}
