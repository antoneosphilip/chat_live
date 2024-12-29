import 'package:get/get.dart';
import 'package:live_app/data/model/response/user_model.dart';
import 'package:live_app/data/repository/relationship_repo.dart';

import '../data/api/api_checker.dart';

class RelationshipController extends GetxController implements GetxService {
  final RelationshipRepo repo = RelationshipRepo();
  bool isLoading = false;
  List<UserModel> userList = [];
  UserModel? selectedUser;
  void selectUser(UserModel user) {
    selectedUser = user;
    update();
  }

  Future<void> getFriendList() async {
    isLoading = true;
    Response response = await repo.getFriendsList();
    if (response.statusCode == 200) {
      List<UserModel> newList = [];
      List listResponse = response.body['data'];
      for (var item in listResponse) {
        var country = UserModel.fromJson(item);
        newList.add(country);
      }
      userList = newList;
    } else {
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();
  }

  Future<void> getFollowersList() async {
    isLoading = true;
    Response response = await repo.getFollowersList();
    if (response.statusCode == 200) {
      List<UserModel> newList = [];
      List listResponse = response.body['data'];
      for (var item in listResponse) {
        var country = UserModel.fromJson(item);
        newList.add(country);
      }
      userList = newList;
    } else {
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();
  }

  Future<void> getFollowingsList() async {
    isLoading = true;
    Response response = await repo.getFollowingsList();
    if (response.statusCode == 200) {
      List<UserModel> newList = [];
      List listResponse = response.body['data'];
      for (var item in listResponse) {
        var country = UserModel.fromJson(item);
        newList.add(country);
      }
      userList = newList;
    } else {
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();
  }

  Future<void> getVisitorsList() async {
    isLoading = true;
    Response response = await repo.getVisitorsList();
    if (response.statusCode == 200) {
      List<UserModel> newList = [];
      List listResponse = response.body['data'];
      for (var item in listResponse) {
        var country = UserModel.fromJson(item);
        newList.add(country);
      }
      userList = newList;
    } else {
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();
  }
}
