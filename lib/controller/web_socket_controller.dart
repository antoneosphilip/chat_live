// import 'dart:convert';
//
// import 'package:get/get.dart';
// import 'package:live_app/controller/room_controller.dart';
// import 'package:live_app/controller/user_controller.dart';
// import 'package:web_socket_channel/io.dart';
//
// import '../util/app_constants.dart';
//
// class WebSocketController extends GetxController implements GetxService {
//   bool inRoomGiftShow = false;
//   final channel = IOWebSocketChannel.connect(
//       '${AppConstants.webSocketUrl}?appKey=${AppConstants.webSocketAppKey}');
//   RoomController roomController = Get.find();
//   Map<String, dynamic>? sender;
//   Map<String, dynamic>? consignee;
//   Map<String, dynamic>? gift;
//
//   @override
//   void onInit() async {
//     super.onInit();
//     channel.stream.listen(
//       (message) {
//         Map<String, dynamic> data = jsonDecode(message);
//         if (data['event'] == 'gift_sent') {
//           if (data['room']['id'] == roomController.inRoom?.id) {
//             sender = data['sender'];
//             consignee = data['consignee'];
//             gift = data['gift'];
//             if (gift?['total'] >= 2000) {
//               inRoomGiftShow = true;
//               Future.delayed(Duration(seconds: 5), () {
//                 inRoomGiftShow = false;
//                 update();
//               });
//               sendRoomChatMessage(
//                 'sent'.tr +
//                     ' ${gift?['name']} x${gift?['x']} ' +
//                     'to'.tr +
//                     ' ${consignee?['name']}',
//                 sender?['id'],
//               );
//             } else {
//               sendRoomChatMessage(
//                   'sent'.tr +
//                       ' ${gift?['name']} x${gift?['x']} ' +
//                       'to'.tr +
//                       ' ${consignee?['name']}',
//                   sender?['id']);
//             }
//
//             update();
//           }
//         }
//       },
//     );
//   }
//
//   void sendRoomChatMessage(String message, int? senderId) {
//     if (senderId == Get.find<UserController>().userInfoModel?.id) {
//       Get.find<RoomController>().sendMessage(message);
//     }
//   }
//
//   void sendMessage(String message) {
//     channel.sink.add(message);
//   }
//
//   @override
//   void onClose() {
//     channel.sink.close();
//     super.onClose();
//   }
//
//   void hideInRoomGiftShow() {
//     inRoomGiftShow = false;
//     update();
//   }
// }
