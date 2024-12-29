import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../util/app_constants.dart';
import '../api/api_client.dart';

class CountryRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  CountryRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> getCountryList() async {
    return await apiClient.getData(AppConstants.countryListUri);
  }
}
