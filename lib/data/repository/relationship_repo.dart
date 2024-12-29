import 'package:get/get_connect/http/src/response/response.dart';

import '../../util/app_constants.dart';
import '../api/api.dart';

class RelationshipRepo {
  Api api = Api();
  Future<Response> getFriendsList() async {
    return await api.getData(AppConstants.friendsListUri);
  }

  Future<Response> getFollowersList() async {
    return await api.getData(AppConstants.followersListUri);
  }

  Future<Response> getFollowingsList() async {
    return await api.getData(AppConstants.followingsListUri);
  }

  Future<Response> getVisitorsList() async {
    return await api.getData(AppConstants.visitorsListUri);
  }
}
