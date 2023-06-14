import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../drawer/my_drawer.dart';
import '../../drawer/my_drawer_land.dart';
import '../../providers/dark_theme_provider.dart';
import '../../providers/navigation_provider.dart';
import '../../widgets/my_card.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<DarkThemeProvider>(context);
    final nav = Provider.of<NavigationProvider>(context);
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'ኣደይ',
                style: TextStyle(
                  color: theme.color1,
                  fontFamily: 'mulat_medium_italic',
                  fontWeight: FontWeight.bold,
                  fontSize: 45,
                ),
              ),
              SvgPicture.asset(
                '${theme.path}/flower_daisy.svg',
                height: 25,
                width: 55,
              ),
            ],
          ),
          backgroundColor: Colors.transparent.withOpacity(0.1),
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        drawer: orientation == Orientation.landscape
            ? const MyDrawerLand()
            : const MyDrawer(),
        body: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: theme.mainBackground,
              opacity: 0.8,
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.black12,
                  child: Center(
                    child: Text(
                      nav.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: theme.color1,
                        fontFamily: 'godana',
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: AspectRatio(
                    aspectRatio: orientation == Orientation.landscape ? 2 : 1,
                    child: ListView(
                      children: const [
                        MyCard(indexes: [10, 11, 0]),
                        MyCard(indexes: [1, 8, 11]),
                        MyCard(indexes: [7, 5, 3]),
                        MyCard(indexes: [2, 9, 4]),
                        MyCard(indexes: [11, 8, 5]),
                        MyCard(indexes: [4, 10, 9]),
                        MyCard(indexes: [6, 7, 2]),
                        MyCard(indexes: [3, 1, 11]),
                        MyCard(indexes: [5, 2, 10]),
                        MyCard(indexes: [9, 6, 1]),
                        MyCard(indexes: [8, 3, 7]),
                        MyCard(indexes: [10, 11, 1]),
                        MyCard(indexes: [1, 8, 0]),
                        MyCard(indexes: [7, 5, 2]),
                        MyCard(indexes: [2, 9, 3]),
                        MyCard(indexes: [11, 8, 4]),
                        MyCard(indexes: [4, 10, 7]),
                        MyCard(indexes: [6, 7, 5]),
                        MyCard(indexes: [3, 1, 0]),
                        MyCard(indexes: [5, 2, 11]),
                        MyCard(indexes: [9, 6, 8]),
                        MyCard(indexes: [8, 3, 2]),
                        MyCard(indexes: [10, 11, 2]),
                        MyCard(indexes: [1, 8, 1]),
                        MyCard(indexes: [7, 5, 3]),
                        MyCard(indexes: [2, 9, 0]),
                        MyCard(indexes: [11, 8, 6]),
                        MyCard(indexes: [4, 10, 8]),
                        MyCard(indexes: [6, 7, 4]),
                        MyCard(indexes: [3, 1, 1]),
                        MyCard(indexes: [5, 2, 10]),
                        MyCard(indexes: [9, 6, 7]),
                        MyCard(indexes: [8, 3, 3]),
                        MyCard(indexes: [10, 11, 3]),
                        MyCard(indexes: [1, 8, 2]),
                        MyCard(indexes: [7, 5, 4]),
                        MyCard(indexes: [2, 9, 1]),
                        MyCard(indexes: [11, 8, 7]),
                        MyCard(indexes: [4, 10, 9]),
                        MyCard(indexes: [6, 7, 5]),
                        MyCard(indexes: [3, 1, 2]),
                        MyCard(indexes: [5, 2, 11]),
                        MyCard(indexes: [9, 6, 8]),
                        MyCard(indexes: [8, 3, 4]),
                        MyCard(indexes: [10, 11, 4]),
                        MyCard(indexes: [1, 8, 3]),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
