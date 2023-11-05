// ignore_for_file: file_names
import 'package:companyportfolio/models/language_model.dart';
import 'package:companyportfolio/translation/languageList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageController extends GetxController {
  final storage = GetStorage();

  // var language = 'en';
  late LanguageModel lm;
  @override
  void onInit() {
    super.onInit();
    lm= languageList[0];
    getLanguageState();
  }

  getLanguageState() {
    LanguageModel lm1;
    if (storage.read('language') != null) {
       lm1 = languageList.firstWhere((element) =>
        element.localizationCode == storage.read('language'));
      return setLanguage(lm1);
     }
    }

  void setLanguage(LanguageModel languageModel) {
    storage.write('language', languageModel.localizationCode);

    Get.updateLocale( Locale(languageModel.localizationCode));

    update();
  }
}