import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../util/app_constants.dart';
import '../api/api_client.dart';

class GiftRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  GiftRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> getGiftList({int? type = 1,int page=1}) async {
    return await apiClient.getData("${AppConstants.giftListUri}?type=${type}&page=${page}");
  }

  Future<Response> sendGift(
      List<String>? consignee_ids, int? gift_id, String? qty) async {
    return await apiClient.postData("${AppConstants.sendGiftUri}",
        {"consignee_ids": consignee_ids, "gift_id": gift_id, "qty": qty});
  }
}
