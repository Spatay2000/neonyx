import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neonyx/features/common/neo_input_field.dart';

import '../../../domain/entity/feed_entity.dart';
import '../../common/neo_colors.dart';

class StoryWidget extends StatefulWidget {
  final FeedEntity feedEntity;
  const StoryWidget({Key? key, required this.feedEntity}) : super(key: key);

  @override
  State<StoryWidget> createState() => _StoryWidgetState();
}

class _StoryWidgetState extends State<StoryWidget>
    with SingleTickerProviderStateMixin {
  final List<Story> stories = [];

  PageController _pageController = PageController();
  late AnimationController _animController;
  int _currentIndex = 0;
  TextEditingController sendController = TextEditingController();

  @override
  void initState() {
    super.initState();
    stories.add(Story(
        url: 'assets/png/story.png',
        duration: const Duration(seconds: 8),
        avaImage: widget.feedEntity.avatar,
        username: widget.feedEntity.username));
    stories.add(Story(
        url: 'assets/png/story.png',
        duration: const Duration(seconds: 8),
        avaImage: widget.feedEntity.avatar,
        username: widget.feedEntity.username));

    _pageController = PageController();
    _animController = AnimationController(vsync: this);

    final Story firstStory = stories.first;
    _loadStory(story: firstStory, animateToPage: false);

    _animController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animController.stop();
        _animController.reset();
        setState(() {
          if (_currentIndex + 1 < stories.length) {
            _currentIndex += 1;
            _loadStory(story: stories[_currentIndex]);
          } else {
            Navigator.pop(context);
            // _animController.dispose();
            log("fkjhf");
            // Navigator.pushNamedAndRemoveUntil(
            //   context,
            //   Routes.home,
            //   (route) => false,
            // );
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Story story = stories[_currentIndex];
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFFD9DEE8),
      floatingActionButton: Container(
          margin: EdgeInsets.symmetric(horizontal: 12, vertical: 2.h),
          padding: const EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: NeoInputField(
                  hint: 'Send message',
                  hintStyle: GoogleFonts.notoSans(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                  autofocus: false,
                  maxLines: 3,
                  isWithSearchIcon: false,
                  type: NeoInputType.text,
                  controller: sendController,
                ),
              ),
              Icon(
                Icons.more_horiz,
                color: const Color.fromRGBO(255, 255, 255, 1).withOpacity(0.4),
              ),
            ],
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: GestureDetector(
        onTapDown: (details) => _onTapDown(details, story),
        child: Stack(
          children: <Widget>[
            PageView.builder(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: stories.length,
              itemBuilder: (context, i) {
                final Story story = stories[i];
                return Image.asset(
                  story.url,
                  fit: BoxFit.cover,
                );
              },
            ),
            Positioned(
              top: 50.0,
              left: 16.0,
              right: 16.0,
              bottom: 8.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: stories
                        .asMap()
                        .map((i, e) {
                          return MapEntry(
                            i,
                            AnimatedBar(
                              animController: _animController,
                              position: i,
                              currentIndex: _currentIndex,
                            ),
                          );
                        })
                        .values
                        .toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ClipOval(
                              child: Container(
                                color: NeoColors.grayColor,
                                child: Image.asset(
                                  story.avaImage.toString(),
                                  width: 32.w,
                                  height: 32.h,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              story.username.toString(),
                              style: GoogleFonts.roboto(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              '4 h',
                              style: GoogleFonts.roboto(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white.withOpacity(0.4)),
                            ),
                          ],
                        ),
                        InkWell(
                            onTap: () => Navigator.pop(context),
                            child: const Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 30,
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Positioned(
            //     bottom: 20.0,
            //     left: 16.0,
            //     right: 16.0,
            //     child: Container(
            //         padding: EdgeInsets.only(right: 12),
            //         decoration: BoxDecoration(
            //             color: Colors.white.withOpacity(0.1),
            //             borderRadius: BorderRadius.circular(12)),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             Expanded(
            //               child: NeoInputField(
            //                 hint: 'Send message',
            //                 hintStyle: GoogleFonts.notoSans(
            //                     color: Colors.white,
            //                     fontSize: 12,
            //                     fontWeight: FontWeight.w400),
            //                 autofocus: false,
            //                 maxLines: 3,
            //                 isWithSearchIcon: false,
            //                 type: NeoInputType.text,
            //                 controller: sendController,
            //               ),
            //             ),
            //             Icon(
            //               Icons.more_horiz,
            //               color: const Color.fromRGBO(255, 255, 255, 1)
            //                   .withOpacity(0.4),
            //             ),
            //           ],
            //         )))
          ],
        ),
      ),
    );
  }

  void _onTapDown(TapDownDetails details, Story story) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double dx = details.globalPosition.dx;
    if (dx < screenWidth / 3) {
      setState(() {
        if (_currentIndex - 1 >= 0) {
          _currentIndex -= 1;
          _loadStory(story: stories[_currentIndex]);
        }
      });
    } else if (dx > 2 * screenWidth / 3) {
      setState(() {
        if (_currentIndex + 1 < stories.length) {
          _currentIndex += 1;
          _loadStory(story: stories[_currentIndex]);
        } else {}
      });
    }
  }

  void _loadStory({required Story story, bool animateToPage = true}) {
    _animController.stop();
    _animController.reset();

    _animController.duration = story.duration;
    _animController.forward();

    if (animateToPage) {
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }
}

class AnimatedBar extends StatelessWidget {
  final AnimationController animController;
  final int position;
  final int currentIndex;

  const AnimatedBar({
    Key? key,
    required this.animController,
    required this.position,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1.5),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: <Widget>[
                _buildContainer(
                    double.infinity,
                    position < currentIndex
                        ? Colors.white
                        : Color.fromRGBO(255, 255, 255, 0.36)),
                position == currentIndex
                    ? AnimatedBuilder(
                        animation: animController,
                        builder: (context, child) {
                          return _buildContainer(
                            constraints.maxWidth * animController.value,
                            Colors.white,
                          );
                        },
                      )
                    : const SizedBox.shrink(),
              ],
            );
          },
        ),
      ),
    );
  }

  Container _buildContainer(double width, Color color) {
    return Container(
      height: 5.0,
      width: width,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: Colors.black.withOpacity(0.24),
          width: 0.8,
        ),
        borderRadius: BorderRadius.circular(3.0),
      ),
    );
  }
}

class Story {
  final String url;
  final Duration duration;
  final String? username;
  final String? avaImage;

  const Story(
      {required this.url,
      required this.duration,
      required this.avaImage,
      required this.username});
}
