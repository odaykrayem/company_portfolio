import 'package:companyportfolio/controllers/home/home_controller.dart';
import 'package:companyportfolio/extensions/int_extention.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../widgets/custom_button.dart';
import 'details_section.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final String homeTitle = 'homeTitle';
  final String homeContent = 'homeContent';
  final String homeButtonText = 'homeButton';
  final String homeImage = 'assets/images/transfer_1.png';
  final HomeController _homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    // return Directionality(
    //   textDirection: TextDirection.ltr,
    //   child: ScreenTypeLayout.builder(
    //     mobile: (_) => homeMobile(),
    //     desktop: (_) => homeDesktop(),
    //     tablet: (_) => homeMobile(),
    //   ),
    // );
    return ScreenTypeLayout.builder(
      mobile: (_) => homeMobile(),
      desktop: (_) => homeDesktop(),
      tablet: (_) => homeMobile(),
    );
  }

  Widget homeMobile() {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          40.height,
          Image.asset(
            homeImage,
            width: 150,
            height: 150,
          ),
          40.height,
          DetailsSection(
            title: homeTitle.tr,
            content: homeContent.tr,
          ),
          30.height,
          CustomButton(
            title: homeButtonText.tr,
            onTap: () {
             _homeController.changePage(3);
            },
          ),
          50.height
        ],
      ),
    );
  }

  Widget homeDesktop() {
    return Row(
      children: <Widget>[
        Expanded(
          child: SizedBox(
            child: Stack(
              children: [
                Positioned(
                    top: 10,
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      homeImage,
                    )),
              ],
            ),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DetailsSection(
                title: homeTitle.tr,
                content: homeContent.tr,
              ),
              Center(
                child: CustomButton(
                  title: homeButtonText.tr,
                  onTap: () {
                   _homeController.changePage(4);
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
