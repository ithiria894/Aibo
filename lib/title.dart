import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String titleText;
  final String numberText;
  final Color backgroundColor;
  final Color textColor;
  final Color numberColor;
  final double titleFontSize;
  final double numberFontSize;

  const TitleWidget({
    super.key,
    required this.titleText,
    required this.numberText,
    this.backgroundColor = const Color(0xFF373535),
    this.textColor = const Color(0xFF00CCCC),
    this.numberColor = const Color(0xFF373535),
    this.titleFontSize = 20,
    this.numberFontSize = 15,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8), // Padding on both sides
      decoration: ShapeDecoration(
        color: backgroundColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(28),
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(28),
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildRotatedBoxWithNumber(),
          const SizedBox(width: 8), // Space between diamond and title text
          Text(
            titleText,
            style: TextStyle(
              color: textColor,
              fontSize: titleFontSize,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRotatedBoxWithNumber() {
    const double diamondSize = 20.0; // Fixed size for the diamond
    return Stack(
      alignment: Alignment.center,
      children: [
        Transform.rotate(
          angle: 0.76,
          child: Container(
            width: diamondSize,
            height: diamondSize,
            decoration: BoxDecoration(color: textColor),
          ),
        ),
        Text(
          numberText,
          style: TextStyle(
            color: numberColor,
            fontSize: numberFontSize,
            fontFamily: 'Bayon',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
