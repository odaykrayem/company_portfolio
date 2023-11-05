import 'package:flutter/cupertino.dart';
import 'package:companyportfolio/constants/personal_values.dart';
import 'package:companyportfolio/extensions/int_extention.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../constants/app_colors.dart';
import 'package:companyportfolio/extensions/hover_pointer_extinsion.dart';
import '../controllers/home/HomeController.dart';
import '../data/nav_items_list.dart';
import 'google_play_widget.dart';
import 'launcher_widget.dart';

class Footer extends StatelessWidget {
  Footer({super.key});
  final Color backgroundColor = AppColors.primaryColor;
  final String footerImagePath = 'assets/images/logo.png';
  final HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (_) => footerMobile(),
      tablet: (_) => footerMobile(),
      desktop: (_) => footerTabletDesktop(),
    );
  }

  Widget footerTabletDesktop() {
    return Container(
      height: 310,
      padding: const EdgeInsets.only(right: 80, left: 80, top: 25, bottom: 5),
      decoration: BoxDecoration(
         borderRadius: BorderRadius.only(
           topRight: Radius.circular(20.0),
           topLeft: Radius.circular(20.0),
           
           ),
           color: backgroundColor
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              footerGroupItems(imagePath: footerImagePath, items: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  width: 250,
                  child: Text(
                    'downloadTheAppByClickingTheLinkBelow'.tr,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),
                ),
                15.height,
                const GooglePlayWidget(
                  height: 50,
                  width: 100,
                ),
              ]),
              footerGroupItems(title: PersonalValues.companyName, items: [
                ...navigationItemsList.map((e) => footerItem(
                      content: e.title.tr,
                      onTap: () {
                        _homeController.changePage(e.index);
                      },
                    )),
              ]),
              GetBuilder<HomeController>(builder: (controller) {
                return footerGroupItems(title: 'contactUs'.tr, items: [
                  footerItem(
                      content: '${PersonalValues.companyEmail}',
                      icon: CupertinoIcons.mail,
                      onTap: () {
                        launchUrlWidget('mailto:${PersonalValues.companyEmail}');
                      }),
                  footerItem(
                      content: '${PersonalValues.companyPhone}',
                      icon: CupertinoIcons.phone_circle,
                      onTap: () {
                        launchUrlWidget('tel:${PersonalValues.companyPhone}');
                      }),
                  footerItem(
                    content: '${PersonalValues.companyLocation}',
                    icon: CupertinoIcons.location_solid,
                  ),
                ]);
              }),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              RichText(
                  text: const TextSpan(
                      text: 'Copyright ',
                      style: TextStyle(
                        color: AppColors.textPrimaryColor,
                        fontSize: 12,
                      ),
                      children: [
                    TextSpan(
                        text: ' © 2023 ${PersonalValues.companyName}',
                        style: TextStyle(
                          color: AppColors.textPrimaryColor,
                          fontSize: 12,
                        )),
                    // WidgetSpan(
                    //     child: Container(
                    //   margin: EdgeInsets.symmetric(horizontal: 5),
                    //   child: Center(
                    //     child: Image.asset(
                    //       'assets/images/icon64.png',
                    //       width: 18,
                    //       height: 18,
                    //       color: Colors.transparent,
                    //     ),
                    //   ),
                    // )),
                    // const TextSpan(
                    //     text: ' And Design By ',
                    //     style: TextStyle(
                    //       color: AppColors.textPrimaryColor,
                    //       fontSize: 14,
                    //     )),
                    // const TextSpan(
                    //     text: 'MrMind Team',
                    //     style: TextStyle(
                    //       color: AppColors.boldTextColor,
                    //       fontSize: 14,
                    //     )),
                  ]))
            ],
          ),
        ],
      ),
    ).showCursorOnHover;
  }

  Widget footerMobile() {
    return Container(
      height: 900,
      padding: const EdgeInsets.only(right: 30, left: 30, top: 25, bottom: 5),
      color: backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          footerGroupItems(
              crossAxisAlignment: CrossAxisAlignment.center,
              imagePath: footerImagePath,
              items: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  width: 250,
                  child: Text(
                    'downloadTheAppByClickingTheLinkBelow'.tr,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),
                ),
                15.height,
                const GooglePlayWidget(
                  height: 50,
                  width: 100,
                ),
              ]),
          footerGroupItems(
              crossAxisAlignment: CrossAxisAlignment.center,
              title: PersonalValues.companyName,
              items: [
                ...navigationItemsList.map((e) => footerItem(
                      mainAxisAlignment: MainAxisAlignment.center,
                      content: e.title,
                      onTap: () {
                        _homeController.changePage(e.index);
                      },
                    )),
              ]),
          GetBuilder<HomeController>(builder: (controller) {
            return footerGroupItems(
                crossAxisAlignment: CrossAxisAlignment.center,
                title: 'contactUs'.tr,
                items: [
                  footerItem(
                      content: '${PersonalValues.companyEmail}',
                      icon: CupertinoIcons.mail,
                      onTap: () {
                        launchUrlWidget('mailto:${PersonalValues.companyEmail}');
                      },
                      mainAxisAlignment: MainAxisAlignment.center),
                  footerItem(
                      content: '${PersonalValues.companyPhone}',
                      icon: CupertinoIcons.phone_circle,
                      onTap: () {
                        launchUrlWidget('tel:${PersonalValues.companyPhone}');
                      },
                      mainAxisAlignment: MainAxisAlignment.center),
                  footerItem(
                      content: '${PersonalValues.companyLocation}',
                      icon: CupertinoIcons.location_solid,
                      mainAxisAlignment: MainAxisAlignment.center),
                ]);
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              RichText(
                  text: const TextSpan(
                      text: '2023 © Copyright ',
                      style: TextStyle(
                        color: AppColors.textPrimaryColor,
                        fontSize: 12,
                      ),
                      children: [
                    TextSpan(
                        text: 'companyportfolio',
                        style: TextStyle(
                          color: AppColors.boldTextColor,
                          fontSize: 12,
                        )),
                  ]))
            ],
          ),
        ],
      ),
    );
  }

  Widget footerGroupItems(
      {required List<Widget> items,
      // bool isTitleImage = false,
      String? title,
      String? imagePath,
      CrossAxisAlignment? crossAxisAlignment}) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
      children: [
        imagePath != null
            ? SizedBox(
                width: 200,
                child: Image.asset(imagePath),
              )
            : Container(
                margin: const EdgeInsets.only(bottom: 15, top: 15),
                child: Text(
                  title!,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Outfit-Medium'),
                ),
              ),
        ...items
      ],
    );
  }

  Widget footerItem({
    IconData? icon,
    required String content,
    double? iconSize,
    Color iconColor = Colors.white,
    VoidCallback? onTap,
    MainAxisAlignment? mainAxisAlignment,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
          children: [
            icon != null
                ? Icon(
                    icon,
                    size: iconSize,
                    color: iconColor,
                  )
                : 0.width,
            5.width,
            Text(
              content,
              style: const TextStyle(color: Colors.white, fontSize: 14),
              softWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}
