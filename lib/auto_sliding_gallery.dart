import 'package:flutter/material.dart';
import 'dart:async';

class AutoSlidingGallery extends StatefulWidget {
  final List<String> imageUrls; // List of image URLs
  const AutoSlidingGallery({super.key, required this.imageUrls});

  @override
  _AutoSlidingGalleryState createState() => _AutoSlidingGalleryState();
}

class _AutoSlidingGalleryState extends State<AutoSlidingGallery> {
  late PageController _pageController;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);

    // Set up the auto-slide using a timer
    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (_pageController.hasClients) {
        int nextPage = (_pageController.page?.round() ?? 0) + 1;
        if (nextPage == widget.imageUrls.length) {
          nextPage = 0; // Go back to first image
        }
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 400), //控制从一张图片滑动到下一张图片所需的时间。
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // Set the height of the gallery
      child: PageView.builder(
        controller: _pageController,
        itemCount: widget.imageUrls.length,
        itemBuilder: (context, index) {
          return Image.asset(widget.imageUrls[index], fit: BoxFit.cover);
        },
      ),
    );
  }
}
