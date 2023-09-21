import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neonyx/features/feed/data/models/media_item.dart';
import 'package:neonyx/features/feed/posts_screen.dart';
import 'package:neonyx/features/feed/widget/video_item.dart';

class MediaWidget extends StatelessWidget {
  MediaWidget({
    super.key,
  });
  final List<MediaItem> _itemsPhoto = [
    MediaItem(
        ['assets/png/grid.png', 'assets/png/grid2.png', 'assets/png/grid3.png'],
        "Stephan Seeber"),
    MediaItem([
      'assets/png/grid3.png',
      'assets/png/grid.png',
      'assets/png/grid2.png',
    ], "Stephan Seeber"),
    MediaItem([
      'assets/png/grid2.png',
    ], "Stephan Seeber"),
    MediaItem([
      'assets/png/grid2.png',
      'assets/png/grid.png',
      'assets/png/grid3.png',
      'assets/png/grid2.png',
      'assets/png/grid3.png',
    ], "Stephan Seeber"),
    MediaItem(
        ['assets/png/grid.png', 'assets/png/grid2.png', 'assets/png/grid3.png'],
        "Stephan Seeber"),
  ];
  final List<MediaItem> _items = [
    MediaItem([
      'assets/mp4/insta.mp4',
    ], "Stephan Seeber"),
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        crossAxisCount: 3,
      ),
      itemCount: _items.length + _itemsPhoto.length,
      itemBuilder: (context, index) {
        if (index < _itemsPhoto.length) {
          return InkWell(
            onTap: () {
              _itemsPhoto[index].image.length == 1
                  ? null
                  : Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PostsScreen()),
                    );
            },
            child: Stack(
              children: [
                // VideoItem(
                //   videoUrl: _items[index].image.first,
                //   type: false,
                //   auto: true,
                // ),
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(_itemsPhoto[index].image.first),
                    ),
                  ),
                ),
                _itemsPhoto[index].image.length == 1
                    ? const SizedBox()
                    : Positioned(
                        left: 110,
                        top: 120,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/svg/more_images.svg'),
                            SizedBox(
                              width: 4.w,
                            ),
                            Text(
                              _itemsPhoto[index].image.length.toString(),
                              style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                height: 1.43,
                                letterSpacing: 0.14,
                              ),
                            )
                          ],
                        ))
              ],
            ),
          );
        } else {
          final int videoIndex = index - _itemsPhoto.length;
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PostsScreen()),
              );
            },
            child: Stack(
              children: [
                VideoItem(
                  videoUrl: _items[videoIndex].image.first,
                  type: false,
                  auto: true,
                  value: 0,
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
