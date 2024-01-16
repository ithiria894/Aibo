// carousel_with_indicator.dart
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../custom_worm_indicator.dart';
import '../view_models/carousel_with_indicator_view_model.dart';

class CarouselWithIndicator extends StatefulWidget {
  final CarouselWithIndicatorViewModel viewModel;
  final CarouselOptions options;
  final double indicatorSize;
  final Color activeIndicatorColor;
  final Color inactiveIndicatorColor;
  final EdgeInsetsGeometry itemMargin;

  const CarouselWithIndicator({
    Key? key,
    required this.viewModel,
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
          items: widget.viewModel.imgList
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
            dotCount: widget.viewModel.imgList.length,
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
