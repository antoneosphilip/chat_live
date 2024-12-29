import 'package:get/get.dart';

import '../data/api/api_checker.dart';
import '../data/model/response/level_model.dart';
import '../data/repository/level_repo.dart';

class LevelController extends GetxController implements GetxService {
  String currentType = 'sender';
  final LevelRepo repo = LevelRepo();
  bool isLoading = false;
  List<LevelModel> senderLevelList = [];
  List<LevelModel> senderLevelListStatic = [
    LevelModel(
      image: '',
      title: 'test'
    ),
    LevelModel(
        image: '',
        title: 'test'
    ),LevelModel(
        image: '',
        title: 'test'
    )
  ];

  List<LevelModel> consigneeLevelList = [];
  void setCurrentType(String type) async {
    currentType = type;
    await getLevelList();
    update();
  }

  Future<void> getLevelList() async {
    int type = currentType == 'sender' ? 0 : 1;
    isLoading = true;
    Response response = await repo.getLevelList(type: type);
    if (response.statusCode == 200) {
      List<LevelModel> senderList = [];
      List<LevelModel> consigneeList = [];
      List senderVipListResponse = response.body['data']['sender'];
      List consigneeVipListResponse = response.body['data']['consignee'];
      for (var sitem in senderVipListResponse) {
        var senderItem = LevelModel.fromJson(sitem);
        senderList.add(senderItem);
      }
      for (var citem in consigneeVipListResponse) {
        var consigneeItem = LevelModel.fromJson(citem);
        consigneeList.add(consigneeItem);
      }
      senderLevelList = senderList;
      consigneeLevelList = consigneeList;
    } else {
      ApiChecker.checkApi(response);
    }
    isLoading = false;
  }
}
