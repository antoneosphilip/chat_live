import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../util/app_constants.dart';
import '../api/api_client.dart';

class FamilyRepo {
  final ApiClient apiClient;

  FamilyRepo({required this.apiClient});

  Future<Response> getFamily() async {
    return await apiClient.getData(AppConstants.family);
  }

  Future<Response> getAllFamilies() async {
    return await apiClient.getData(AppConstants.allFamily);
  }

  Future<Response> getFamilies({required id}) async {
    return await apiClient.getData('/api/v2/get_family/$id');
  }

  Future<Response> joinFamily({required int familyId}) async {
    return await apiClient.postData(AppConstants.joinFamily, {'family_id': familyId});
  }
  Future<Response> leaveFamily() async {
    return await apiClient.postData(AppConstants.leaveFamily,{});
  }
}
