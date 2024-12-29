import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/gift_controller.dart';
import 'package:live_app/util/images.dart';
import 'package:live_app/view/base/room/layers/lock_layer.dart';
import 'package:live_app/view/screens/wallet/wallet_screen.dart';

import '../../../../controller/room_controller.dart';
import '../../../../controller/user_controller.dart';
import '../../../../util/app_constants.dart';
import '../../home/widget/filter_view.dart';


class GiftContainerAgora extends StatefulWidget {
  GiftContainerAgora({super.key});
  final ScrollController scrollController = ScrollController();

  @override
  State<GiftContainerAgora> createState() => _GiftContainerAgoraState();

}

class _GiftContainerAgoraState extends State<GiftContainerAgora> {

  @override
  void initState() {
    widget.scrollController.addListener(() {
      if (widget.scrollController.position.pixels ==
          widget.scrollController.position.maxScrollExtent &&
          !Get.find<GiftController>().isLoading) {
        print("sssssss");
        if (mounted) {
          Get.find<GiftController>().getGiftList(type: Get.find<GiftController>().selectedTypeId,page: Get.find<GiftController>().pageNation+1);
        }
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Get.find<RoomController>().getRoomOnMicUsers();
    Get.find<GiftController>().getGiftList();
    return GetBuilder<GiftController>(
        builder: (giftController) => Container(
            height: Get.height * 0.6,
            color: Colors.black26,
            child: Stack(
              children: [
                Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        height: 50,
                        child: Row(
                          children: [
                            Text(
                              'send : '.tr,
                              style: TextStyle(color: Colors.white),
                            ),
                            Expanded(
                              child: Container(
                                child: GetBuilder<RoomController>(
                                    builder: (roomcontroller) {
                                      return giftController.sendTo == 'room'
                                          ? Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 30, vertical: 10),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.purple),
                                              borderRadius:
                                              BorderRadius.circular(
                                                20,
                                              ),
                                            ),
                                            child: Text(
                                              'All Room'.tr,
                                              style: TextStyle(
                                                color: Colors.purple,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                          :  ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: roomcontroller.onMicUsers.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding:
                                              const EdgeInsets.all(8.0),
                                              child: Center(
                                                child: InkWell(
                                                  onTap: () {
                                                    giftController.selectUser(
                                                        roomcontroller
                                                            .mics[index]
                                                        ['user_id']);
                                                  },
                                                  child: Container(
                                                    width: 35,
                                                    height: 35,
                                                    decoration: BoxDecoration(
                                                      color: Colors.blueGrey,
                                                      // border: Border.all(
                                                      //   color: giftController
                                                      //       .selectedUserIds
                                                      //       .contains(roomcontroller
                                                      //       .mics[
                                                      //   index]
                                                      //   ['user_id'])
                                                      //       ? Colors.yellow
                                                      //       : Colors
                                                      //       .transparent,
                                                      // ),
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                        100,
                                                      ),
                                                    ),
                                                    child:  ClipOval(
                                                      child: FadeInImage.assetNetwork(
                                                        placeholder:
                                                        'https://www.bing.com/th?id=OIP.roQHQEuNf8SdJJ7wS3RxtgHaHa&w=150&h=150&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2',
                                                        image: roomcontroller.onMicUsers[index].image!,
                                                        fit: BoxFit.cover,
                                                        // Ensure the image covers the entire circular area
                                                        imageErrorBuilder: (context, error, stackTrace) {
                                                          return const Image(
                                                              image: NetworkImage(
                                                                  'https://www.bing.com/th?id=OIP.roQHQEuNf8SdJJ7wS3RxtgHaHa&w=150&h=150&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2')); // Handle image loading error
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          });;
                                    }),
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 4),
                              child: Row(
                                children: [
                                  DropDownView(
                                    selectedValue: '',
                                    text: 'all'.tr,
                                    items: [
                                      DropDownItem(
                                          value: "room", text: "All Room".tr),
                                      DropDownItem(
                                          value: "mic", text: "All Mic".tr),
                                    ],
                                    onSelected: (value) {
                                      giftController.setSendTo(value);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          height: 30,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: giftController.gift_type_list.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: InkWell(
                                    onTap: () {
                                      giftController.getGiftList(
                                          type: giftController
                                              .gift_type_list[index].id);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: giftController
                                              .gift_type_list[index]
                                              .id ==
                                              giftController.selectedTypeId
                                              ? Colors.indigoAccent
                                              : Colors.blueGrey,
                                          borderRadius:
                                          BorderRadius.circular(10)),
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Text(
                                          '${giftController.gift_type_list[index].name}',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              })),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        // Use Expanded instead of Flexible
                          child: GridView.builder(
                            controller:widget.scrollController,
                            itemCount: giftController.gift_list.length,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return Stack(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      giftController.selectGift(
                                          giftController.gift_list[index].id);
                                    },
                                    child: Container(
                                        padding: EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color:
                                              giftController.selectedGiftId ==
                                                  giftController
                                                      .gift_list[index].id
                                                  ? Colors.yellow
                                                  : Colors.blueGrey,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(10)),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Center(
                                              child: Text(
                                                "${giftController.gift_list[index].name}",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10),
                                              ),
                                            ),
                                            Container(
                                              width: 45,
                                              height: 45,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      "${AppConstants.baseUrl}/${AppConstants.mediaPath}/${giftController.gift_list[index].thumbnail}"),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                              children: [
                                                Container(
                                                  child: Text(
                                                    '${giftController.gift_list[index].price}',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 10),
                                                  ),
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 1, horizontal: 3),
                                                  decoration: BoxDecoration(
                                                      color: Colors.teal,
                                                      borderRadius:
                                                      BorderRadius.circular(3)),
                                                ),
                                                Image(
                                                  image: AssetImage(
                                                      Images.smallRoomDiamondIcon),
                                                  width: 15,
                                                  height: 15,
                                                )
                                              ],
                                            )
                                          ],
                                        )),
                                  ),
                                  (giftController.gift_list[index].isLocked == true)
                                      ? LockLayer()
                                      : Container()
                                ],
                              );
                            },
                          ))
                    ]),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    height: 60,
                    width: Get.width,
                    color: Colors.black54,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Colors.amberAccent,
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  // Get.find<GiftController>().sendGift(selectedGiftItemNotifier: null, countNotifier: null);
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.blueGrey),
                                  child: Text(
                                    'Send',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              GetBuilder<GiftController>(
                                builder: (controller) => DropDownView(
                                  selectedValue: controller.qty,
                                  text: 'X',
                                  items: [
                                    DropDownItem(value: "1", text: "1"),
                                    DropDownItem(value: "10", text: "10"),
                                    DropDownItem(value: "66", text: "66"),
                                    DropDownItem(value: "99", text: "99"),
                                    DropDownItem(value: "188", text: "188"),
                                    DropDownItem(value: "520", text: "520"),
                                    DropDownItem(value: "1314", text: "1314"),
                                    DropDownItem(value: "0", text: "other".tr),
                                  ],
                                  onSelected: controller.setQty,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.to(() => WalletScreen());
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                        color: Colors.amberAccent, width: 1),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.arrow_left_outlined,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        'recharge',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Text(
                                      '${Get.find<UserController>().userModel?.wallet?.diamond}',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Image(
                                      image:
                                      AssetImage(Images.bigRoomDiamondIcon),
                                      width: 30,
                                      height: 30,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }
}
