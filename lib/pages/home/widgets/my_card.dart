import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:readmore/readmore.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../constants/color.dart';

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
    return Container(
        // height: 500,
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2.0,
            color: MyColors.darkColor,
          ),
          image: const DecorationImage(
            image: AssetImage("assets/background/background_light_1.jpg"),
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
            const Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: MyColors.darkColor,
                  radius: 27,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                    radius: 25,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'ኣል- ኸያጢን ሸያጢን',
                    style: TextStyle(color: MyColors.darkColor, fontSize: 20),
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
                // SizedBox(
                //   height: double.infinity,
                //   child: PageView.builder(
                //       controller: controller,
                //       itemBuilder: (_, index) {
                //         return photos(indexes)[index % photos(indexes).length];
                //       }),
                // ),
                // ClipRRect(
                //     borderRadius: BorderRadius.circular(15),
                //     child: Image.asset('assets/images/2.jpg')),
                CarouselSlider.builder(
                  carouselController: controller,
                  options: CarouselOptions(
                    viewportFraction: 1.0,
                    enlargeCenterPage: true,
                    // pageSnapping: false,
                    enableInfiniteScroll: false,
                    aspectRatio: 0.6,
                    onPageChanged: (index, reason) =>
                        setState(() => activeIndex = index),
                  ),
                  itemCount: widget.indexes.length,
                  itemBuilder: (context, index, realIndex) {
                    final image = images[widget.indexes[index]];

                    return photo(image, widget.indexes[index]);
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
                          border: Border.all(color: MyColors.darkColor)),
                      child: const Icon(
                        Icons.star,
                        color: Colors.white,
                      ),
                    )),
                Positioned(
                  top: 0,
                  right: 0,
                  child: ClipRRect(
                    borderRadius:
                        const BorderRadius.only(topRight: Radius.circular(21)),
                    child: Container(
                      color: Colors.black26,
                      padding: const EdgeInsets.only(right: 8, left: 5),
                      margin: const EdgeInsets.only(right: 2, top: 2),
                      child: Text(
                        '${activeIndex + 1}/${widget.indexes.length}',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(21),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        border:
                            Border.all(width: 1.0, color: MyColors.darkColor),
                        borderRadius: BorderRadius.circular(15),
                        color: MyColors.lightColor,
                      ),
                      padding: const EdgeInsets.only(left: 8, right: 5),
                      margin: const EdgeInsets.only(left: 2, bottom: 2),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.visibility,
                            color: MyColors.darkColor,
                          ),
                          SizedBox(width: 2),
                          Text(
                            '7.2K',
                            style: TextStyle(
                              color: MyColors.darkColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
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
                    // controller: controller,
                    count: widget.indexes.length,
                    activeIndex: activeIndex,
                    onDotClicked: animateToSlide,
                    // effect: const WormEffect(
                    //   dotHeight: 16,
                    //   dotWidth: 16,
                    //   type: WormType.thinUnderground,
                    // ),
                    effect: const SlideEffect(
                      activeDotColor: MyColors.lightColor,
                      dotHeight: 12,
                      dotWidth: 12,
                      // jumpScale: 0.7,
                      // verticalOffset: 15,
                    ),
                    // effect: const ScrollingDotsEffect(
                    //   activeDotColor: Colors.redAccent,
                    //   activeStrokeWidth: 2.6,
                    //   activeDotScale: 1.3,
                    //   maxVisibleDots: 5,
                    //   radius: 10,
                    //   spacing: 10,
                    //   dotHeight: 10,
                    //   dotWidth: 10,
                    // ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomRight: Radius.circular(21),
                    ),
                    child: Container(
                      padding: const EdgeInsets.only(right: 8, left: 5),
                      margin: const EdgeInsets.only(right: 2, bottom: 2),
                      decoration: BoxDecoration(
                        border:
                            Border.all(width: 1.0, color: MyColors.darkColor),
                        borderRadius: BorderRadius.circular(15),
                        color: MyColors.lightColor,
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svgs/dollar.svg',
                            height: 18,
                            width: 18,

                            // fit: BoxFit.fill,
                            // clipBehavior: Clip.none,
                          ),
                          const Text(
                            " 5,600",
                            style: TextStyle(
                              color: MyColors.darkColor,
                              fontSize: 18,
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
            const Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                text: 'ኣድራሻ:',
                style: TextStyle(
                    color: MyColors.darkColor,
                    fontFamily: 'godana',
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: 'መገናኛ፣ ዘፍምሽ',
                    style: TextStyle(
                        color: MyColors.darkColor,
                        fontFamily: 'godana',
                        fontSize: 15),
                  ),
                ],
              ),
            ),
            const ReadMoreText(
              'ጥለቱ ያምራል፣ ኣንቺ ግን ኣታምሪም፣ ዊ ኒድ ሳም ቴክስት ግን ያምራል፣ ዝምብለሽ ግዢው፣ ኣግሊ ቢች ጥለቱ ያምራል፣ ኣንቺ ግን ኣታምሪም፣ ዊ ኒድ ሳም ቴክስት ግን ያምራል፣ ዝምብለሽ ግዢው፣ ኣግሊ ቢች',
              trimLines: 2,
              colorClickableText: MyColors.lightColor,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'ተጨማሪ',
              trimExpandedText: '  ኣሳንስ',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: MyColors.darkColor,
                  fontFamily: 'godana',
                  fontSize: 15),
              moreStyle: TextStyle(
                  color: MyColors.lightColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'godana',
                  fontSize: 13),
              lessStyle: TextStyle(
                  color: MyColors.lightColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'godana',
                  fontSize: 13),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text('12/12/12 10:09 a.m',
                    style: TextStyle(color: MyColors.darkColor)),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/svgs/telegram.svg',
                    height: 25,
                    width: 25,

                    // fit: BoxFit.fill,
                    // clipBehavior: Clip.none,
                  ),
                  label: const Text(
                    'ሻጭ',
                    style: TextStyle(
                        color: MyColors.darkColor,
                        fontFamily: 'godana',
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    backgroundColor: MyColors.lightColor,
                  ),
                ),
              ],
            )
          ],
        ));
  }

  void animateToSlide(int index) => controller.animateToPage(index);
  Widget photo(String image, int index) => Container(
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2.0,

            color: MyColors.darkColor,
            // strokeAlign: BorderSide.strokeAlignCenter,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset('assets/images/$image', fit: BoxFit.cover),
        ),
      );

  List<Widget> photos(List<int> indexes) {
    final pages = List.generate(
        3,
        ((index) => ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset('assets/images/${indexes[index]}.jpg'),
            )));
    return pages;
  }
}
