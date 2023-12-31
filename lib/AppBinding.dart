// ignore_for_file: file_names
import 'package:companyportfolio/controllers/home/home_controller.dart';
import 'package:companyportfolio/controllers/language_controller.dart';
import 'package:companyportfolio/data/repository/home_repo.dart';
import 'package:get/instance_manager.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeRepo>(() => HomeRepo());
    Get.lazyPut<HomeController>(() => HomeController(repo: Get.find()));
    Get.put<LanguageController>(LanguageController(), permanent: true);
    Get.put<HomeController>(HomeController(repo: Get.find()), permanent: true);
  }
}
