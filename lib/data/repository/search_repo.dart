import 'package:get/get.dart';
import 'package:live_app/data/api/api.dart';
import 'package:live_app/util/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchRepo {
  final Api apiClient = Api();
  SharedPreferences sharedPreferences = Get.find();
  Future<Response> getSearchData(String? query, bool isRoom) async {
    return await apiClient.getData(
        '${AppConstants.searchUri}${isRoom ? 'rooms' : 'user'}/search?key=$query&offset=1&limit=50');
  }

  Future<Response> getSuggestedItems() async {
    return await apiClient.getData(AppConstants.suggestedItemUri);
  }

  Future<bool> saveSearchHistory(List<String> searchHistories) async {
    return await sharedPreferences.setStringList(
        AppConstants.searchHistory, searchHistories);
  }

  List<String> getSearchAddress() {
    return sharedPreferences.getStringList(AppConstants.searchHistory) ?? [];
  }

  Future<bool> clearSearchHistory() async {
    return sharedPreferences.setStringList(AppConstants.searchHistory, []);
  }
}
