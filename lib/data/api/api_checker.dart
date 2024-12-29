import 'package:get/get.dart';
import 'package:live_app/controller/auth_controller.dart';
import 'package:live_app/helper/route_helper.dart';
import 'package:live_app/view/base/custom_snackbar.dart';

class ApiChecker {
  static void checkApi(Response response, {bool getXSnackBar = false,bool isList=true}) {
    if (response.statusCode == 401) {
      Get.find<AuthController>().clearSharedData();
      Get.offAllNamed(RouteHelper.getSignInRoute(RouteHelper.splash));
    } else {
      if (response.body == null) {
        showCustomSnackBar("can't connect to server".tr,
            getXSnackBar: getXSnackBar);
      } else {
        isList? showCustomSnackBar((response.body['errors'][0]['message']),
            getXSnackBar: getXSnackBar):showCustomSnackBar((response.body['error']),
            getXSnackBar: getXSnackBar);
      }
    }
  }
}
