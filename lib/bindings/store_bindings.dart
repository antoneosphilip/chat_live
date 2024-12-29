import 'package:get/get.dart';
import 'package:live_app/controller/store_controller.dart';

class StoreBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StoreController());
  }
}
