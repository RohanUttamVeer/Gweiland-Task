import 'package:get/get.dart';

class HomeController extends GetxController {

  static HomeController instance = Get.find();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
    clearControllers();
  }

  var isLoading = false.obs;

  void loadingTrue() {
    isLoading(true);
  }

  void loadingFalse() {
    isLoading(false);
  }

  clearControllers() {
    isLoading(false);
  }
}
