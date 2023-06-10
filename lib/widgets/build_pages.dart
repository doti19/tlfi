import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tlfi/pages/abayas_page/index.dart';
import 'package:tlfi/pages/lelochm_page/index.dart';
import 'package:tlfi/pages/mewabyas_page/index.dart';

import '../models/navigation_item.dart';
import '../pages/shfons_page/index.dart';
import '../providers/navigation_provider.dart';

Widget buildPages(BuildContext context) {
  final provider = Provider.of<NavigationProvider>(context);
  final navigationItem = provider.navigationItem;

  switch (navigationItem) {
    case NavigationItem.shfon:
      return ShfonsPage();
    case NavigationItem.mewabya:
      return MewabyasPage();
    case NavigationItem.abaya:
      return AbayasPage();
    case NavigationItem.lelochm:
      return LelochmPage();
  }
}
