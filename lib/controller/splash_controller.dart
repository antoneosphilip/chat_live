import 'package:get/get.dart';
import 'package:live_app/controller/user_controller.dart';
import 'package:live_app/data/model/response/config_model.dart';
import 'package:live_app/data/model/response/landing_model.dart';
import 'package:live_app/data/repository/splash_repo.dart';

import '../data/api/api_checker.dart';
import '../data/api/api_client.dart';
import '../util/html_type.dart';
import '../view/base/custom_snackbar.dart';

class SplashController extends GetxController implements GetxService {
  final SplashRepo splashRepo;
  SplashController({required this.splashRepo});

  ConfigModel? _configModel;
  bool _firstTimeConnectionCheck = true;
  bool _hasConnection = true;
  int _moduleIndex = 0;
  Map<String, dynamic>? _data = {};
  String? _htmlText;
  bool _isLoading = false;
  int _selectedModuleIndex = 0;
  LandingModel? _landingModel;
  bool _savedCookiesData = false;
  bool _webSuggestedLocation = false;
  bool _isRefreshing = false;

  ConfigModel? get configModel => _configModel;
  DateTime get currentTime => DateTime.now();
  bool get firstTimeConnectionCheck => _firstTimeConnectionCheck;
  bool get hasConnection => _hasConnection;

  int get moduleIndex => _moduleIndex;

  String? get htmlText => _htmlText;
  bool get isLoading => _isLoading;
  int get selectedModuleIndex => _selectedModuleIndex;
  LandingModel? get landingModel => _landingModel;
  bool get savedCookiesData => _savedCookiesData;
  bool get webSuggestedLocation => _webSuggestedLocation;
  bool get isRefreshing => _isRefreshing;

  void selectModuleIndex(int index) {
    _selectedModuleIndex = index;
    update();
  }

  Future<bool> getConfigData(
      {bool loadModuleData = false, bool loadLandingData = false}) async {
    _hasConnection = true;
    _moduleIndex = 0;
    Response response = await splashRepo.getConfigData();
    bool isSuccess = false;
    if (response.statusCode == 200) {
      _data = response.body;
      _configModel = ConfigModel.fromJson(response.body);

      // if (loadLandingData) {
      //   await getLandingPageData();
      // }
      isSuccess = true;
    } else {
      ApiChecker.checkApi(response);
      if (response.statusText == ApiClient.noInternetMessage) {
        _hasConnection = false;
      }
      isSuccess = false;
    }
    update();
    return isSuccess;
  }

  Future<void> getLandingPageData() async {
    Response response = await splashRepo.getLandingPageData();
    if (response.statusCode == 200) {
      _landingModel = LandingModel.fromJson(response.body);
    } else {
      ApiChecker.checkApi(response);
    }
    update();
  }

  Future<void> initSharedData() async {
    if (!GetPlatform.isWeb) {
      splashRepo.initSharedData();
    }
    await Get.find<UserController>().getUserData();
    await Get.find<UserController>().getUserInfo();
  }

  bool? showIntro() {
    return splashRepo.showIntro();
  }

  void disableIntro() {
    splashRepo.disableIntro();
  }

  void setFirstTimeConnectionCheck(bool isChecked) {
    _firstTimeConnectionCheck = isChecked;
  }

  Future<void> getHtmlText(HtmlType htmlType) async {
    _htmlText = null;
    Response response = await splashRepo.getHtmlText(htmlType);
    if (response.statusCode == 200) {
      if (response.body != null &&
          response.body.isNotEmpty &&
          response.body is String) {
        _htmlText = response.body;
      } else {
        _htmlText = '';
      }

      if (_htmlText != null && _htmlText!.isNotEmpty) {
        _htmlText = _htmlText!.replaceAll('href=', 'target="_blank" href=');
      } else {
        _htmlText = '';
      }
    } else {
      ApiChecker.checkApi(response);
    }
    update();
  }

  Future<bool> subscribeMail(String email) async {
    _isLoading = true;
    bool isSuccess = false;
    update();
    Response response = await splashRepo.subscribeEmail(email);
    if (response.statusCode == 200) {
      showCustomSnackBar('subscribed_successfully'.tr, isError: false);
      isSuccess = true;
    } else {
      ApiChecker.checkApi(response);
    }
    _isLoading = false;
    update();
    return isSuccess;
  }

  void saveCookiesData(bool data) {
    splashRepo.saveCookiesData(data);
    _savedCookiesData = true;
    update();
  }

  getCookiesData() {
    _savedCookiesData = splashRepo.getSavedCookiesData();
    update();
  }

  void cookiesStatusChange(String? data) {
    splashRepo.cookiesStatusChange(data);
  }

  bool getAcceptCookiesStatus(String data) =>
      splashRepo.getAcceptCookiesStatus(data);

  void saveWebSuggestedLocationStatus(bool data) {
    splashRepo.saveSuggestedLocationStatus(data);
    _webSuggestedLocation = true;
    update();
  }

  void getWebSuggestedLocationStatus() {
    _webSuggestedLocation = splashRepo.getSuggestedLocationStatus();
  }

  void setRefreshing(bool status) {
    _isRefreshing = status;
    update();
  }
}
