import 'package:flutter/widgets.dart';

class NavBarItemModel {
  final String title;
  final String navigationPath;
  final IconData? iconData;
  final int index;

  NavBarItemModel({
    required this.title,
    required this.navigationPath,
    required this.iconData,
    required this.index,
  });
}
