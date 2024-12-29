import 'package:get/get_connect/http/src/response/response.dart';
import 'package:image_compression_flutter/image_compression_flutter.dart';
import 'package:live_app/data/model/response/add_blacklist_model.dart';
import 'package:live_app/data/model/response/room_types_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../util/app_constants.dart';
import '../api/api_client.dart';
import '../model/response/room_model.dart';

class RoomRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  RoomRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> getTopThreeRooms() async {
    return await apiClient.getData(AppConstants.topRoomsUri);
  }

  Future<Response> getHomeRooms(String? filter) async {
    return await apiClient.getData("${AppConstants.homeRoomUri}?$filter");
  }

  Future<Response> getRooms(String? filter) async {
    return await apiClient.getData("${AppConstants.roomsUri}?$filter");
  }

  Future<Response> getRoomVisitors(int? room_id) async {
    return await apiClient
        .getData("${AppConstants.roomVisitorsListUri}?room_id=${room_id}");
  }

  Future<Response> getRoomOnMicUsers(int? room_id) async {
    return await apiClient
        .getData("${AppConstants.roomOnMicUsersListUri}?room_id=${room_id}");
  }

  Future<Response> joinRoom(int? roomId, String? password) async {
    return await apiClient.postData(
        AppConstants.joinRoomUri, {"room_id": roomId, "password": password});
  }

  Future<Response> leaveRoom() async {
    return await apiClient.getData(AppConstants.leaveRoomUri);
  }

  Future<Response> takeMic(String? roomId, String? micNum) async {
    return await apiClient.postData(
        AppConstants.takeMicUri, {"room_id": roomId, "seat_num": micNum});
  }

  Future<Response> leaveMic(String? roomId, String? micNum) async {
    return await apiClient.postData(AppConstants.leaveMicUri, {});
  }

  Future<Response> getRoomTypes() async {
    return await apiClient.getData(AppConstants.roomTypesUri);
  }

  Future<Response> createRoom(
      RoomModel roomModel, XFile? data, int? type, String token) async {
    Map<String, String> body = {};
    body.addAll(<String, String>{
      'name': roomModel.name!,
      'intro': roomModel.intro!,
      'room_type_id': "$type"
    });
    return await apiClient.postMultipartData(
        AppConstants.createRoomUri, body, [MultipartBody('cover', data)]);
  }

  Future<Response> updateRoomTypes(RoomUpdateType roomUpdateType) async {
    return await apiClient.postData(
        AppConstants.updateRoomTypesUri, {'type_id': roomUpdateType.typeId});
  }

  Future<Response> getBlackList() async {
    return await apiClient.getData(AppConstants.getBlackLists);
  }
  Future<Response> getBackGround() async {
    return await apiClient.getData(AppConstants.getBackGround);
  }
  Future<Response> showRoom({required int id}) async {
    return await apiClient.getData('${AppConstants.showRoom}/$id');
  }

  Future<Response> removeUserFromBlackList({required int userId}) async {
    return await apiClient
        .postData(AppConstants.removeUserFromBlackList, {'user_id': userId});
  }

  Future<Response> addUserToBlackList(
      {required AddUserBlackListModel addUserBlackListModel}) async {
    return await apiClient.postData(AppConstants.addUserToBlackList, {
      'time_unit': addUserBlackListModel.timeUnit,
      'duration': addUserBlackListModel.duration,
      'user_id':int.parse(addUserBlackListModel.userId!)
    });
  }


  Future<Response> sitChair({required int seatNum,required int roomId}) async {
    return await apiClient.postData(AppConstants.sitChair,{
      'seat_num':seatNum,
      'room_id':roomId,
    });
  }
  Future<Response> leaveChair() async {
    return await apiClient.postData(AppConstants.leaveChair,{

    });
  }
}
