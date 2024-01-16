// custom_worm_indicator.dart
import 'package:flutter/material.dart';
import '../view_models/worm_indicator_view_model.dart';

class CustomWormIndicator extends StatelessWidget {
  final WormIndicatorViewModel viewModel;

  const CustomWormIndicator({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(viewModel.dotCount, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          height: viewModel.dotSize,
          width: viewModel.currentIndex == index ? viewModel.dotSize * 2 : viewModel.dotSize,
          decoration: BoxDecoration(
            color: viewModel.currentIndex == index ? viewModel.activeDotColor : viewModel.inactiveDotColor,
            borderRadius: BorderRadius.circular(viewModel.dotSize),
          ),
        );
      }),
    );
  }
}
