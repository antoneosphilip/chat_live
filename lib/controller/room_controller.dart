import 'dart:convert';
import 'dart:core';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:live_app/controller/user_controller.dart';
import 'package:live_app/data/model/response/add_blacklist_model.dart';
import 'package:live_app/data/model/response/room_type_model.dart';
import 'package:live_app/data/repository/room_repo.dart';
import 'package:live_app/util/app_constants.dart';
import 'package:live_app/view/base/custom_text_field.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:zego_uikit_prebuilt_live_audio_room/zego_uikit_prebuilt_live_audio_room.dart';

import '../data/api/api_checker.dart';
import '../data/model/response/get_back_ground_model.dart';
import '../data/model/response/get_black_list_model.dart';
import '../data/model/response/gift_model.dart';
import '../data/model/response/response_model.dart';
import '../data/model/response/room_model.dart';
import '../data/model/response/room_types_model.dart';
import '../data/model/response/show_room_model.dart';
import '../data/model/response/user_model.dart';
import '../helper/network_info.dart';
import '../helper/route_helper.dart';
import '../services/scho_service.dart';
import '../view/base/custom_snackbar.dart';
import '../view/base/input_dialog.dart';
import '../view/screens/room/agora/audio_room_Screen.dart';
import '../view/widgets/flutter_Show_toast.dart';

class RoomController extends GetxController implements GetxService {
  final RoomRepo roomRepo;
  TextEditingController passwordController = TextEditingController();
  int room_list_count = 0;

  RoomController({required this.roomRepo});

  RoomBlackListModel? roomBlackListModel;
  GetBackGroundModel? getBackGroundList;

  UserController userController = Get.find();
  RoomModel? inRoom;
  ShowRoomModel? showRoomModel;

  UserModel? user;
  List<RoomModel> inHomeRoomList = [];
  List<RoomModel> roomList = [];
  List<RoomModel> topThree = [];
  List<UserModel> visitors = [];
  List<UserModel> onMicUsers = [];
  List<RoomTypeModel> roomTypeList = [];
  List<Map<String, dynamic>> mics = [];
  bool isLoading = false;
  List<int> initializedHomePages = [];
  List<int> initializedPages = [];
  int inHomePage = 1;
  int page = 1;

  bool outRoomGiftShow = false;
  bool inRoomGiftShow = false;

  GiftModel? sentGift;

  XFile? pickedFile;
  Uint8List? rawFile;
  final TextEditingController messageController = TextEditingController();
  int? roomTypeId;

  void hideInRoomGiftShow() {}

  void updateRoomList() {}

  void updateMicList(Map<String, dynamic> mic) {
    mics.add(mic);
    update();
  }

  Future<void> sendMessage(String message) async {
    await AudioRoomMessageControllerImpl().send(message);
  }

  void updateMessages(String message) {
    List<ZegoInRoomMessage> msgs = AudioRoomMessageControllerImpl().list();
    msgs.add(ZegoInRoomMessage(
        user: ZegoUIKitUser(id: '123', name: 'mmm'),
        message: message,
        timestamp: 00021154,
        messageID: 1.toString()));
  }

  Future<void> getTopThree() async {
    Response response = await roomRepo.getTopThreeRooms();
    if (response.statusCode == 200) {
      List<RoomModel> topList = [];
      for (var item in response.body['data']) {
        var room = RoomModel.fromJson(item);
        topList.add(room);
      }
      topThree = topList;
    } else {
      ApiChecker.checkApi(response);
    }
    update();
  }

