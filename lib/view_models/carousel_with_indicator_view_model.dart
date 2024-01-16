// carousel_with_indicator_view_model.dart
import '../models/carousel_with_indicator_model.dart';

class CarouselWithIndicatorViewModel {
  final CarouselWithIndicatorModel _model;

  CarouselWithIndicatorViewModel({required CarouselWithIndicatorModel model}) : _model = model;

  List<String> get imgList => _model.imgList;
}
