import 'package:get/get.dart';
import 'package:live_app/data/api/api_checker.dart';
import 'package:live_app/data/model/response/banner_model.dart';
import 'package:live_app/data/repository/banner_repo.dart';

class BannerController extends GetxController implements GetxService {
  final BannerRepo bannerRepo;
  BannerController({required this.bannerRepo});

  List<dynamic>? _bannerList;
  int _currentIndex = 0;

  List<dynamic>? get bannerList => _bannerList;
  int get currentIndex => _currentIndex;

  Future<void> getBanners() async {
    Response response = await bannerRepo.getBannerList();
    if (response.statusCode == 200) {
      _bannerList = [];

      BannerModel bannerModel = BannerModel.fromJson(response.body);
      for (var banner in bannerModel.banners!) {
        _bannerList!.add(banner);
      }
    } else {
      ApiChecker.checkApi(response);
    }
    update();
  }

  void setCurrentIndex(int index, bool notify) {
    _currentIndex = index;
    if (notify) {
      update();
    }
  }
}
