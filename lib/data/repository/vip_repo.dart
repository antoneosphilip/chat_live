import 'package:get/get_connect/http/src/response/response.dart';

import '../../util/app_constants.dart';
import '../api/api.dart';

class VipRepo {
  Api api = Api();
  Future<Response> getVipList() async {
    return await api.getData(AppConstants.vipListUri);
  }
}
