import 'package:flutter/material.dart';
import 'carousel_with_indicator.dart'; // Ensure this custom widget is correctly implemented
import 'package:carousel_slider/carousel_slider.dart';
import 'title.dart'; // Ensure this custom widget is correctly implemented
import 'photo_gallery.dart'; // Ensure this custom widget is correctly implemented
import 'plate.dart'; // Ensure this custom widget is correctly implemented
import 'complex_plate.dart'; // Ensure this custom widget is correctly implemented
import 'carousel_of_plates.dart'; // Ensure this custom widget is correctly implemented
import 'circle_carousel.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.black, // Set background color to black
      appBar: AppBar(
        title: const Text('Aibo'),
      ),
      body: SingleChildScrollView(
        // Make the screen scrollable
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselWithIndicator(
              imgList: const [
                'lib/banners/Rectangle 3.png',
                'lib/banners/Rectangle 4.png',
                'lib/banners/Rectangle 5.png',
                'lib/banners/Rectangle 6.png',
              ],
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                height: 200,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 400),
              ),
              itemMargin: const EdgeInsets.all(0.0),
            ),
            const SizedBox(height: 20),
            const TitleWidget(
              titleText: '熱 門 遊 戲',
              numberText: '01',
            ),
            const SizedBox(height: 20),
            const PhotoGallery(
              imgList: [
                'lib/banners/Rectangle 3.png',
                'lib/banners/Rectangle 4.png',
                'lib/banners/Rectangle 5.png',
                'lib/banners/Rectangle 3.png',
                'lib/banners/Rectangle 4.png',
                'lib/banners/Rectangle 5.png',
              ],
              margin: EdgeInsets.all(8.0),
            ),
            const SizedBox(height: 20),
            const TitleWidget(
              titleText: '活 動 推 介',
              numberText: '02',
            ),
            const SizedBox(height: 20),
            CarouselOfPlates(
              plates: [
                Plate(
                    imageAssetPath: 'lib/banners/Rectangle 3.png',
                    displayText: 'Plate 1'),
                Plate(
                    imageAssetPath: 'lib/banners/Rectangle 4.png',
                    displayText: 'Plate 2'),
                Plate(
                    imageAssetPath: 'lib/banners/Rectangle 5.png',
                    displayText: 'Plate 3'),
              ],
            ),
            const SizedBox(height: 20),
            const TitleWidget(
              titleText: '人 氣 拍 檔',
              numberText: '03',
            ),
            const SizedBox(height: 20),
            CarouselOfPlates(
              plates: [
                ComplexPlate(
                    imageAssetPath: 'lib/banners/Rectangle 3.png',
                    displayText: 'Plate 1'),
                ComplexPlate(
                    imageAssetPath: 'lib/banners/Rectangle 4.png',
                    displayText: 'Plate 2'),
                ComplexPlate(
                    imageAssetPath: 'lib/banners/Rectangle 5.png',
                    displayText: 'Plate 3'),
              ],
            ),
            // CircleCarousel(
            //   imgPaths: [
            //     'lib/banners/Rectangle 3.png',
            //     'lib/banners/Rectangle 4.png',
            //     // Add more image URLs here
            //   ],
            //   size: 10.0, // Optional, size of each image
            //   gap: 0.0, // Optional, gap between images
            // ),

          ],
        ),
      ),
    ),
  ));
}
