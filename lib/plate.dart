//Plate.dart
import 'package:flutter/material.dart';
import 'dart:ui';
import 'DisplayableWidget.dart'; // Import the DisplayableWidget interface

class Plate extends DisplayableWidget {
  final String imageAssetPath;
  final String displayText;
  final double borderRadius; // Border radius property

  Plate({
    required this.imageAssetPath,
    required this.displayText,
    this.borderRadius = 10.0, // Default border radius
  });

  // Getter to return the height of the Plate
  double get height => 97.0; // Total height of the Plate widget

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 164,
      height: height, // Use the height defined above
      child: Stack(
        clipBehavior: Clip.none, // Allow overflow
        children: [
          // Image with border radius
          ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: Image.asset(
              imageAssetPath,
              width: 164,
              height: 97,
              fit: BoxFit.cover,
            ),
          ),
          // Positioned semi-transparent overlay
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(borderRadius),
                bottomRight: Radius.circular(borderRadius),
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  width: 164,
                  height: 40, // Height of the overlay
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5), // Semi-transparent white
                  ),
                  child: Center(
                    child: Text(
                      displayText,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Hiragino Maru Gothic Pro',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
