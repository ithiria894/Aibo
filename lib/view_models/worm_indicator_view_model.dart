// worm_indicator_view_model.dart
import 'package:flutter/material.dart';
import '../models/worm_indicator_model.dart';

class WormIndicatorViewModel {
  late WormIndicatorModel _model;

  WormIndicatorViewModel(WormIndicatorModel model) : _model = model;

  int get dotCount => _model.dotCount;

  int get currentIndex => _model.currentIndex;

  double get dotSize => _model.dotSize;

  Color get activeDotColor => _model.activeDotColor;

  Color get inactiveDotColor => _model.inactiveDotColor;
}
