import 'package:companyportfolio/extensions/int_extention.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';
import '../controllers/home/home_controller.dart';
import '../data/nav_items_list.dart';
import 'custom_nav_button.dart';
import 'navbar_item.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key, required this.onCloseTapped});
  final VoidCallback onCloseTapped;

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<HomeController>(() => HomeController(repo: Get.find()));
    HomeController homeController = Get.find<HomeController>();
    return Container(
      width: 300,
      decoration: const BoxDecoration(
        color: Colors.white,
        // gradient: ColorGradient.background2,
        // boxShadow: [
        //   BoxShadow(color: Colors.black12, blurRadius: 16),
        // ],
      ),
      child: Column(
          children:[
                  navDrawerHeader(homeController),
                  ...navigationItemsList.map(
                    (e) => NavBarItem(
                      model: e,
                    ),
                  ),
                  20.height,
                  // CustomNavButton(
                  //   title: 'profile'.tr,
                  //   onButtonPressed: () {
                  //     homeController.closeDrawer();

                  //     homeController.openDialog(ProfilePage());
                  //   },
                  // ),
                ]
              ),
    );
  }

  Widget navDrawerHeader(HomeController homeController) {
    return Container(
      height: 150,
      color: AppColors.primaryColor,
      alignment: Alignment.center,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: onCloseTapped,
              child: Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    // gradient: ColorGradient.backgroundBtn,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15))),
                child: const Icon(
                  Icons.close_rounded,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.white,
                        child: IconButton(
                            onPressed: () {
                            },
                            color: Colors.white,
                            icon: Icon(
                              Icons.person,
                              color: AppColors.primaryColor,
                            )),
                      )
                    ,
                // Text(
                //   'SKILL UP NOW',
                //   style: TextStyle(
                //       fontSize: 18,
                //       fontWeight: FontWeight.w800,
                //       color: Colors.white),
                // ),
                // Text(
                //   'TAP HERE',
                //   style: TextStyle(
                //     color: Colors.white,
                //   ),
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
