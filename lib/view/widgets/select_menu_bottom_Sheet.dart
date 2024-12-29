import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/room_controller.dart';
import 'package:live_app/data/model/response/add_blacklist_model.dart';
import 'package:zego_uikit/src/services/defines/user.dart';

class SelectMenuBottomSheet extends StatefulWidget {
  final String userId;

  const SelectMenuBottomSheet({Key? key, required this.userId}) : super(key: key);


  @override
  _SelectMenuBottomSheetState createState() => _SelectMenuBottomSheetState();
}

class _SelectMenuBottomSheetState extends State<SelectMenuBottomSheet> {
  // Dropdown menu values
  String? selectedOption;
  int? selectedNumber;

  // List of options for Year, Month, Day, Hour
  final List<String> options = ['Year', 'Month', 'Day', 'Hour'];
  final List<int> numbers =
  List.generate(50, (index) => index + 1); // Numbers from 1 to 50

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RoomController>(
      builder: (roomController) {
        return Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Dropdown for Year/Month/Day/Hour
              DropdownButton<String>(
                hint: Text('Select Year, Month, Day, or Hour'),
                value: selectedOption,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedOption = newValue;
                  });
                },
                items: options.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 20.h),
              // Dropdown for selecting a number
              DropdownButton<int>(
                hint: const Text('Select Number'),
                value: selectedNumber,
                onChanged: (int? newValue) {
                  setState(() {
                    selectedNumber = newValue;
                  });
                },
                items: numbers.map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString()),
                  );
                }).toList(),
              ),
              SizedBox(height: 20.h),
              // Button to confirm selection and close the bottom sheet
              ElevatedButton(
                onPressed: () {
                  if (selectedOption != null && selectedNumber != null) {
                    roomController.addUserToBlackList(
                        addUserBlackListModel: AddUserBlackListModel(
                            duration: selectedNumber,
                            timeUnit: selectedOption,
                            userId: widget.userId));
                  }
                },
                child: const Text('Confirm Selection'),
              ),
            ],
          ),
        );
      },
    );
  }
}