  Future<void> getHomeRooms(String? filter) async {
    if (initializedHomePages.contains(inHomePage)) {
      return;
    }
    isLoading = true;
    update();
    Response response = await roomRepo.getHomeRooms('page=$inHomePage');
    if (response.statusCode == 200) {
      List<RoomModel> resRoomList = [];
      for (var item in response.body['data']) {
        var room = RoomModel.fromJson(item);
        resRoomList.add(room);
      }
      if (resRoomList.isNotEmpty) {
        initializedHomePages.add(inHomePage);
        inHomePage += 1;
      }
      inHomeRoomList.addAll(resRoomList);
    } else {
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();
  }

  Future<List<RoomModel>> getListOfRooms(String? filter) async {
    Response response = await roomRepo.getRooms(filter);
    if (response.statusCode == 200) {
      List<RoomModel> roomList = [];
      for (var item in response.body['data']) {
        var room = RoomModel.fromJson(item);
        roomList.add(room);
      }
      return roomList;
    } else {
      ApiChecker.checkApi(response);
      return [];
    }
  }

  Future<void> getRoomVisitors() async {
    isLoading = true;
    Response response = await roomRepo.getRoomVisitors(inRoom?.id);
    if (response.statusCode == 200) {
      List<UserModel> visitorList = [];
      for (var item in response.body['data']) {
        var user = UserModel.fromJson(item);
        visitorList.add(user);
      }
      print("item${visitorList.length}");

      visitors = visitorList;
    } else {
      ApiChecker.checkApi(response);
      isLoading = false;
    }
    isLoading = false;

    update();
  }

  Future<void> getRoomOnMicUsers() async {
    Response response = await roomRepo.getRoomOnMicUsers(inRoom?.id);
    if (response.statusCode == 200) {
      List<UserModel> onMicList = [];
      for (var item in response.body['data']) {
        var user = UserModel.fromJson(item);
        onMicList.add(user);
      }
      onMicUsers = onMicList;
    } else {
      ApiChecker.checkApi(response);
    }
    update();
  }

  Future<void> joinRoom(RoomModel room) async {
    if (room.isOwner == true) {
      doJoin(room);
    } else {
      if (room.isUserRoomBlocked == true) {
        Get.defaultDialog(
            title: "${room.name}",
            content: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.block,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 20,
                ),
                Text('2029-2-30')
              ],
            ));
        return;
      } else {
        if (room.hasPassword == true) {
          Get.defaultDialog(
            title: "${room.name}",
            content: InputDialog(
              icon: 'assets/icons/seat_lock_icon.png',
              child: CustomTextField(
                titleText: 'write password'.tr,
                controller: passwordController,
              ),
              onYesPressed: () {
                Get.back();
                if (passwordController.value.text == room.password) {
                  doJoin(room);
                } else {
                  showCustomSnackBar('wrong_password'.tr,
                      isError: true, getXSnackBar: true);
                }
              },
            ),
          );
        } else {
          doJoin(room);
        }
      }
    }
  }

  Future<void> leaveRoom() async {
    roomRepo.leaveRoom();
  }

  void resetPassword() {
    passwordController.text = '';
  }

  Future<void> doJoin(RoomModel room) async {
    inRoom = room;
    user = Get.find<UserController>().userModel;
    update();
    Get.toNamed(RouteHelper.room);
    Get.find<EchoService>().listenPublic(
        'room.${room.id}', 'UserLeavedRoom', (Map<String, dynamic> event) {});
    Get.find<EchoService>().listenPublic('room.${room.id}', 'UserJoinedRoom',
        (Map<String, dynamic> event) {
      print('UserJoinedRoom');
    });

    Get.find<EchoService>().listenPublic('room.${room.id}', 'UserSendGift',
        (Map<String, dynamic> event) {
      sentGift = GiftModel(image: event['gift']['image']);
      inRoomGiftShow = true;
      update();
      Future.delayed(Duration(seconds: 10), () {
        inRoomGiftShow = false;
        update();
      });
    });

    Response response =
        await roomRepo.joinRoom(room.id, passwordController.value.text);
    resetPassword();
    if (response.statusCode == 200) {
      inRoom = RoomModel.fromJson(response.body['data']);
    } else {
      ApiChecker.checkApi(response);
    }
    update();
  }

  Future<void> takeMic(String? roomId, String? micNum) async {
    Response response = await roomRepo.takeMic(roomId, micNum);
    if(response.statusCode==200){
      getRoomOnMicUsers();
    }
    else
    {
      ApiChecker.checkApi(response,isList: false);
    }
  }

  Future<void> leaveMic(String? roomId, String? micNum) async {
    await roomRepo.leaveMic(roomId, micNum);
    getRoomOnMicUsers();
  }

  Future<void> getRoomTypes() async {
    isLoading = true;
    Response response = await roomRepo.getRoomTypes();
    if (response.statusCode == 200) {
      List<RoomTypeModel> list = [];
      for (var item in response.body['data']) {
        var type = RoomTypeModel.fromJson(item);
        list.add(type);
      }
      roomTypeList = list;
    } else {
      ApiChecker.checkApi(response);
    }
    isLoading = false;

    update();
  }

  void pickImage() async {
    pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      pickedFile = await NetworkInfo.compressImage(pickedFile!);
      rawFile = await pickedFile!.readAsBytes();
    }
    update();
  }

  Future<ResponseModel> createRoom(RoomModel roomModel, String token) async {
    isLoading = true;
    update();
    ResponseModel responseModel;
    Response response =
        await roomRepo.createRoom(roomModel, pickedFile, roomTypeId, token);
    isLoading = false;
    if (response.statusCode == 200) {
      responseModel = ResponseModel(true, response.bodyString);
      pickedFile = null;
      rawFile = null;
    } else {
      responseModel = ResponseModel(false, response.statusText);
    }
    update();
    return responseModel;
  }

  void setTypeId(int? id) {
    roomTypeId = id;
    update();
  }

  int typeId = 1;

  Future<void> updateRoomTypes() async {
    isLoading = true;
    Response response =
        await roomRepo.updateRoomTypes(RoomUpdateType(typeId: typeId));
    if (response.statusCode == 200) {
      flutterShowToast(
          message: "update successfully", toastCase: ToastCase.success);
    } else {
      ApiChecker.checkApi(response, isList: false);
    }
    isLoading = false;

    update();
  }

  Future<void> getBlackList() async {
    isLoading = true;
    Response response = await roomRepo.getBlackList();
    if (response.statusCode == 200) {
      print("sucessssssssssss");
      roomBlackListModel = RoomBlackListModel.fromJson(response.body);
    } else {
      print("erorrrrrrrrrrrrrr");
      print(response.body);

      ApiChecker.checkApi(response, isList: false);
    }
    isLoading = false;

    update();
  }

  Future<void> getBackGround() async {
    isLoading = true;
    Response response = await roomRepo.getBackGround();
    if (response.statusCode == 200) {
      print("sucessssssssssss");
      getBackGroundList = GetBackGroundModel.fromJson(response.body);
    } else {
      print("erorrrrrrrrrrrrrr");
      print(response.body);

      ApiChecker.checkApi(response, isList: false);
    }
    isLoading = false;

    update();
  }
  Future<void> showRoom({required int id}) async {
    isLoading = true;
    Response response = await roomRepo.showRoom(id: id);
    if (response.statusCode == 200) {
      showRoomModel = ShowRoomModel.fromJson(response.body);
      print(showRoomModel?.showRoomData?.id);
      print("sucessssssflyyyyyy");
    } else {
      print("erorrrrrrrrrrrrrr");
      print(response.body);

      ApiChecker.checkApi(response, isList: false);
    }
    isLoading = false;

    update();
  }



  Future<void> removeUserFromBlackList({required int userId}) async {
    isLoading = true;
    Response response = await roomRepo.removeUserFromBlackList(userId: userId);
    if (response.statusCode == 200) {
      roomBlackListModel!.roomBlackListData?.removeWhere(
        (element) {
          print("elll${element.user!.id}");
          if (element.user!.id == userId) {
            flutterShowToast(
                message: "delete successfully", toastCase: ToastCase.success);
            return true;
          }
          return false;
        },
      );
    } else {
      ApiChecker.checkApi(response, isList: false);
    }
    isLoading = false;

    update();
  }

  Future<void> addUserToBlackList(
      {required AddUserBlackListModel addUserBlackListModel}) async {
    isLoading = true;
    Response response = await roomRepo.addUserToBlackList(
        addUserBlackListModel: addUserBlackListModel);
    if (response.statusCode == 200) {
      flutterShowToast(
          message: "add to BlackList successFully",
          toastCase: ToastCase.success);
    } else {
      ApiChecker.checkApi(response, isList: false);
    }
    isLoading = false;

    update();
  }

  RtcEngine? agoraEngine;

  // Ag? agoraRtm;
  // ChatClient? chatClient;
  //
  // List<ChatMessage> messages = [];

  Future<void> joinRoomAgora(RoomModel room, UserModel userModel) async {
    if (room.isOwner == true) {
      doJoinAgora(room, userModel);
    } else {
      if (room.isUserRoomBlocked == true) {
        Get.defaultDialog(
            title: "${room.name}",
            content: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.block,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 20,
                ),
                Text('2029-2-30')
              ],
            ));
        return;
      } else {
        if (room.hasPassword == true) {
          Get.defaultDialog(
            title: "${room.name}",
            content: InputDialog(
              icon: 'assets/icons/seat_lock_icon.png',
              child: CustomTextField(
                titleText: 'write password'.tr,
                controller: passwordController,
              ),
              onYesPressed: () {
                Get.back();
                if (passwordController.value.text == room.password) {
                  doJoinAgora(room, userModel);
                } else {
                  showCustomSnackBar('wrong_password'.tr,
                      isError: true, getXSnackBar: true);
                }
              },
            ),
          );
        } else {
          doJoinAgora(room, userModel);
        }
      }
    }
  }

  double borderThickness = 0.0;
  List<AudioVolumeInfo> speakers = [];
  AnimationController? controller;
  Animation<double>? animation;
  bool isOwnerTakeSeat = false;
  String token='';

  Future<void> getToken() async {
    final response = await http.get(
      Uri.parse('${AppConstants.baseUrl}/rtc/${AppConstants.channelName}/publisher/uid/${0}'
        // To add expiry time uncomment the below given line with the time in seconds
        // + '?expiry=45'
      ),
    );

    if (response.statusCode == 200) {
      token = response.body;
      token = jsonDecode(token)['rtcToken'];
      update();
    } else {
      print('Failed to fetch the token');
    }
  }
  Future<void> doJoinAgora(RoomModel room, UserModel? userModel) async {
    await getToken();
    // setupListeners();
    // Agora-specific variables

    // Request microphone and camera permissions
    await [Permission.microphone, Permission.camera].request();

    // Initialize Chat Client first
    try {
      agoraEngine = createAgoraRtcEngine();
      await agoraEngine
          ?.initialize(const RtcEngineContext(appId: AppConstants.appAgoraId));

      // Register Agora event handlers for join and user events
      agoraEngine?.registerEventHandler(RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          print(elapsed);
          print('Successfully joined Agora channel: ${connection.channelId}');
        },
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          print('Remote user $remoteUid joined the channel');
        },
        onUserOffline: (RtcConnection connection, int remoteUid,
            UserOfflineReasonType reason) {
          print('Remote user $remoteUid left the channel');
        },
          onTokenPrivilegeWillExpire: (connection, token) {

          },
        onError: (errorCodeType, error) {
          flutterShowToast(
              message: "there are error please try later",
              toastCase: ToastCase.error);
          Get.back();
          agoraEngine?.leaveChannel();

          print('Agora Error: $errorCodeType');
          return;
        },
        onAudioVolumeIndication: (RtcConnection connection,
            List<AudioVolumeInfo> newSpeakers, int totalVolume, int elapsed) {
          // room=inRoom!;
          speakers = newSpeakers;
          if (speakers.isNotEmpty) {
            borderThickness =
                (1.0 + (speakers[0].volume! * 0.01)).clamp(1.0, 4.0);
            update(); //
          }

          update();
        }
      ));
      // Set client role
      await agoraEngine?.setClientRole(role: ClientRoleType.clientRoleAudience);

      await agoraEngine?.enableAudioVolumeIndication(
        interval: 30,
        smooth: 800,
        reportVad: true,
      );

      // Join Agora channel with token
      await agoraEngine?.joinChannel(
        token: AppConstants.agoraToken,
        channelId: AppConstants.channelName,
        uid: userModel!.id!,
        options: const ChannelMediaOptions(
          publishMicrophoneTrack: true,
        ),
      );
      Get.to(AudioRoomAgoraScreen(
        room: room,
        userModel: userModel!,
      ));

      Response response =
          await roomRepo.joinRoom(room.id, passwordController.value.text);
      resetPassword();

      if (response.statusCode == 200) {
        print("Success");
        inRoom = RoomModel.fromJson(response.body['data']);
        getRoomVisitors();
        print("Ssssssssssssssitttttttttt${isOwnerTakeSeat}");
        print("sssssssssssssssssssssiiiiiiiiiiiiiiiii");
        print(inRoom?.chairs?[0].user?.id);
        if (room.isOwner!) {
          sitChair(seatNum: 1, roomId: room.id!, isMute: false);
        }
        update();
      } else {
        print("ssssssssssss");
        ApiChecker.checkApi(response);
        Get.back();
      }
    } catch (e) {
      print('Error joining room: $e');
      // Exit the room and leave the Agora channel
      Get.back();
      agoraEngine?.leaveChannel();
      flutterShowToast(message: e.toString(), toastCase: ToastCase.error);
    }

    update();
  }

  Map<int, bool> seatNumber = {};

  Future<void> sitChair(
      {required int seatNum, required int roomId, required bool isMute}) async {
    seatNumber.clear();
    seatNumber[seatNum] = true;
    update();
    isLoading = true;
    Response response =
        await roomRepo.sitChair(seatNum: seatNum, roomId: roomId);

    if (response.statusCode == 200 && !isMute) {
      isOwnerTakeSeat = true;
      agoraEngine?.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
    } else {
      seatNumber[seatNum] = false;
      seatNumber.clear();
      ApiChecker.checkApi(response, isList: false);
    }
    isLoading = false;
    update();
  }

  Future<void> leaveChair({required int seatNum}) async {
    print("ssss");
    Get.back();
    seatNumber.clear();
    update();
    agoraEngine?.setClientRole(role: ClientRoleType.clientRoleAudience);
    Response response = await roomRepo.leaveChair();
    if (response.statusCode != 200) {
      ApiChecker.checkApi(response, isList: false);
      seatNumber[seatNum] = true;
      agoraEngine?.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
    }
    update();
  }
  bool isMute=false;

  Future<void> leaveChannel(userModel, RoomModel roomModel) async {
    await agoraEngine?.leaveChannel();
    Get.back();
    Get.back();
    seatNumber.clear();
    Response response = await roomRepo.leaveRoom();
    if (response.statusCode == 200) {
      isOwnerTakeSeat=false;
      isMute=false;
      update();

    } else {
      Get.to(AudioRoomAgoraScreen(
        room: roomModel,
        userModel: userModel!,
      ));
      ApiChecker.checkApi(response, isList: false);
    }
  }

  void userAnimation({
    required TickerProvider vsync,
  }) {
    controller = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 100),
    )..repeat(reverse: true);

    animation = Tween<double>(begin: 0, end: 2.0).animate(
      CurvedAnimation(
        parent: controller!,
        curve: Curves.elasticIn,
      ),
    );

    Future.delayed(const Duration(seconds: 3), () {
      controller!.stop();
    });
  }

  bool hasMute = false;

  void manageMicrophone(int userId, bool hasMic) {
    print("hassss${hasMic}");
    agoraEngine?.muteLocalAudioStream(hasMic);
    if (hasMic == true) {
      borderThickness = 0;
      isMute=true;
    }
    else{
      isMute=false;
    }
    update();
    hasMute = hasMic;
    print("hhhassssssssssssss${hasMute}");
    update();
  }
}
// Future<void> initializeRtm({required UserModel userModel}) async {
//   _rtmClient =
//       await AgoraRtmClient.createInstance('ad1548f12664467b8fdfd4e6ac829695');
//
//   // Set event handlers for RTM
//   // _rtmClient?.onMessageReceived = (AgoraRtmMessage message, String peerId) {
//   //   print("Message from $peerId: ${message.text}");
//   //   // Handle incoming messages
//   // };
//   //
//   // _rtmClient?.onConnectionStateChanged = (int state, int reason) {
//   //   if (state == 5) {
//   //     _rtmClient?.logout();
//   //     print('Logged out from RTM');
//   //   }
//   // };
//
//   // Log in     await _rtmClient?.login(
//   //         'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiMDhlMmZkOTA4NGI4OTA2ZjExY2MwZjM4M2JjYWJhYjk4MDU4NGMyM2ZkYmIwMWVmOTkyYzc1NzlmZDgwYWUxMmU0MTc2ODljMmUzYWQ0MmUiLCJpYXQiOjE3Mjc5NTM5MzAuNzEzMzU0LCJuYmYiOjE3Mjc5NTM5MzAuNzEzMzU4LCJleHAiOjE3NTk0ODk5MzAuNzA2OTA5LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.J5xpbDMAMJ3FOLzMADmEsmdMkefehxFb_TIjLR5U-ucg6rI6F_24hZDUbaAxFXaBsuvjXM54EyFKyWSGdpRD_FuGd3JzHWR_MuLlNc1rBeBwEmKdBx8Zdt_j7PF-_yMsieXm-AN33_WceWJkMq9mtgx8qOzIHOAGSdugj-gu8tUUvxfAINIFPxar1oRHo1nhUsz-z3fogBCxvdiCS8QW_aArKZ2-kyNxetTRSN2USy_Zzhw0epcAiGK1u1jbREMCTO_Wl20NT9z83tNlwXMeDBHCeJUl4bDmBy2x3-jvOrkdSfW3TKZG7h-CyE75IoIthew4N5q7HMcY3O-cnLF86FmlRpMqO-vOaIOGQDYlMcs-s5DK7TnXSoXuBqjPnumpVb3zvOhMLQ2Sr_nCKpcsLqHn69XMkJFRgU2wGY8OmzPLtgMxTlKYDFRNfY83PgAIPSknv50GYfIxC0mant_tIJxI1i1URXY5carqf30pBB9pe9Pvvwv5ol0kBuKWWJyM8Xlkl0h47A4QGDJDtJ7MvOn_283mi_cHATTm8t44jUZ91YFD5hiL3gibwRcMfuiwFVg_Xn7Mycp46EQSWA8aHixMJsENvYwomEcX2Fb7Zs7QtZpanUL8QvFvsFPhAcv7jlAsrMAfD-PDtmRkm-9WHR1lHYouqB_Z9cZ7Eyw1K8A',
//   //         userModel.id.toString());to RTM (you can generate a token or pass null)
//   try {
//     await _rtmClient?.login(
//         '007eJxTYPh9R/5Z2f+Z3hnrJS47abw7naX5Jv/qR05lvYhfubtfmwopMCSmGJqaWKQZGpmZmZiYmSdZpKWkpZikmiUmWxhZmlmatnf+S2sIZGTweXGMlZEBAkF8QYbcxKKS+OSMxJL43NTi4sT0VAYGANW2JyE=',
//         '1');
//
//   } on AgoraRtmClientException catch (e) {
//     print("Error logging innn: ${e.code} - ${e.reason}");
//   } catch (e) {
//     print("An unexpected error occurred: $e");
//   }
// }
//
// Future<void> joinRtmChannel(String channelName) async {
//   _rtmChannel = await _rtmClient?.createChannel('mart_chat_message');
//
//   print("channnnel nammeeee ${channelName}");
//   // Set event handler for messages received in the RTM channel
//
//   try {
//     await _rtmChannel?.join();
//   }
//   on AgoraRtmClientException catch (e) {
//     print("Error join in: ${e.code} - ${e}");
//   }
//   catch (e) {
//     print('Failed to join channel: $e');
//   }
// }
//
// Future<void> sendMessageAgora(String text) async {
//   if (_rtmChannel != null) {
//     AgoraRtmMessage message = AgoraRtmMessage.fromText(text);
//     try{
//       await _rtmChannel?.sendMessage2(message);
//     }
//     on AgoraRtmClientException catch (e) {
//       print("Error logging in: ${e.code} - ${e}");
//     }
//     catch (e) {
//       print('Failed to send message: $e');
//     }
//
//   }
// }
