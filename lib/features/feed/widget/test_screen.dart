import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:neonyx/features/feed/data/models/media_item.dart';

class TestScreen extends StatefulWidget {
  final MediaItem media;
  const TestScreen({super.key, required this.media});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            autoPlay: true,
            enlargeCenterPage: true,
            autoPlayInterval: const Duration(seconds: 3),
            aspectRatio: 12 / 11,
            onPageChanged: (index, _) {
              // setState(() {
              //   _currentIndex = index;
              // });
            },
          ),
          items: widget.media.image.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Image.asset(
                  i,
                  fit: BoxFit.cover,
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
