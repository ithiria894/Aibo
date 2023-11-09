// my_carousel.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyCarousel extends StatefulWidget {
  final List<String> imgList;
  final double height;

  const MyCarousel({Key? key, required this.imgList, this.height = 300}) : super(key: key);

  @override
  _MyCarouselState createState() => _MyCarouselState();
}

class _MyCarouselState extends State<MyCarousel> {
  final PageController _pageController = PageController(viewportFraction: 1.0);
  Timer? _timer;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 2), (Timer timer) {
      if (_currentIndex < widget.imgList.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }

      _pageController.animateToPage(
        _currentIndex,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.height, // Use the height passed from main.dart
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.imgList.length,
            itemBuilder: (BuildContext context, int itemIndex) =>
              Image.asset(widget.imgList[itemIndex], fit: BoxFit.cover),
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        SizedBox(height: 20), // Space before the indicator
        SmoothPageIndicator(
          controller: _pageController,
          count: widget.imgList.length,
          effect: WormEffect(),
        ),
      ],
    );
  }
}
