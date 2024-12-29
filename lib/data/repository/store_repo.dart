import 'package:get/get_connect/http/src/response/response.dart';

import '../../util/app_constants.dart';
import '../api/api.dart';

class StoreRepo {
  Api api = Api();

  Future<Response> getTypesList() async {
    return await api.getData(AppConstants.typesListUri);
  }

  Future<Response> getItemsList(int? typeId, int? page) async {
    return await api
        .getData("${AppConstants.itemsListUri}?type_id=$typeId&page=$page");
  }
}
