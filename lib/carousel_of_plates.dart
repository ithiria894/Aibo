import 'package:flutter/material.dart';
import 'DisplayableWidget.dart'; // Import the DisplayableWidget interface

class CarouselOfPlates extends StatelessWidget {
  final List<DisplayableWidget> plates; // Changed to List<DisplayableWidget>
  final double gap;

  const CarouselOfPlates({super.key, 
    required this.plates,
    this.gap = 10.0, // Default gap size
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate the tallest Plate's height
        double tallestPlateHeight = plates.fold(0.0, (prev, plate) {
          double plateHeight = plate.height; // Assuming `height` is a property of `Plate`
          return (plateHeight > prev) ? plateHeight : prev;
        });

        return SizedBox(
          height: tallestPlateHeight, // Height adjusts to the tallest Plate
          child: ListView.separated(
            padding: EdgeInsets.only(left: 0.0, right: gap), // Adjust padding for first Plate
            scrollDirection: Axis.horizontal, // Make the list scroll horizontally
            itemCount: plates.length,
            itemBuilder: (context, index) {
              return Container(
                child: plates[index], // Render each plate widget from the list
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: gap), // Use gap size for space between items
          ),
        );
      },
    );
  }
}
