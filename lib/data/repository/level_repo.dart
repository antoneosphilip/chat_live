import 'package:get/get_connect/http/src/response/response.dart';

import '../../util/app_constants.dart';
import '../api/api.dart';

class LevelRepo {
  Api api = Api();
  Future<Response> getLevelList({int type = 0}) async {
    return await api.getData("${AppConstants.levelListUri}?type=$type");
  }
}
