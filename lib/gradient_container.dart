import 'package:flutter/material.dart';
import 'package:first_app_udemy/styled_text.dart';

class GradientContainer extends StatelessWidget {
  //use class keyword to create a class, greenword(name) is self define
  const GradientContainer({key}) : super(key: key);
  //initialize the class
  @override
  Widget build(context) {
    //return a widget
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          //漸變色
          colors: [
            Color.fromRGBO(63, 59, 59, 1),
            Color.fromRGBO(0, 0, 0, 0.486)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Center(
        child: StyledText(),
        ),
      );
  }
}
