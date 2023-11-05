import 'package:companyportfolio/models/language_model.dart';
/**
 * Finally : add new LangaugeModel , this model take two parameters,
 * first is the langauge name that will be displayed on the website,
 * second is the localization code.
 * If all steps are done now you should see a new option in the language list on the site.
 *  
 */

List languageList = [
  LanguageModel(languageDisplayName: 'English', localizationCode: 'en'),
  LanguageModel(languageDisplayName: 'Arabic', localizationCode: 'ar'),

];