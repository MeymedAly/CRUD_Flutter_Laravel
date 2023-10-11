import 'package:apptest/controllers/tacheController.dart';
import 'package:get/get.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TacheController>(() => TacheController(), fenix: true);
  }
}
