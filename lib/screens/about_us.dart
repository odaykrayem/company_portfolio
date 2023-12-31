import 'package:companyportfolio/extensions/int_extention.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../widgets/google_play_widget.dart';
import 'details_section.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  final String aboutUsTitle = 'aboutUsTitle';
  final String aboutUsContent = 'aboutUsContent';

  final String aboutImage = 'assets/images/transfer_2.png';

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: ScreenTypeLayout.builder(
        mobile: (_) => aboutMobile(),
        desktop: (_) => aboutDesktop(),
        tablet: (_) => aboutMobile(),
      ),
    );
  }

  Widget aboutDesktop() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DetailsSection(
                title: aboutUsTitle.tr,
                content: aboutUsContent.tr,
              ),
              const GooglePlayWidget(
                height: 80,
                width: 160,
              ),
            ],
          ),
        ),
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
                      aboutImage,
                    )),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget aboutMobile() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          50.height,
          Image.asset(
            aboutImage,
            width: 150,
            height: 150,
          ),
          50.height,
          DetailsSection(
            title: aboutUsTitle.tr,
            content: aboutUsContent.tr,
          ),
          100.height,
          const GooglePlayWidget(
            height: 80,
            width: 160,
          ),
        ],
      ),
    );
  }
}
