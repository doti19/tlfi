import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/color.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent.withOpacity(0.3),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'ኣደይ',
                  style: TextStyle(
                    color: MyColors.lightColor,
                    fontFamily: 'mulat_medium_italic',
                    fontWeight: FontWeight.bold,
                    fontSize: 45,
                  ),
                ),
                SvgPicture.asset(
                  'assets/svgs/flower_daisy.svg',
                  height: 25,
                  width: 55,

                  // fit: BoxFit.fill,
                  // clipBehavior: Clip.none,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
