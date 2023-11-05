// ignore_for_file: file_names
import 'package:companyportfolio/screens/about_us.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:companyportfolio/screens/contact_us.dart';
import 'package:companyportfolio/screens/portfolio.dart';
import 'package:companyportfolio/screens/services.dart';
import '../../data/repository/home_repo.dart';
import '../../routes/sub_routes.dart';
import '../../utils/getDeviceType.dart';
import '../../screens/home.dart';

class HomeController extends GetxController {
  final HomeRepo repo;
  HomeController({required this.repo});
  // late PageController pageController;
  final GlobalKey<ScaffoldState> key = GlobalKey(); // Create a key

 @override
  void onInit() {
    super.onInit();
  }

  static HomeController get to => Get.find();

  final storage = GetStorage();

  var currentIndex = 0.obs;
  var _userLoggedIn = false;
  bool get userLoggedIn => _userLoggedIn;

  final pages = <String>[
    SubRoutes.home,
    SubRoutes.aboutUs,
    SubRoutes.services,
    SubRoutes.portfolio,
    SubRoutes.contactUs
  ];

  void changePage(int index) {
    currentIndex.value = index;
    Get.toNamed(pages[index], id: 1);
  }

  Route onGenerateRoute(RouteSettings settings) {
    if (settings.name == pages[0]) {
      return GetPageRoute(
        settings: settings,
        page: () => HomeScreen(),
        transitionDuration: Duration(milliseconds: 0),
        transition: Transition.noTransition,
      );
    }

    if (settings.name == pages[1]) {
      return GetPageRoute(
        settings: settings,
        page: () => AboutUsScreen(),
        transitionDuration: Duration(milliseconds: 0),
        transition: Transition.noTransition,
        maintainState: false,
      );
    }
    if (settings.name == pages[2]) {
      return GetPageRoute(
        settings: settings,
        page: () => const ServicesScreen(),
        transitionDuration: Duration(milliseconds: 0),
        transition: Transition.noTransition,
      );
    }
    if (settings.name == pages[3]) {
      return GetPageRoute(
        settings: settings,
        page: () => PortfolioScreen(),
        transitionDuration: Duration(milliseconds: 0),
        transition: Transition.noTransition,
        maintainState: false,
      );
    }
    if (settings.name == pages[4]) {
      return GetPageRoute(
        settings: settings,
        page: () => ContactUsScreen(),
        transitionDuration: Duration(milliseconds: 0),
        transition: Transition.noTransition,
        maintainState: false,
      );
    }
  
    return GetPageRoute(
      settings: settings,
      page: () => HomeScreen(),
      transitionDuration: Duration(milliseconds: 0),
      transition: Transition.noTransition,
    );
  }

  

  void openDrawer() {
    key.currentState!.openDrawer();
  }

  void closeDrawer() {
    if (key.currentState!.isDrawerOpen) {
      key.currentState!.closeDrawer();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  void openDialog(Widget child) {
    if (Get.isDialogOpen == true) Get.back();
    double dialogWidth =
        getDeviceType() == 'phone' ? Get.size.width + 50 : Get.size.width / 3;
    double hPadding = getDeviceType() == 'phone' ? 5 : 30;

    Get.defaultDialog(
        title: '',
        titlePadding: const EdgeInsets.all(0),
        radius: 15,
        contentPadding: EdgeInsets.symmetric(horizontal: hPadding),
        barrierDismissible: false,
        content: SingleChildScrollView(
          child: SizedBox(
              width: dialogWidth,
              height: Get.size.height - 130,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: child,
                  ),
                  Get.locale != const Locale('ar')
                      ? Positioned(
                          top: 0,
                          right: 0,
                          child: IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              Icons.clear_rounded,
                            ),
                          ),
                        )
                      : Positioned(
                          top: 0,
                          left: 0,
                          child: IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              Icons.clear_rounded,
                            ),
                          ),
                        )
                ],
              )),
        ));
  }
}
