import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tlfi/widgets/photo_viewer.dart';

import '../../../constants/color.dart';
import '../../../providers/dark_theme_provider.dart';

class MyCard extends StatefulWidget {
  final List<int> indexes;
  const MyCard({super.key, required this.indexes});

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  final controller = CarouselController();

  final List<String> images = [
    '1.jpg',
    '2.jpg',
    '3.jpg',
    '4.jpg',
    '5.jpg',
    '6.jpg',
    '7.jpg',
    '8.jpg',
    '9.jpg',
    '10.jpg',
    '11.jpg',
    '12.jpeg',
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<DarkThemeProvider>(context);

    return Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2.0,
            color: theme.color1,
          ),
          image: DecorationImage(
            image: theme.cardBackground,
            fit: BoxFit.cover,
            opacity: 0.8,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: theme.color1,
                  radius: 20,
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                    radius: 18,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'ኣል-ኸያጢን ሸያጢን',
                    style: TextStyle(
                        color: theme.color1,
                        fontFamily: 'godana',
                        fontSize: 20),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                CarouselSlider.builder(
                  carouselController: controller,
                  options: CarouselOptions(
                    // autoPlay: true,
                    // pauseAutoPlayInFiniteScroll: true,
                    viewportFraction: 1.0,
                    // enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    aspectRatio: 0.6,
                    onPageChanged: (index, reason) =>
                        setState(() => activeIndex = index),
                  ),
                  itemCount: widget.indexes.length,
                  itemBuilder: (context, index, realIndex) {
                    final image = images[widget.indexes[index]];

                    return InkWell(
                      child: photo(image, widget.indexes[index], theme),
                      onTap: () async {
                        showGeneralDialog(
                          context: context,
                          barrierColor: Colors.black12.withOpacity(0.2),
                          pageBuilder: (context, animation,
                                  secondaryAnimation) =>
                              // Center(
                              //   child: Text('hello',
                              //       style: TextStyle(color: Colors.white)),
                              // )
                              Dismissible(
                            resizeDuration: const Duration(milliseconds: 10),
                            movementDuration: const Duration(milliseconds: 0),
                            key: UniqueKey(),
                            direction: DismissDirection.vertical,
                            onDismissed: (_) {
                              Navigator.of(context).pop();
                            },
                            child: myPhotoViewer(imageUrl: [
                              images[widget.indexes[0]],
                              images[widget.indexes[1]],
                              images[widget.indexes[2]]
                            ], initial: index),
                          ),
                        );
                        // showImageViewer(
                        //     context,
                        // AssetImage(
                        //     'assets/images/${images[widget.indexes[0]]}'));
                        // showModalBottomSheet(
                        //   context: context,
                        //   builder: ((context) {
                        //     return PhotoViewer(imageUrl: [
                        //       images[widget.indexes[0]],
                        //       images[widget.indexes[1]],
                        //       images[widget.indexes[2]]
                        //     ], initialPage: index);
                        //   }),
                        // );
                        // MultiImageProvider multiImageProvider =
                        //     MultiImageProvider([
                        //   AssetImage(
                        //       'assets/images/${images[widget.indexes[0]]}'),
                        //   AssetImage(
                        //       'assets/images/${images[widget.indexes[1]]}'),
                        //   AssetImage(
                        //       'assets/images/${images[widget.indexes[2]]}'),
                        // ], initialIndex: index);
                        // showImageViewerPager(
                        //   context,
                        //   multiImageProvider,
                        //   doubleTapZoomable: true,
                        //   // useSafeArea: true,
                        //   // swipeDismissible: true,
                        //   // immersive: false,
                        //   // useSafeArea: true,
                        // );

                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => PhotoViewer(imageUrl: [
                        //       images[widget.indexes[0]],
                        //       images[widget.indexes[1]],
                        //       images[widget.indexes[2]]
                        //     ], initialPage: index),
                        //   ),
                        // );
                      },
                    );
                  },
                ),
                Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      margin: const EdgeInsets.only(top: 4, left: 6),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                          border: Border.all(color: theme.color1)),
                      child: const Icon(
                        Icons.star,
                        color: Colors.white,
                      ),
                    )),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(21),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.0, color: theme.color1),
                        borderRadius: BorderRadius.circular(15),
                        color: MyColors.lightColor2,
                      ),
                      padding: const EdgeInsets.only(left: 8, right: 5),
                      margin: const EdgeInsets.only(left: 2, bottom: 2),
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/svgs/eye.svg',
                              height: 18, width: 18),
                          const SizedBox(width: 2),
                          const Text(
                            '7.2K',
                            style: TextStyle(
                              color: MyColors.lightColor1,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 3,
                  child: AnimatedSmoothIndicator(
                    count: widget.indexes.length,
                    activeIndex: activeIndex,
                    onDotClicked: animateToSlide,
                    effect: const SlideEffect(
                      activeDotColor: MyColors.lightColor2,
                      dotHeight: 8,
                      dotWidth: 8,
                      radius: 10,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(21),
                    ),
                    child: Container(
                      padding: const EdgeInsets.only(right: 8, left: 5),
                      margin: const EdgeInsets.only(right: 2, bottom: 2),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.0, color: theme.color1),
                        borderRadius: BorderRadius.circular(15),
                        color: MyColors.lightColor2,
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svgs/dollar.svg',
                            height: 22,
                            width: 22,
                          ),
                          const Text(
                            " 5,600",
                            style: TextStyle(
                              color: MyColors.lightColor1,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                text: 'ኣድራሻ:',
                style: TextStyle(
                    color: theme.color1,
                    fontFamily: 'godana',
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: 'መገናኛ፣ ዘፍምሽ',
                    style: TextStyle(
                        color: theme.color1,
                        fontFamily: 'godana',
                        fontSize: 15),
                  ),
                ],
              ),
            ),
            ReadMoreText(
              'ጥለቱ ያምራል፣ ኣንቺ ግን ኣታምሪም፣ ዊ ኒድ ሳም ቴክስት ግን ያምራል፣ ዝምብለሽ ግዢው፣ ኣግሊ ቢች ጥለቱ ያምራል፣ ኣንቺ ግን ኣታምሪም፣ ዊ ኒድ ሳም ቴክስት ግን ያምራል፣ ዝምብለሽ ግዢው፣ ኣግሊ ቢች',
              trimLines: 2,
              colorClickableText: MyColors.lightColor2,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'ተጨማሪ',
              trimExpandedText: '  ኣሳንስ',
              style: TextStyle(
                  color: theme.color1, fontFamily: 'godana', fontSize: 15),
              moreStyle: const TextStyle(
                  color: MyColors.lightColor2,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'godana',
                  fontSize: 13),
              lessStyle: const TextStyle(
                  color: MyColors.lightColor2,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'godana',
                  fontSize: 13),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('12/12/12 10:09 a.m',
                      style:
                          TextStyle(color: theme.color1, fontFamily: 'godana')),
                  OutlinedButton.icon(
                    onPressed: () {},
                    label: SvgPicture.asset(
                      'assets/svgs/telegram.svg',
                      height: 25,
                      width: 25,
                    ),
                    icon: const Text(
                      'ሻጭ',
                      style: TextStyle(
                          color: MyColors.lightColor1,
                          fontFamily: 'adwa',
                          fontSize: 25),
                    ),
                    style: ButtonStyle(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 8)),
                        backgroundColor:
                            MaterialStateProperty.all(MyColors.lightColor2),
                        side: MaterialStateProperty.all(BorderSide(
                            color: theme.darkTheme
                                ? MyColors.lightColor1
                                : MyColors.darkColor1,
                            width: 1.0)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        )),
                    // style: OutlinedButton.styleFrom(
                    //   padding: const EdgeInsets.symmetric(horizontal: 8),
                    //   backgroundColor: MyColors.lightColor2,

                    // ),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  Widget myPhotoViewer({required List<String> imageUrl, required int initial}) {
    PageController pageController = PageController(initialPage: initial);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // leading: Icon(Icons.close),
        iconTheme: const IconThemeData(),
        elevation: 0,
        backgroundColor: Colors.black12,
        actions: [
          OutlinedButton(
              child: Icon(
                Icons.close,
                color: MyColors.darkColor1,
                size: 25,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              })
        ],
      ),
      body: PhotoViewGallery.builder(
        // scrollPhysics: const BouncingScrollPhysics(),
        // allowImplicitScrolling: true,
        // gaplessPlayback: true,
        builder: (BuildContext context, int index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: AssetImage('assets/images/${imageUrl[index]}'),
            // scaleStateController: _scaleStateController,
            scaleStateCycle: otherScaleState,
            initialScale: PhotoViewComputedScale.contained,
            minScale: PhotoViewComputedScale.contained * 0.9,
            maxScale: PhotoViewComputedScale.covered * 2,
            // controller: _controller,
            // tightMode: true,

            // childSize: MediaQuery.of(context).size,
            // heroAttributes: PhotoViewHeroAttributes(tag: "Hello there"),
            // gestureDetectorBehavior: HitTestBehavior.opaque,
            basePosition: Alignment.center,
          );
        },
        itemCount: imageUrl.length,
        // loadingBuilder: (context, event) => Center(
        //   child: Container(
        //     width: 20.0,
        //     height: 20.0,
        //     child: CircularProgressIndicator(
        //       value: event == null ? 0 : event.cumulativeBytesLoaded / 15,
        //     ),
        //   ),
        // ),
        // backgroundDecoration: widget.backgroundDecoration,
        pageController: pageController,
        // onPageChanged: onPageChanged,
      ),
    );
  }

  PhotoViewScaleState otherScaleState(PhotoViewScaleState actual) {
    print('here');
    print(actual);

    if (actual == PhotoViewScaleState.covering) {
      return PhotoViewScaleState.initial;
    }
    return PhotoViewScaleState.covering;
  }

  void animateToSlide(int index) => controller.animateToPage(index);
  Widget photo(String image, int index, DarkThemeProvider theme) => Container(
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2.0,
            color: theme.color1,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset('assets/images/$image', fit: BoxFit.cover),
        ),
      );

  List<Widget> photos(
    List<int> indexes,
  ) {
    final pages = List.generate(
        3,
        ((index) => ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset('assets/images/${indexes[index]}.jpg'),
            )));
    return pages;
  }
}
