import 'package:flutter/material.dart';

import '../models/navigation_item.dart';

class NavigationProvider extends ChangeNotifier {
  NavigationItem _navigationItem = NavigationItem.shfon;
  String _title = 'ሽፎን እና የባህል ልብሶች';

  NavigationItem get navigationItem => _navigationItem;
  String get title => _title;

  void setNavigationItem(NavigationItem navigationItem) {
    _navigationItem = navigationItem;
    switch (navigationItem) {
      case NavigationItem.shfon:
        _title = 'ሽፎን እና የባህል ልብሶች';
        break;
      case NavigationItem.abaya:
        _title = 'ዓባያ እና ጅልባቦች';
        break;
      case NavigationItem.mewabya:
        _title = 'መዋብያዎች እና ጌጣጌጦች';
        break;
      case NavigationItem.lelochm:
        _title = 'ተጨማሪ ሌሎች';
        break;
      default:
        _title = 'ሽፎን እና የባህል ልብሶች';
    }
    notifyListeners();
  }
}
