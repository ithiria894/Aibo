// model.dart
import 'package:flutter/material.dart';
class WormIndicatorModel {
  final int dotCount;
  final int currentIndex;
  final double dotSize;
  final Color activeDotColor;
  final Color inactiveDotColor;

  WormIndicatorModel({
    required this.dotCount,
    required this.currentIndex,
    this.dotSize = 12.0,
    this.activeDotColor = Colors.blue,
    this.inactiveDotColor = Colors.grey,
  });
}
