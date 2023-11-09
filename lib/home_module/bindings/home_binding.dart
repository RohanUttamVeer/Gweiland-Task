import 'package:get/get.dart';

import '../controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
// remote data
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
