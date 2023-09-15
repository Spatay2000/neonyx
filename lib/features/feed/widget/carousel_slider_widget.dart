// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:neonyx/features/feed/data/models/media_item.dart';

class CarouselSliderWidget extends StatefulWidget {
  final MediaItem itemsPhoto;
  const CarouselSliderWidget({
    Key? key,
    required this.itemsPhoto,
  }) : super(key: key);

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  final CarouselController _controller = CarouselController();
  int _current = 0;
  bool scroll = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: _controller,
          options: CarouselOptions(
            viewportFraction: 1,
            autoPlay: scroll,
            enlargeCenterPage: true,
            autoPlayInterval: const Duration(seconds: 3),
            aspectRatio: 12 / 12,
            onPageChanged: (index, _) {
              setState(() {
                _current = index;
              });
            },
          ),
          items: widget.itemsPhoto.image.map((i) {
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
        SizedBox(
          height: 18.h,
        ),
        widget.itemsPhoto.image.length > 1
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.itemsPhoto.image.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 12.0.r,
                      height: 12.0.r,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? const Color.fromARGB(255, 24, 107, 112)
                                  : const Color(0xFF2F9096))
                              .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                    ),
                  );
                }).toList(),
              )
            : SizedBox(
                height: 12.r,
              )
      ],
    );
  }
}
