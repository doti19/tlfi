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
                      '${theme.path}/flower_daisy.svg',
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
                      '${theme.path}/sunmode.svg',
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
            icon: SvgPicture.asset('${theme.path}/dress.svg',
                height: 25, width: 25),
            color: theme.color1,
          ),
          buildMenuItem(
            context,
            item: NavigationItem.abaya,
            text: 'ዓባያ እና ጅልባቦች',
            icon: SvgPicture.asset('${theme.path}/muslimabaya.svg',
                height: 25, width: 25),
            color: theme.color1,
          ),
          buildMenuItem(
            context,
            item: NavigationItem.mewabya,
            text: 'መዋቢያዎች እና ጌጣጌጦች',
            icon: SvgPicture.asset('${theme.path}/cosmetics.svg',
                height: 25, width: 25),
            color: theme.color1,
          ),
          buildMenuItem(
            context,
            item: NavigationItem.lelochm,
            text: 'ሌሎችም',
            icon: SvgPicture.asset('${theme.path}/perfume.svg',
                height: 25, width: 25),
            color: theme.color1,
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
    required Widget icon,
    required Color color,
  }) {
    final provider = Provider.of<NavigationProvider>(context);
    final currentItem = provider.navigationItem;
    final isSelected = item == currentItem;

    return ListTile(
      selected: isSelected,
      selectedTileColor: MyColors.lightColor2,
      leading: icon,
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
    Navigator.pop(context);
  }
}
