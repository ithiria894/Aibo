import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CircleCarousel extends StatelessWidget {
  final List<String> imgPaths; // List of local image paths
  final double size; // Size of each image
  final double gap; // Gap between images

  const CircleCarousel({super.key, 
    required this.imgPaths,
    this.size = 20,
    this.gap = 0,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
        viewportFraction: 1,
      ),
      items: imgPaths.map((path) => Padding(
        padding: EdgeInsets.all(gap),
        child: ClipOval(
          child: Image.asset(
            path,
            width: size,
            height: size,
            fit: BoxFit.cover,
          ),
        ),
      )).toList(),
    );
  }
}
