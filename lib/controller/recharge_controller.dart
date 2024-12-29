import 'package:get/get.dart';
import 'package:live_app/data/repository/recharge_repo.dart';

import '../data/api/api_checker.dart';
import '../data/model/body/recharge_model.dart';

class RechargeController extends GetxController implements GetxService {
  final RechargeRepo repo = RechargeRepo();
  bool isLoading = false;
  List<RechargeModel> rechargeList = [];
  RechargeModel? selectedItem;
  Future<void> getRechargeList() async {
    isLoading = true;
    Response response = await repo.getRechargeList();
    if (response.statusCode == 200) {
      List<RechargeModel> newList = [];
      List vipListResponse = response.body['data'];
      for (var item in vipListResponse) {
        var country = RechargeModel.fromJson(item);
        newList.add(country);
      }
      rechargeList = newList;
    } else {
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();
  }

  void setSelectedItem(RechargeModel rechargeItem) {
    selectedItem = rechargeItem;
    update();
  }
}
