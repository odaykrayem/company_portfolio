import 'package:companyportfolio/constants/custom_values.dart';
import 'package:flutter/material.dart';
import 'package:companyportfolio/routes/routes.dart';
import 'package:companyportfolio/translation/localization/localization.dart';
import 'package:companyportfolio/screens/layout_template.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'AppBinding.dart';
import 'constants/app_colors.dart';
import 'constants/app_values.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  // HttpOverrides.global = new MyHttpOverrides();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final storage = GetStorage();

    String lang = storage.read('language')??'en' ;
    return GetMaterialApp(
        // scrollBehavior: MaterialScrollBehavior().copyWith(
        //   dragDevices: {
        //     PointerDeviceKind.mouse,
        //     PointerDeviceKind.touch,
        //     PointerDeviceKind.stylus,
        //     PointerDeviceKind.unknown
        //   },
        // ),
        // builder: (context, child) {
        //   return ScrollConfiguration(
        //     behavior: ScrollConfiguration.of(context).copyWith(
        //       dragDevices: {
        //         PointerDeviceKind.mouse,
        //         PointerDeviceKind.touch,
        //       },
        //     ),
        //     child: child!,
        //   );
        // },
        debugShowCheckedModeBanner: false,
        title: 'companyName'.tr,
        getPages: Routes.routes,
        initialRoute: Routes.main,
        initialBinding: AppBinding(),
        translations: AppLocalization(),
        locale: Locale(lang),
        home: LayoutTemplate(),
        theme: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          hoverColor: Colors.transparent,
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: AppColors.primaryColor,
                secondary: AppColors.secondaryColor,
                // brightness: Brightness.dark,
              ),
          fontFamily: 'Outfit-Regular',
        ));
  }
}
