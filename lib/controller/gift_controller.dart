import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_app/controller/room_controller.dart';
import 'package:live_app/controller/user_controller.dart';
import 'package:live_app/data/model/response/gift_model.dart';
import 'package:live_app/data/model/response/gift_type.dart';
import 'package:live_app/data/repository/gift_repo.dart';
import '../data/api/api_checker.dart';
import '../view/base/custom_snackbar.dart';
import '../view/screens/room/gift/gift_manager/defines.dart';
import '../view/screens/room/gift/gift_manager/gift_manager.dart';

class GiftController extends GetxController implements GetxService {
  final GiftRepo giftRepo;

  GiftController({required this.giftRepo});

  UserController userController = Get.find();
  List<GiftModel> gift_list = [];
  List<GiftModel> gift_listStatic = [
    GiftModel(
      id: 1,
      name: "Golden Rose",
      price: "10.00",
      points: 100,
      vipLevel: 2,
      thumbnail: "https://th.bing.com/th/id/OIP.0TyMzIxLzR-esPkAB0Fy6wHaE8?rs=1&pid=ImgDetMain",
      image: "https://th.bing.com/th/id/OIP.0TyMzIxLzR-esPkAB0Fy6wHaE8?rs=1&pid=ImgDetMain",
      type: 1,
      status: 1,
      broadcastingStatus: 1,
      isLocked: false,
    ),
    GiftModel(
      id: 2,
      name: "Silver Crown",
      price: "20.00",
      points: 200,
      vipLevel: 3,
      thumbnail: "https://th.bing.com/th/id/OIP.0TyMzIxLzR-esPkAB0Fy6wHaE8?rs=1&pid=ImgDetMain",
      image: "https://th.bing.com/th/id/OIP.0TyMzIxLzR-esPkAB0Fy6wHaE8?rs=1&pid=ImgDetMain",
      type: 2,
      status: 1,
      broadcastingStatus: 0,
      isLocked: true,
    ),
    GiftModel(
      id: 3,
      name: "Diamond Ring",
      price: "50.00",
      points: 500,
      vipLevel: 5,
      thumbnail: "https://th.bing.com/th/id/OIP.0TyMzIxLzR-esPkAB0Fy6wHaE8?rs=1&pid=ImgDetMain",
      image: "https://th.bing.com/th/id/OIP.0TyMzIxLzR-esPkAB0Fy6wHaE8?rs=1&pid=ImgDetMain",
      type: 3,
      status: 1,
      broadcastingStatus: 1,
      isLocked: false,
    ),
  ];

  List<GiftType> gift_type_list = [];
  List<GiftType> gift_type_listStatic = [
    GiftType(
      id: 1,
      slug: "flowers",
      name: "Flowers",
    ),
    GiftType(
      id: 2,
      slug: "crowns",
      name: "Crowns",
    ),
    GiftType(
      id: 3,
      slug: "jewelry",
      name: "Jewelry",
    ),
    GiftType(
      id: 4,
      slug: "special",
      name: "Special Gifts",
    ),
  ];


  int? selectedGiftId = 0;
  List<String> selectedUserIds = [];
  int? selectedTypeId = 1;
  bool isLoading = false;
  String? qty = "1";
  String? sendTo;
  int pageNation = 1;

  bool inRoomGiftShow = false;

  void setQty(String value) {
    if (selectedGiftId == 0) {
      showCustomSnackBar('please select gift'.tr,
          getXSnackBar: true, color: Colors.deepOrangeAccent);
    } else {
      qty = value;
    }
    update();
  }

  bool isPagination = true;

  Future<void> getGiftList({int? type = 1, int page = 1}) async {
    isLoading = true;
    selectedTypeId = type;
    Response response = await giftRepo.getGiftList(type: type, page: page);
    if (response.statusCode == 200) {
      List<GiftModel> newList = [];
      List<GiftType> giftTypeList = [];
      List giftListResponse = response.body['data']['gifts'];
      List giftTypeListResponse = response.body['data']['types'];
      for (var item in giftTypeListResponse) {
        var type = GiftType.fromJson(item);
        giftTypeList.add(type);
      }
      for (var item in giftListResponse) {
        var gift = GiftModel.fromJson(item);
        newList.add(gift);
      }
      if (newList.isNotEmpty) {
        pageNation = page;
      } else {
        isPagination = false;
      }
      if (isPagination) {
        gift_list.addAll(newList);
        gift_type_list.addAll(giftTypeList);
      }
    } else {
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();
  }

  Future<void> sendGift({required ValueNotifier<ZegoGiftItem?> selectedGiftItemNotifier,required ValueNotifier<String> countNotifier }) async {
    if (selectedGiftId == 0) {
      Get.defaultDialog(title: 'error', content: Text('please select gift'.tr));
      return;
    }
    if (selectedUserIds.isEmpty) {
      Get.defaultDialog(
          title: 'error', content: Text('please select consignees'.tr));
      return;
    }
    Response response =
        await giftRepo.sendGift(selectedUserIds, selectedGiftId, qty);
    if (response.statusCode == 200) {
      final giftItem = selectedGiftItemNotifier.value!;
      final giftCount = int.tryParse(countNotifier.value) ?? 1;

      /// local play
      ZegoGiftManager().playList.add(PlayData(giftItem: giftItem, count: giftCount));

      /// notify remote host
      ZegoGiftManager().service.sendGift(name: giftItem.name, count: giftCount);
    } else {
      ApiChecker.checkApi(response);
    }
  }

  void selectGift(int? id) {
    selectedGiftId = id;
    update();
  }

  void selectUser(String? id) {
    if (selectedUserIds.contains(id)) {
      selectedUserIds.remove(id);
    } else {
      selectedUserIds.add(id!);
    }
    update();
  }

  void hideInRoomGiftShow() {
    inRoomGiftShow = false;
    update();
  }

  void setSendTo(String? value) {
    sendTo = value;
    if (value == 'mic') {
      List<String> users = [];
      Get.find<RoomController>().mics.forEach((e) {
        users.add(e['user_id']);
      });
      selectedUserIds = users;
    }
    update();
  }
}
