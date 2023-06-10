import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tlfi/pages/shfons_page/widgets/my_card.dart';

import '../../constants/color.dart';
import '../../drawer/my_drawer.dart';
import '../../providers/dark_theme_provider.dart';

class ShfonsPage extends StatelessWidget {
  const ShfonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          // leading: IconButton(
          //     onPressed: () => Scaffold,
          //     icon: const Icon(
          //       Icons.menu,
          //       size: 45,
          //     )),
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
                'assets/svgs/flower_daisy.svg',
                height: 25,
                width: 55,

                // fit: BoxFit.fill,
                // clipBehavior: Clip.none,
              ),
            ],
          ),
          backgroundColor: Colors.transparent.withOpacity(0.1),
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        drawer: const MyDrawer(),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Text(
                    'ሽፎን እና የባህል ልብሶች',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: theme.color1,
                      fontFamily: 'godawa',
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    // shrinkWrap: true,
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
                      MyCard(indexes: [7, 5, 5]),
                      MyCard(indexes: [2, 9, 2]),
                      MyCard(indexes: [11, 8, 8]),
                      MyCard(indexes: [4, 10, 0]),
                      MyCard(indexes: [6, 7, 6]),
                      MyCard(indexes: [3, 1, 3]),
                      MyCard(indexes: [5, 2, 10]),
                      MyCard(indexes: [9, 6, 9]),
                      MyCard(indexes: [8, 3, 5]),
                      MyCard(indexes: [10, 11, 5]),
                      MyCard(indexes: [1, 8, 4]),
                      MyCard(indexes: [7, 5, 6]),
                      MyCard(indexes: [2, 9, 3]),
                      MyCard(indexes: [11, 8, 9]),
                      MyCard(indexes: [4, 10, 1]),
                      MyCard(indexes: [6, 7, 7]),
                      MyCard(indexes: [3, 1, 4]),
                      MyCard(indexes: [5, 2, 11]),
                      MyCard(indexes: [9, 6, 0]),
                      MyCard(indexes: [8, 3, 6]),
                      MyCard(indexes: [10, 11, 6]),
                      MyCard(indexes: [1, 8, 5]),
                      MyCard(indexes: [7, 5, 7]),
                      MyCard(indexes: [2, 9, 4]),
                      MyCard(indexes: [11, 8, 0]),
                      MyCard(indexes: [4, 10, 2]),
                      MyCard(indexes: [6, 7, 8]),
                      MyCard(indexes: [3, 1, 5]),
                      MyCard(indexes: [5, 2, 10]),
                      MyCard(indexes: [9, 6, 1]),
                      MyCard(indexes: [8, 3, 7]),
                      MyCard(indexes: [10, 11, 7]),
                      MyCard(indexes: [1, 8, 6]),
                      MyCard(indexes: [7, 5, 8]),
                      MyCard(indexes: [2, 9, 5]),
                      MyCard(indexes: [11, 8, 1]),
                      MyCard(indexes: [4, 10, 3]),
                      MyCard(indexes: [6, 7, 9]),
                      MyCard(indexes: [3, 1, 6]),
                      MyCard(indexes: [5, 2, 11]),
                      MyCard(indexes: [9, 6, 2]),
                      MyCard(indexes: [8, 3, 8]),
                      MyCard(indexes: [1, 2, 3]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:tlfi/drawer/slider_view.dart';
// import 'package:tlfi/pages/home/widgets/my_card.dart';

// import '../../constants/color.dart';

// class HomePage extends StatelessWidget {
//   HomePage({super.key});
//   final GlobalKey<SliderDrawerState> _sliderDrawerKey =
//       GlobalKey<SliderDrawerState>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         extendBodyBehindAppBar: true,
//         appBar: AppBar(
//           centerTitle: true,
//           leading: IconButton(
//               onPressed: () => _sliderDrawerKey.currentState!.toggle(),
//               icon: const Icon(
//                 Icons.menu,
//                 size: 45,
//               )),
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const Text(
//                 'ኣደይ',
//                 style: TextStyle(
//                   color: MyColors.darkColor,
//                   fontFamily: 'mulat_medium_italic',
//                   fontWeight: FontWeight.bold,
//                   fontSize: 45,
//                 ),
//               ),
//               SvgPicture.asset(
//                 'assets/svgs/flower_daisy.svg',
//                 height: 25,
//                 width: 55,

//                 // fit: BoxFit.fill,
//                 // clipBehavior: Clip.none,
//               ),
//             ],
//           ),
//           backgroundColor: Colors.transparent.withOpacity(0.1),
//           elevation: 0,
//         ),
//         backgroundColor: Colors.transparent,
//         // drawer: Drawer(),
//         body: SliderDrawer(
//           appBar: null,
//           // appBar: AppBar(
//           //   centerTitle: true,
//           //   // leading: IconButton(
//           //   //     onPressed: () => Scaffold.of(context).openDrawer,
//           //   //     icon: const Icon(
//           //   //       Icons.menu,
//           //   //       size: 45,
//           //   //     )),
//           //   title: Row(
//           //     mainAxisAlignment: MainAxisAlignment.center,
//           //     mainAxisSize: MainAxisSize.min,
//           //     children: [
//           //       const Text(
//           //         'ኣደይ',
//           //         style: TextStyle(
//           //           color: MyColors.darkColor,
//           //           fontFamily: 'mulat_medium_italic',
//           //           fontWeight: FontWeight.bold,
//           //           fontSize: 45,
//           //         ),
//           //       ),
//           //       SvgPicture.asset(
//           //         'assets/svgs/flower_daisy.svg',
//           //         height: 25,
//           //         width: 55,

//           //         // fit: BoxFit.fill,
//           //         // clipBehavior: Clip.none,
//           //       ),
//           //     ],
//           //   ),
//           //   backgroundColor: Colors.transparent.withOpacity(0.1),
//           //   elevation: 0,
//           // ),
//           key: _sliderDrawerKey,
//           // sliderOpenSize: 179,
//           slider: SliderView(),
//           child: DecoratedBox(
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage("assets/background/background_light_2.jpg"),
//                 opacity: 0.8,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             child: SafeArea(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     margin: EdgeInsets.symmetric(
//                       horizontal: 16,
//                     ),
//                     child: const Text(
//                       'ሽፎን እና የባህል ልብሶች',
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(
//                         fontFamily: 'godawa',
//                         fontWeight: FontWeight.bold,
//                         fontSize: 25,
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: ListView(
//                       // shrinkWrap: true,
//                       children: [
//                         MyCard(indexes: [10, 11, 0]),
//                         MyCard(indexes: [1, 8, 11]),
//                         MyCard(indexes: [7, 5, 3]),
//                         MyCard(indexes: [2, 9, 4]),
//                         MyCard(indexes: [11, 8, 5]),
//                         MyCard(indexes: [4, 10, 9]),
//                         MyCard(indexes: [6, 7, 2]),
//                         MyCard(indexes: [3, 1, 11]),
//                         MyCard(indexes: [5, 2, 10]),
//                         MyCard(indexes: [9, 6, 1]),
//                         MyCard(indexes: [8, 3, 7]),
//                         MyCard(indexes: [10, 11, 1]),
//                         MyCard(indexes: [1, 8, 0]),
//                         MyCard(indexes: [7, 5, 2]),
//                         MyCard(indexes: [2, 9, 3]),
//                         MyCard(indexes: [11, 8, 4]),
//                         MyCard(indexes: [4, 10, 7]),
//                         MyCard(indexes: [6, 7, 5]),
//                         MyCard(indexes: [3, 1, 0]),
//                         MyCard(indexes: [5, 2, 11]),
//                         MyCard(indexes: [9, 6, 8]),
//                         MyCard(indexes: [8, 3, 2]),
//                         MyCard(indexes: [10, 11, 2]),
//                         MyCard(indexes: [1, 8, 1]),
//                         MyCard(indexes: [7, 5, 3]),
//                         MyCard(indexes: [2, 9, 0]),
//                         MyCard(indexes: [11, 8, 6]),
//                         MyCard(indexes: [4, 10, 8]),
//                         MyCard(indexes: [6, 7, 4]),
//                         MyCard(indexes: [3, 1, 1]),
//                         MyCard(indexes: [5, 2, 10]),
//                         MyCard(indexes: [9, 6, 7]),
//                         MyCard(indexes: [8, 3, 3]),
//                         MyCard(indexes: [10, 11, 3]),
//                         MyCard(indexes: [1, 8, 2]),
//                         MyCard(indexes: [7, 5, 4]),
//                         MyCard(indexes: [2, 9, 1]),
//                         MyCard(indexes: [11, 8, 7]),
//                         MyCard(indexes: [4, 10, 9]),
//                         MyCard(indexes: [6, 7, 5]),
//                         MyCard(indexes: [3, 1, 2]),
//                         MyCard(indexes: [5, 2, 11]),
//                         MyCard(indexes: [9, 6, 8]),
//                         MyCard(indexes: [8, 3, 4]),
//                         MyCard(indexes: [10, 11, 4]),
//                         MyCard(indexes: [1, 8, 3]),
//                         MyCard(indexes: [7, 5, 5]),
//                         MyCard(indexes: [2, 9, 2]),
//                         MyCard(indexes: [11, 8, 8]),
//                         MyCard(indexes: [4, 10, 0]),
//                         MyCard(indexes: [6, 7, 6]),
//                         MyCard(indexes: [3, 1, 3]),
//                         MyCard(indexes: [5, 2, 10]),
//                         MyCard(indexes: [9, 6, 9]),
//                         MyCard(indexes: [8, 3, 5]),
//                         MyCard(indexes: [10, 11, 5]),
//                         MyCard(indexes: [1, 8, 4]),
//                         MyCard(indexes: [7, 5, 6]),
//                         MyCard(indexes: [2, 9, 3]),
//                         MyCard(indexes: [11, 8, 9]),
//                         MyCard(indexes: [4, 10, 1]),
//                         MyCard(indexes: [6, 7, 7]),
//                         MyCard(indexes: [3, 1, 4]),
//                         MyCard(indexes: [5, 2, 11]),
//                         MyCard(indexes: [9, 6, 0]),
//                         MyCard(indexes: [8, 3, 6]),
//                         MyCard(indexes: [10, 11, 6]),
//                         MyCard(indexes: [1, 8, 5]),
//                         MyCard(indexes: [7, 5, 7]),
//                         MyCard(indexes: [2, 9, 4]),
//                         MyCard(indexes: [11, 8, 0]),
//                         MyCard(indexes: [4, 10, 2]),
//                         MyCard(indexes: [6, 7, 8]),
//                         MyCard(indexes: [3, 1, 5]),
//                         MyCard(indexes: [5, 2, 10]),
//                         MyCard(indexes: [9, 6, 1]),
//                         MyCard(indexes: [8, 3, 7]),
//                         MyCard(indexes: [10, 11, 7]),
//                         MyCard(indexes: [1, 8, 6]),
//                         MyCard(indexes: [7, 5, 8]),
//                         MyCard(indexes: [2, 9, 5]),
//                         MyCard(indexes: [11, 8, 1]),
//                         MyCard(indexes: [4, 10, 3]),
//                         MyCard(indexes: [6, 7, 9]),
//                         MyCard(indexes: [3, 1, 6]),
//                         MyCard(indexes: [5, 2, 11]),
//                         MyCard(indexes: [9, 6, 2]),
//                         MyCard(indexes: [8, 3, 8]),
//                         MyCard(indexes: [1, 2, 3]),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ));
//   }
// }
