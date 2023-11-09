import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PhotoGallery extends StatelessWidget {
  final List<String> imgList;
  final EdgeInsetsGeometry margin;

  const PhotoGallery({
    super.key,
    required this.imgList,
    this.margin = const EdgeInsets.symmetric(horizontal: 5.0),
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: imgList.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        return Container(
          margin: margin,
          child: Image.asset(imgList[itemIndex], fit: BoxFit.cover),
        );
      },
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: false,
        viewportFraction: 0.3, // Adjust as needed
        aspectRatio: 2.0,
        autoPlayInterval: const Duration(seconds: 5), // Slower movement
        autoPlayAnimationDuration:
            const Duration(milliseconds: 5000), // Smooth transition
        autoPlayCurve: Curves.linear, // Steady and linear animation
        enableInfiniteScroll: true, // Enable infinite scroll
      ),
    );
  }
}
