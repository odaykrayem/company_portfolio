import 'package:companyportfolio/constants/custom_values.dart';
import 'package:companyportfolio/extensions/widget_extension.dart';
import 'package:flutter/material.dart';

import '../constants/app_values.dart';
import 'launcher_widget.dart';

class GooglePlayWidget extends StatelessWidget {
  const GooglePlayWidget(
      {super.key, required this.width, required this.height});
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/ic_play_store.png',
            height: height,
            width: width,
          ).onTap(() {
            launchUrlWidget(CustomValues.appGooglePlayURL);
          }),
        ],
      ),
    );
  }
}
