import 'package:get/get.dart';
import 'package:live_app/data/model/response/country_model.dart';
import 'package:live_app/data/repository/country_repo.dart';

import '../data/api/api_checker.dart';

class CountryController extends GetxController implements GetxService {
  final CountryRepo countryRepo;
  CountryController({required this.countryRepo});
  int? selectedCountryId;
  List<CountryModel> countryList = [];
  bool isLoading = false;

  Future<void> getCountryList({int? type = 1}) async {
    isLoading = true;
    Response response = await countryRepo.getCountryList();
    if (response.statusCode == 200) {
      List<CountryModel> newList = [];
      List countryListResponse = response.body['data'];
      for (var item in countryListResponse) {
        var country = CountryModel.fromJson(item);
        newList.add(country);
      }
      countryList = newList;
    } else {
      ApiChecker.checkApi(response);
    }
    isLoading = false;
    update();
  }

  void selectCountry(int? id) {
    selectedCountryId = id;
    update();
  }
}
