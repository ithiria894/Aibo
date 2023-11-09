// Purpose: Custom worm indicator for onboarding screen
//CustomWormIndicator.dart
// Usage: CustomWormIndicator(
//   dotCount: 4,
//   currentIndex: _current,
//   dotSize: 12.0,
//   activeDotColor: Colors.blue,
//   inactiveDotColor: Colors.grey,
// ),

import 'package:flutter/material.dart';

class CustomWormIndicator extends StatelessWidget {
  final int dotCount;
  final int currentIndex;
  final double dotSize;
  final Color activeDotColor;
  final Color inactiveDotColor;

  const CustomWormIndicator({
    Key? key,
    required this.dotCount,
    required this.currentIndex,
    this.dotSize = 12.0,
    this.activeDotColor = Colors.blue,
    this.inactiveDotColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(dotCount, (index) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 200),
          margin: EdgeInsets.symmetric(horizontal: 4.0),
          height: dotSize,
          width: currentIndex == index ? dotSize * 2 : dotSize,
          decoration: BoxDecoration(
            color: currentIndex == index ? activeDotColor : inactiveDotColor,
            borderRadius: BorderRadius.circular(dotSize),
          ),
        );
      }),
    );
  }
}
