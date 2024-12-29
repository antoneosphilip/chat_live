import 'package:get/get_connect/http/src/response/response.dart';

import '../../util/app_constants.dart';
import '../api/api.dart';

class HomeRepo {
  Api api = Api();
  Future<Response> getData(int page) async {
    return await api.getData("${AppConstants.homeDataUri}?page=$page");
  }
}
