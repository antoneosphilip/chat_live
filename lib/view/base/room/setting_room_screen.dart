import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_app/util/styles.dart';
import 'package:live_app/view/base/room/widget/choose_type_room.dart';
import 'package:live_app/view/widgets/app_bar.dart';

class SettingRoomScreen extends StatefulWidget {
  int i=0;

   SettingRoomScreen({super.key});

  @override
  State<SettingRoomScreen> createState() => _SettingRoomScreenState();
}

class _SettingRoomScreenState extends State<SettingRoomScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> list = [
      "Open to all",
      "Close the room",
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarCustom(name: "Room Setting"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.separated(
            shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    print("ssssss");
                    widget.i=index;
                    setState(() {
                    });
                    print(widget.i);
                  },
                  child: ChooseTypeRoom(
                    text: list[index], isSelected: widget.i==index,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10.h,
                );
              },
              itemCount: list.length),
          Container(
            width: double.infinity,
            height: 1.h,
            color: Colors.grey.shade300,
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Create a password for the room',
                            style: robotoBlack3,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Container(
                            width: 60.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: Colors.amber,
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.h),
                                child: Text(
                                  "PRO",
                                  style: robotoWhite,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        'You can set the password after purchasing the VIP',
                        style: robotoGreySmall,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.amber,
                  ),
                  child: Center(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.w),
                      child: Text(
                        "Open now",
                        style: robotoWhite.copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
