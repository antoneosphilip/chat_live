import 'package:get/get_connect/http/src/response/response.dart';
import 'package:live_app/data/api/api_client.dart';
import 'package:live_app/util/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  ChatRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> getConversationList(int offset, String type) async {
    return apiClient.getData(
        '${AppConstants.conversationListUri}?limit=10&offset=$offset&type=$type');
  }

  Future<Response> searchConversationList(String name) async {
    return apiClient.getData(
        '${AppConstants.searchConversationListUri}?name=$name&limit=20&offset=1');
  }

  Future<Response> getMessages(
      int offset, int? userID, String userType, int? conversationID) async {
    return await apiClient.getData(
        '${AppConstants.messageListUri}?conversation_id=${conversationID}&user_id=${userID}&type=${userType}&offset=$offset&limit=10');
  }

  Future<Response> sendMessage(String message, List<MultipartBody> images,
      int? userID, String userType, int? conversationID) async {
    Map<String, String> fields = {};
    fields.addAll({
      'message': message,
      'receiver_type': userType,
      'receiver_id': '$userID',
      'offset': '1',
      'limit': '10'
    });
    if (conversationID != null) {
      fields.addAll({'conversation_id': conversationID.toString()});
    }
    if (userID != null) {
      fields.addAll({'receiver_id': userID.toString()});
    }
    Response response = await apiClient.postMultipartData(
        AppConstants.sendMessageUri, fields, images);
    print(response.body);
    return response;
  }
}
