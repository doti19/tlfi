import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tlfi/pages/abayas_page/index.dart';
import 'package:tlfi/pages/lelochm_page/index.dart';
import 'package:tlfi/pages/mewabyas_page/index.dart';

import '../models/navigation_item.dart';
import '../pages/main_page/main_page.dart';
import '../pages/shfons_page/index.dart';
import '../providers/navigation_provider.dart';

Widget buildPages(BuildContext context) {
  // final provider = Provider.of<NavigationProvider>(context);
  // final navigationItem = provider.navigationItem;

  // switch (navigationItem) {
  //   case NavigationItem.shfon:
  //     return MainPage(title: 'ሽፎን እና የባህል ልብሶች');
  //   case NavigationItem.mewabya:
  //     return MainPage();
  //   case NavigationItem.abaya:
  //     return MainPage();
  //   case NavigationItem.lelochm:
  //     return MainPage();
  // }
  return const MainPage();
}
