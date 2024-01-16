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

class CustomWormIndicator extends StatelessWidget { //View
  final int dotCount;
  final int currentIndex;
  final double dotSize;
  final Color activeDotColor;
  final Color inactiveDotColor;

  const CustomWormIndicator({
    super.key,
    required this.dotCount,
    required this.currentIndex,
    this.dotSize = 12.0,
    this.activeDotColor = Colors.blue,
    this.inactiveDotColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(dotCount, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
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
