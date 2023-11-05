// ignore_for_file: unused_local_variable
import 'package:get/get.dart';

import '../languages/ar.dart';
import '../languages/en.dart';

class AppLocalization implements Translations {
  /**Add New Language with localization code to the map
  in pairs like : 'localizationCode': 'languageMapName',
  don't forget to import langauge file.
  **/
  @override
  Map<String, Map<String, String>> get keys => {
        'ar': arabic,
        'en': english,
      };
}
