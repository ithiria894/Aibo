import 'package:flutter/material.dart';
import 'dart:ui';
import 'DisplayableWidget.dart'; // Import the DisplayableWidget interface

class ComplexPlate extends DisplayableWidget {
  final String imageAssetPath;
  final String displayText;
  final double borderRadius; // Border radius property

  ComplexPlate({
    required this.imageAssetPath,
    required this.displayText,
    this.borderRadius = 10.0, // Default border radius
  });

  // Getter to return the height of the ComplexPlate
  double get height => 180.0; // Total height of the ComplexPlate widget

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 164,
      height: height,
      child: Stack(
        alignment: Alignment.center, // Center alignment for the stack
        children: [
          // Base container at the very bottom
          Container(
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          // Align and Padding to center the Column and add space around it
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(0.0), // Add padding around the Column
              child: Column(
                mainAxisSize: MainAxisSize.min, // Fit the content of the column
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image and overlay grouped together in a Stack
                  Stack(
                    alignment: Alignment.bottomCenter, // Align overlay to the bottom of the image
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(borderRadius),
                        child: Image.asset(
                          imageAssetPath,
                          width: 156,
                          height: 119,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: 156,
                        height: 21, // Height of the overlay
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.7), // Semi-transparent black overlay
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          displayText,
                          style: const TextStyle(
                            color: Colors.white, // White color for text for better visibility
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 8), // Spacer

                  // Row of three small containers
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center, // Center the row of containers
                    children: List.generate(
                      3,
                      (index) => Expanded(
                        child: Container(
                          height: 11.12,
                          margin: const EdgeInsets.symmetric(horizontal: 4.0), // Spacing between containers
                          decoration: ShapeDecoration(
                            color: const Color(0xFFECBEBE),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 8), // Spacer

                  // Row of 6 circle img
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center, // Center the row of containers
                    children: List.generate(
                      6,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3.0), // Adjust spacing
                        child: Container(
                          width: 20.0, // Adjusted width of the circle
                          height: 20.0, // Adjusted height of the circle
                          decoration: BoxDecoration(
                            shape: BoxShape.circle, // making the container circular
                            image: DecorationImage(
                              fit: BoxFit.cover, // ensures the image covers the circle
                              image: AssetImage('lib/banners/Rectangle 3.png'), // Updated asset path
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
