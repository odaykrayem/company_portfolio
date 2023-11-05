// ignore_for_file: file_names
import 'package:companyportfolio/controllers/home/HomeController.dart';
import 'package:companyportfolio/data/repository/home_repo.dart';
import 'package:get/instance_manager.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeRepo>(() => HomeRepo());
    Get.lazyPut<HomeController>(() => HomeController(repo: Get.find()));
  }
}
