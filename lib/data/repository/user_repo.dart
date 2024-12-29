import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:image_picker/image_picker.dart';
import 'package:live_app/data/api/api_client.dart';
import 'package:live_app/data/model/response/userinfo_model.dart';
import 'package:live_app/util/app_constants.dart';

import '../model/response/update_profile_model.dart';

class UserRepo {
  final ApiClient apiClient;
  UserRepo({required this.apiClient});

  Future<Response> follow(int user_id) async {
    return await apiClient.postData(AppConstants.followUserUri, {
      "user_id": user_id,
    });
  }

  Future<Response> unfollow(int user_id) async {
    return await apiClient.postData(AppConstants.unfollowUserUri, {
      "user_id": user_id,
    });
  }

  Future<Response> addFriend(int user_id) async {
    return await apiClient.postData(AppConstants.addFriendUri, {
      "user_id": user_id,
    });
  }

  Future<Response> removeFriend(int user_id) async {
    return await apiClient.postData(AppConstants.removeFriendUri, {
      "user_id": user_id,
    });
  }

  Future<Response> getUserData() async {
    return await apiClient.getData(AppConstants.userDataUri);
  }

  Future<Response> getUserDetails(int user_id) async {
    return await apiClient
        .getData("${AppConstants.userDetailsUri}?user_id=${user_id}");
  }

  Future<Response> getUserInfo() async {
    return await apiClient.getData(AppConstants.customerInfoUri);
  }

  Future<Response> updateProfile(
      UpdateProfileModel updateProfileModel, XFile? data) async {
    Map<String, String> body = {};
    body.addAll(<String, String>{
      'f_name': updateProfileModel.fName??'',
      'l_name': updateProfileModel.lName??'',
      // 'email': updateProfileModel.email,
      'phone':updateProfileModel.phone??'',
      'pio':updateProfileModel.pio??'',
      'country_id':updateProfileModel.countryId??'',
      'gender':updateProfileModel.gender??"",
    });
    return await apiClient.postMultipartData(
        AppConstants.updateProfileUri, body, [MultipartBody('image', data)]);
  }

  Future<Response> changePassword(UserInfoModel userInfoModel) async {
    return await apiClient.postData(AppConstants.updateProfileUri, {
      'f_name': userInfoModel.fName,
      'l_name': userInfoModel.lName,
      'email': userInfoModel.email,
      'password': userInfoModel.password
    });
  }

  Future<Response> deleteUser() async {
    return await apiClient.deleteData(AppConstants.customerRemoveUri);
  }
}
