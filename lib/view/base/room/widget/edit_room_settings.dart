import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:live_app/view/base/room/widget/room_defination_item.dart';
import 'package:live_app/view/base/room/widget/type_room_list_view.dart';

import '../../../../util/colors.dart';
import '../../../../util/styles.dart';
import 'custom_edit_room_textform_field.dart';

class EditRoomSettings extends StatelessWidget {
  const EditRoomSettings ({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          const RoomDefinationItem(
            text: 'Type room',
            icon: Icons.coffee,
            colorIcon: Colors.orangeAccent,
          ),
          SizedBox(
            height: 20.h,
          ),
          const TypeRoomListView(),
          SizedBox(
            height: 20.h,
          ),
          const RoomDefinationItem(
            text: 'Country/ Region',
            icon: Icons.public,
            colorIcon: Colors.greenAccent,
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              Container(
                width: 80.w,
                height: 50.h,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(8.r),
                  color: Colors.deepPurpleAccent.shade100
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SvgPicture.asset('assets/flags/egypt.svg',width: 15.w,height: 15.h,),
                ),
              ),
              SizedBox(width: 16.w,),
              Container(
                height: 50.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: ColorManger.colorPurpleTextForm,
                ),
                child: Center(
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 30.w,),
                        child: Text('1000',style: robotoWhiteMedium,),
                      ),
                       SizedBox(width: 2.w,),
                       Image(image: const AssetImage('assets/images/juail.png',),width: 30.w,height: 30.h,),
                      SizedBox(width: 30.w,),

                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
              height: 30.h,
          ),
          const RoomDefinationItem(
            text: 'Room name',
            icon: Icons.home_filled,
            colorIcon: Colors.white,
          ),
          SizedBox(
            height: 15.h,
          ),
          const CustomEditRoomTextFormField(),
          SizedBox(
            height: 30.h,
          ),
          const RoomDefinationItem(
            text: 'Room advertisement',
            icon: Icons.pages,
            colorIcon: Colors.white,
          ),
          SizedBox(
            height: 15.h,
          ),
          const CustomEditRoomTextFormField(
            isMaxLine: true,
          ),
          SizedBox(
            height: 30.h,
          ),
          const RoomDefinationItem(
            text: 'Room type',
            icon: Icons.circle,
            colorIcon: Colors.white,
          ),
          SizedBox(
            height: 15.h,
          ),
          SizedBox(
            height: 300.h,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          Container(
                              width: 100.w,
                              height: 200.h,
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(16.r),
                              ),
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: '',
                                placeholder: (context, url) =>
                                const Center(
                                    child:
                                    CircularProgressIndicator(
                                      color: ColorManger.primary,
                                    )),
                                errorWidget: (context, url, error) =>
                                const Image(
                                  image: CachedNetworkImageProvider(
                                    'https://www.bing.com/th?id=OIP.roQHQEuNf8SdJJ7wS3RxtgHaHa&w=150&h=150&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              )),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Colors.white,
                                    Colors.white
                                  ]),
                                  border: Border.all(
                                      color:
                                      ColorManger.colorPurpleMix),
                                  borderRadius:
                                  BorderRadius.circular(8.r)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 10.h),
                                child: Center(
                                  child: Text(
                                    '220',
                                    style: robotoBlack2.copyWith(
                                        decoration:
                                        TextDecoration.none,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              )),
                        ],
                      ));
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 15.w,
                  );
                },
                itemCount: 3),
          )
        ],
      ),
    );
  }
}
