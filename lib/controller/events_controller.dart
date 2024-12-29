import 'dart:async';

import 'package:get/get.dart';

import '../data/model/body/lite_gift.dart';
import '../data/model/body/lite_room.dart';
import '../data/model/body/lite_user.dart';

class EventsController extends GetxController implements GetxService {
  bool bigHorn = false;
  bool allRoom = false;
  bool allSeats = false;
  bool inRoom = false;

  LiteGift? inRoomGiftSent;
  LiteUser? inRoomGiftSender;
  List<LiteUser>? inRoomGiftConsignees;
  LiteGift? bigHornGift;
  LiteUser? bigHornSender;
  LiteRoom? bigHornRoom;
  LiteGift? allRoomGiftSent;
  LiteUser? allRoomGiftSender;
  LiteRoom? allRoomGiftRoom;
  LiteGift? allSeatsGiftSent;
  LiteUser? allSeatsGiftSender;
  LiteRoom? allSeatsGiftRoom;

  void showInRoomSentGift(
      {Map<String, dynamic>? sender,
      Map<String, dynamic>? gift,
      List<Map<String, dynamic>>? consignees}) {
    inRoomGiftSent = LiteGift.fromJson(gift!);
    inRoomGiftSender = LiteUser.fromJson(sender!);
    consignees
        ?.map((user) => inRoomGiftConsignees?.add(LiteUser.fromJson(user)));
    inRoom = true;
    update();
    Timer(const Duration(seconds: 5), () {
      inRoom = false;
      update();
    });
  }

  void showBigHorn(
      {Map<String, dynamic>? sender,
      Map<String, dynamic>? gift,
      Map<String, dynamic>? room}) {
    bigHornGift = LiteGift.fromJson(gift!);
    bigHornSender = LiteUser.fromJson(sender!);
    bigHornRoom = LiteRoom.fromJson(room!);
    bigHorn = true;
    update();
    Timer(const Duration(seconds: 2), () {
      bigHorn = false;
      update();
    });
  }

  void showAllRoom(
      {Map<String, dynamic>? sender,
      Map<String, dynamic>? gift,
      Map<String, dynamic>? room}) {
    allRoomGiftSent = LiteGift.fromJson(gift!);
    allRoomGiftSender = LiteUser.fromJson(sender!);
    allRoomGiftRoom = LiteRoom.fromJson(room!);
    allRoom = true;
    update();
    Timer(const Duration(seconds: 2), () {
      allRoom = false;
      update();
    });
  }

  void showAllSeats(
      {Map<String, dynamic>? sender,
      Map<String, dynamic>? gift,
      Map<String, dynamic>? room}) {
    allSeatsGiftSent = LiteGift.fromJson(gift!);
    allSeatsGiftSender = LiteUser.fromJson(sender!);
    allSeatsGiftRoom = LiteRoom.fromJson(room!);
    allSeats = true;
    update();
    Timer(const Duration(seconds: 2), () {
      allSeats = false;
      update();
    });
  }

  void hideInRoomSentGift() {
    inRoom = false;
    update();
  }
}
