import 'package:get/get_connect/http/src/response/response.dart';

import '../../util/app_constants.dart';
import '../api/api.dart';

class RechargeRepo {
  Api api = Api();
  Future<Response> getRechargeList() async {
    return await api.getData(AppConstants.rechargeListUri);
  }
}
