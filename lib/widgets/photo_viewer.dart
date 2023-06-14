import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../constants/color.dart';

class PhotoViewer extends StatefulWidget {
  const PhotoViewer(
      {super.key, required this.imageUrl, required this.initialPage});
  final int initialPage;
  final List<String> imageUrl;

  @override
  State<PhotoViewer> createState() => _PhotoViewerState();
}

class _PhotoViewerState extends State<PhotoViewer> {
  late PageController pageController;
  late PhotoViewScaleStateController _scaleStateController;
  // late PhotoViewController _controller;
  // late PhotoViewScaleStateController
  bool isInitial = true;

  @override
  void initState() {
    pageController = PageController(initialPage: widget.initialPage);
    _scaleStateController = PhotoViewScaleStateController();
    // _controller = PhotoViewController(initialScale: 1);
    // TODO: implement initState
    super.initState();
  }

  void zoom() {
    setState(() {
      // _scaleStateController.scaleState = _scaleStateController.isZooming
      //     ? PhotoViewScaleState.zoomedIn
      //     : PhotoViewScaleState.zoomedOut;
      // _scaleStateController.scaleState = PhotoViewScaleState.covering;
      _scaleStateController.scaleState = PhotoViewScaleState.zoomedOut;
    });
    print('yo');
  }

  @override
  void dispose() {
    // _controller.dispose();
    pageController.dispose();
    _scaleStateController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      // body: InteractiveViewer(
      //   child: Image.asset('assets/images/${widget.imageUrl[0]}'),

      //   // constrained: false,
      // )
      // body: ExtendedImageGesturePageView.builder(
      //   itemCount: widget.imageUrl.length,
      //   controller: ExtendedPageController(initialPage: widget.initialPage),
      //   itemBuilder: (context, index) {
      //     String item = 'assets/images/${widget.imageUrl[index]}';
      //     Widget image = ExtendedImage.asset(
      //       item,
      //       fit: BoxFit.contain,
      //       mode: ExtendedImageMode.gesture,
      //       enableSlideOutPage: true,
      //     );
      //     return image;
      //   },
      //   // children: [
      //   //   Image.asset('assets/images/${widget.imageUrl[0]}'),
      //   //   Image.asset('assets/images/${widget.imageUrl[1]}'),
      //   //   Image.asset('assets/images/${widget.imageUrl[2]}'),
      //   // ],
      // ),
      // body: PhotoView(
      //   imageProvider:
      //       AssetImage('assets/images/${widget.imageUrl[widget.initialPage]}'),
      //   scaleStateCycle: otherScaleState,
      //   initialScale: PhotoViewComputedScale.contained * 1,
      //   minScale: PhotoViewComputedScale.contained * 0.9,
      //   maxScale: PhotoViewComputedScale.covered * 2,
      // ),
      body: PhotoViewGallery.builder(
        // scrollPhysics: const BouncingScrollPhysics(),
        // allowImplicitScrolling: true,
        // gaplessPlayback: true,
        builder: (BuildContext context, int index) {
          return PhotoViewGalleryPageOptions(
            imageProvider:
                AssetImage('assets/images/${widget.imageUrl[index]}'),
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
        itemCount: widget.imageUrl.length,
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

  PhotoViewScaleState myScaleStateCycle(PhotoViewScaleState actual) {
    print('another one');
    switch (actual) {
      case PhotoViewScaleState.zoomedIn:
      case PhotoViewScaleState.zoomedOut:
      case PhotoViewScaleState.covering:
        return PhotoViewScaleState.initial;
      case PhotoViewScaleState.initial:
      case PhotoViewScaleState.originalSize:
      default:
        return PhotoViewScaleState.covering;
    }
  }

  PhotoViewScaleState otherScaleState(PhotoViewScaleState actual) {
    print('here');
    print(actual);

    if (actual == PhotoViewScaleState.covering) {
      return PhotoViewScaleState.initial;
    }
    return PhotoViewScaleState.covering;
  }

  PhotoViewScaleState customScaleState(PhotoViewScaleState actual) {
    print('actual--');
    print(actual);
    switch (actual) {
      case PhotoViewScaleState.initial:
        return PhotoViewScaleState.covering;
      case PhotoViewScaleState.covering:
        return PhotoViewScaleState.originalSize;
      case PhotoViewScaleState.originalSize:
        return PhotoViewScaleState.initial;
      default:
        return PhotoViewScaleState.initial;
    }
  }
}
