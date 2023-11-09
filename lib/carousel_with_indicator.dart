//custome carousel with indicator
//usage:
// CarouselWithIndicator(
//   imgList: [
//     'lib/banners/Rectangle 3.png',
//     'lib/banners/Rectangle 4.png',
//     'lib/banners/Rectangle 5.png',
//     'lib/banners/Rectangle 6.png',
//   ],
//   options: CarouselOptions(
//     autoPlay: true,
//     aspectRatio: 2.0,
//     viewportFraction: 1.0,
//     enlargeCenterPage: false,
//     height: 200,
//   ),
//   itemMargin: const EdgeInsets.all(0.0), // Custom margin for carousel items
//   // Other custom parameters as needed such as
//   // indicatorSize, activeIndicatorColor, inactiveIndicatorColor, etc.
// ),
//

//carou
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'custom_worm_indicator.dart';

class CarouselWithIndicator extends StatefulWidget {
  final List<String> imgList;
  final CarouselOptions options;
  final double indicatorSize;
  final Color activeIndicatorColor;
  final Color inactiveIndicatorColor;
  final EdgeInsetsGeometry itemMargin;

  const CarouselWithIndicator({
    Key? key,
    required this.imgList,
    required this.options,
    this.indicatorSize = 12.0,
    this.activeIndicatorColor = Colors.blue,
    this.inactiveIndicatorColor = Colors.grey,
    this.itemMargin = const EdgeInsets.symmetric(horizontal: 5.0),
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  final CarouselController _carouselController = CarouselController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          items: widget.imgList
              .map((item) => Container(
                    margin: widget.itemMargin,
                    child: Image.asset(item,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width),
                  ))
              .toList(),
          options: widget.options.copyWith(onPageChanged: (index, reason) {
            setState(() {
              _current = index;
            });
          }),
          carouselController: _carouselController,
        ),
        Positioned(
          bottom:
              10, // Adjust this value to change the position of the indicator
          child: CustomWormIndicator(
            dotCount: widget.imgList.length,
            currentIndex: _current,
            dotSize: widget.indicatorSize,
            activeDotColor: widget.activeIndicatorColor,
            inactiveDotColor: widget.inactiveIndicatorColor,
          ),
        ),
      ],
    );
  }
}
