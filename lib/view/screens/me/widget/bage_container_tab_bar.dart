import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../controller/my_bag_controller.dart';
import '../../../../util/app_constants.dart';
import '../../../../util/images.dart';

class BageContainerTabBar extends StatelessWidget {
  final MyBagController myBagController;
  const BageContainerTabBar({super.key, required this.myBagController});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller:
      myBagController.tabController,
      children: [
        ...myBagController.typesListStatic
            .map(
                (e) => GridView
                .builder(
              itemCount: e
                  .items
                  ?.length,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                4,
                crossAxisSpacing:
                10,
                mainAxisSpacing:
                10,
              ),
              itemBuilder:
                  (BuildContext
              context,
                  int index) {
                return Stack(
                  children: [
                    InkWell(
                      onTap:
                          () {
                        myBagController.setSelectedItem(e.items![index]);
                      },
                      child: Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: myBagController.selectedItemStatic?.id == e.items?[index].id ? Colors.yellow : Colors.blueGrey,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  "${e.items?[index].duration}",
                                  style: TextStyle(color: Colors.teal, fontSize: 10),
                                ),
                              ),
                              Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    // ${AppConstants.baseUrl}/
                                    image: NetworkImage("${e.items?[index].thumbnail}"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
                                    child: Text(
                                      '${e.items?[index].price}',
                                      style: TextStyle(color: Colors.blue, fontSize: 10.sp),
                                    ),
                                  ),
                                  const Image(
                                    image: AssetImage(Images.smallRoomDiamondIcon),
                                    width: 15,
                                    height: 15,
                                  )
                                ],
                              )
                            ],
                          )),
                    ),
                  ],
                );
              },
            ))
      ],
    );
  }
}
