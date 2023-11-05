import 'package:flutter/cupertino.dart';
import '../models/navbar_item_model.dart';
import '../routes/sub_routes.dart';

List<NavBarItemModel> navigationItemsList = [
  NavBarItemModel(
    title: 'home',
    navigationPath: SubRoutes.home,
    iconData: CupertinoIcons.house,
    index: 0,
  ),
  NavBarItemModel(
    title: 'aboutUs',
    navigationPath: SubRoutes.aboutUs,
    iconData: CupertinoIcons.info,
    index: 1,
  ),
  NavBarItemModel(
    title: 'services',
    navigationPath: SubRoutes.services,
    iconData: CupertinoIcons.question_circle,
    index: 2,
  ),
  NavBarItemModel(
    title: 'portfolio',
    navigationPath: SubRoutes.portfolio,
    iconData: CupertinoIcons.photo_fill_on_rectangle_fill,
    index: 3,
  ),
  NavBarItemModel(
    title: 'contactUs',
    navigationPath: SubRoutes.contactUs,
    iconData: CupertinoIcons.chat_bubble_2,
    index: 4,
  ),
];
