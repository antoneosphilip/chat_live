import 'package:get/get.dart';
import 'package:live_app/data/api/api_checker.dart';
import 'package:live_app/data/model/response/user_model.dart';
import 'package:live_app/data/repository/search_repo.dart';

import '../data/model/response/room_model.dart';

class MySearchController extends GetxController implements GetxService {
  final SearchRepo searchRepo = SearchRepo();
  bool isRoom = false;
  String searchText = '';
  bool isSearchMode = true;
  List<String> historyList = [];
  String? searchHomeText = '';
  String? userResultText = '';
  String? roomResultText = '';
  List<RoomModel>? searchRoomList = [];
  List<UserModel>? searchUserList = [];

  void setType(bool value) {
    isRoom = value;
    update();
  }

  void setSearchText(String text) {
    searchText = text;
    update();
  }

  void setSearchMode(bool value) {
    isSearchMode = value;
    if (isSearchMode) {
      searchText = '';
      userResultText = '';
      roomResultText = '';
      searchRoomList = [];
      searchUserList = [];
    }
    update();
  }

  void searchData(String? query, bool fromHome) async {
    if (query!.isNotEmpty) {
      searchHomeText = query;
      searchText = query;
      if (isRoom) {
        searchRoomList = null;
      } else {
        searchUserList = null;
      }
      if (!historyList.contains(query)) {
        historyList.insert(0, query);
      }
      searchRepo.saveSearchHistory(historyList);
      isSearchMode = false;
      if (!fromHome) {
        update();
      }

      Response response = await searchRepo.getSearchData(query, isRoom);
      if (response.statusCode == 200) {
        if (query.isEmpty) {
          if (isRoom) {
            searchRoomList = [];
          } else {
            searchUserList = [];
          }
        } else {
          if (isRoom) {
            roomResultText = query;
            searchRoomList = [];
            response.body['data'].forEach(
                (element) => searchRoomList?.add(RoomModel.fromJson(element)));
          } else {
            userResultText = query;
            searchUserList = [];
            response.body['data'].forEach(
                (element) => searchUserList?.add(UserModel.fromJson(element)));
          }
        }
      } else {
        ApiChecker.checkApi(response);
      }
      update();
    }
  }

  void getHistoryList() {
    isSearchMode = true;
    searchText = '';
    historyList = [];
    historyList.addAll(searchRepo.getSearchAddress());
  }

  void removeHistory(int index) {
    historyList.removeAt(index);
    searchRepo.saveSearchHistory(historyList);
    update();
  }

  void clearSearchAddress() async {
    searchRepo.clearSearchHistory();
    historyList = [];
    update();
  }

  void clearSearchHomeText() {
    searchHomeText = '';
    update();
  }
}
