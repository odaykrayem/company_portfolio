import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:companyportfolio/controllers/home/HomeController.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../constants/app_colors.dart';
import '../data/nav_items_list.dart';
import 'custom_nav_button.dart';
import 'navbar_item.dart';
import 'package:companyportfolio/extensions/hover_pointer_extinsion.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key, this.navBarHeight = 100});
  final Color backgroundColor = AppColors.primaryColor;
  final double navBarHeight;

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<HomeController>(() => HomeController(repo: Get.find()));
    HomeController homeController = Get.find<HomeController>();
    // AuthController authController = Get.find<AuthController>();

    return Directionality(
      textDirection: TextDirection.ltr,
      child: ScreenTypeLayout.builder(
        mobile: (_) => navBarMobile(homeController),
        tablet: (_) => navBarMobile(homeController),
        desktop: (_) => navBarTabletDesktop(homeController),
      ),
    );
  }

  Widget navBarTabletDesktop(HomeController homeController) {
    return Container(
      height: navBarHeight,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
      // color: backgroundColor,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.only(
           bottomRight: Radius.circular(20.0),
           bottomLeft: Radius.circular(20.0),
           
           )),
      // decoration: BoxDecoration(gradient: AppColors.primaryGradientColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          navBarLogo(),
          Container(
            child: GetBuilder<HomeController>(builder: (controller) {
              return Row(children: [
                ...navigationItemsList.map(
                  (e) => Row(
                    children: [
                      NavBarItem(
                        model: e,
                      ),
                      const SizedBox(
                        width: 60,
                      ),
                    ],
                  ),
                ),
              ]);
            }),
          )
        ],
      ),
    ).showCursorOnHover;
  }

  Widget navBarMobile(HomeController homeController) {
    return Container(
      color: backgroundColor,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: const Icon(
              CupertinoIcons.line_horizontal_3_decrease,
              color: Colors.white,
            ),
            onPressed: () {
              homeController.openDrawer();
            },
          ),
          navBarLogo()
        ],
      ),
    );
  }

  Widget navBarLogo() {
    return SizedBox(
      width: 150,
      child:
          // Text('')
          Image.asset(
        'assets/images/logo128.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
