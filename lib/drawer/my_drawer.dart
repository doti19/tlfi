import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../constants/color.dart';
import '../models/navigation_item.dart';
import '../providers/dark_theme_provider.dart';
import '../providers/navigation_provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<DarkThemeProvider>(context);
    return Drawer(
      backgroundColor: theme.drawerColor,
      child: Column(
        // padding: EdgeInsets.zero,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          DrawerHeader(
            padding: const EdgeInsets.all(0),
            decoration: const BoxDecoration(),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'ኣደይ',
                      style: TextStyle(
                        color: theme.color1,
                        fontFamily: 'mulat_medium_italic',
                        fontWeight: FontWeight.bold,
                        fontSize: 100,
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/svgs/flower_daisy.svg',
                      height: 45,
                      width: 55,
                    ),
                  ],
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    onPressed: () {
                      theme.darkTheme = !theme.darkTheme;
                      print(theme.darkTheme);
                    },
                    icon: SvgPicture.asset(
                      'assets/svgs/sunmode.svg',
                      height: 35,
                      width: 35,
                    ),
                  ),
                )
              ],
            ),
          ),
          buildMenuItem(
            context,
            item: NavigationItem.shfon,
            text: 'ሽፎን እና የባህል ልብሶች',
            icon: Icons.woman,
            theme: theme,
          ),
          buildMenuItem(
            context,
            item: NavigationItem.abaya,
            text: 'ዓባያ እና ጅልባቦች',
            icon: Icons.pregnant_woman,
            theme: theme,
          ),
          buildMenuItem(
            context,
            item: NavigationItem.mewabya,
            text: 'መዋቢያዎች እና ጌጣጌጦች',
            icon: Icons.elderly_woman,
            theme: theme,
          ),
          buildMenuItem(
            context,
            item: NavigationItem.lelochm,
            text: 'ሌሎችም',
            icon: Icons.checkroom,
            theme: theme,
          ),
          // const SizedBox(
          //   height: 24,
          // ),
          // const Divider(color: MyColors.darkColor),
          // const SizedBox(height: 24),
          // Expanded(child: Container()),
          // Expanded(child: Container()),
          Spacer(flex: 1),
          Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  'የክፍያ ዘዴዎች',
                  style: TextStyle(
                      fontFamily: 'godana', fontSize: 30, color: theme.color1),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SvgPicture.asset(
                        'assets/svgs/cbe_birr.svg',
                        height: 35,
                        width: 35,
                      ),
                      SvgPicture.asset(
                        'assets/svgs/telebirr.svg',
                        height: 35,
                        width: 35,
                      ),
                      SvgPicture.asset(
                        'assets/svgs/awash_bank.svg',
                        height: 35,
                        width: 35,
                      ),
                    ]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuItem(
    BuildContext context, {
    required NavigationItem item,
    required String text,
    required IconData icon,
    required DarkThemeProvider theme,
  }) {
    final provider = Provider.of<NavigationProvider>(context);
    final currentItem = provider.navigationItem;
    final isSelected = item == currentItem;

    Color color = theme.color1;

    return ListTile(
      selected: isSelected,
      selectedTileColor: MyColors.lightColor2,
      leading: Icon(icon, color: color, size: 25),
      title: Text(
        text,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontFamily: 'godana', color: color, fontSize: 20),
      ),
      onTap: () => selectItem(context, item),
    );
  }

  void selectItem(BuildContext context, NavigationItem item) {
    final provider = Provider.of<NavigationProvider>(context, listen: false);
    provider.setNavigationItem(item);
  }
}
