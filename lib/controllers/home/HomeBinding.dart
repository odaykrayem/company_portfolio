// ignore_for_file: file_names
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<CategoryRepository>(() => CategoryRepository(Get.find()));
    // Get.lazyPut<CategoryProvider>(() => CategoryProvider(Get.find()));
  }
}
