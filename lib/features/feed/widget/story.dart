import 'dart:ui';

import 'package:cube_transition_plus/cube_transition_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neonyx/features/common/neo_input_field.dart';

import '../../../domain/entity/feed_entity.dart';
import '../../common/neo_colors.dart';

class StoryWidget extends StatefulWidget {
  final List<FeedEntity> feedEntity;
  const StoryWidget({Key? key, required this.feedEntity}) : super(key: key);

  @override
  State<StoryWidget> createState() => _StoryWidgetState();
}

class _StoryWidgetState extends State<StoryWidget>
    with SingleTickerProviderStateMixin {
  final FocusNode _textFieldFocus = FocusNode();

  List<Story> stories = [];
  PageController __controllerPage = PageController();
  static dynamic currentPageValue = 0.0;
  PageController _pageController = PageController();
  late AnimationController _animController;
  int _currentIndex = 0;
  int length = 2;
  bool focus = false;
  int after = 1;
  TextEditingController sendController = TextEditingController();

  @override
  void initState() {
    super.initState();

    stories.add(Story(
        url: 'assets/png/story.png',
        duration: const Duration(seconds: 8),
        avaImage: widget.feedEntity.first.avatar,
        username: widget.feedEntity.first.storyImage));
    stories.add(Story(
        url: 'assets/png/story.png',
        duration: const Duration(seconds: 8),
        avaImage: widget.feedEntity.first.avatar,
        username: widget.feedEntity.first.storyImage));

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
          } else if (length == 2) {
            __controllerPage.animateToPage(
              1,
              duration: const Duration(
                  milliseconds: 500), // Продолжительность анимации
              curve: Curves.easeInOut, // Кривая анимации
            );
            _loadStory(story: stories[_currentIndex]);
          } else {
            Navigator.pop(context);
            _animController.dispose();
          }
        });
      }
    });
    __controllerPage.addListener(() {
      setState(() {
        currentPageValue = __controllerPage.page;
      });
    });
    _textFieldFocus.addListener(() {
      if (_textFieldFocus.hasFocus) {
        _animController.stop();
        focus = true;
        setState(() {});
      } else {
        _animController.forward();
        focus = false;
        setState(() {});
      }
    });
  }

  checkFocus() {}

  @override
  void dispose() {
    _pageController.dispose();
    _animController.dispose();
    _textFieldFocus.dispose();
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
                  focusNode: _textFieldFocus,
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
      body: CubePageView.builder(
        controller: __controllerPage,
        itemCount: length,
        itemBuilder: (context, positon, notifier) {
          final transform = Matrix4.identity();
          final t = (positon - notifier).abs();
          final scale = lerpDouble(2.5, 0, t);
          transform.scale(scale, scale);
          return CubeWidget(
            index: positon,
            pageNotifier: notifier,
            child: GestureDetector(
              onVerticalDragUpdate: (details) {
                if (details.delta.dy < 0) {
                  FocusScope.of(context).requestFocus(_textFieldFocus);
                } else if (details.delta.dy > 0) {
                  FocusScope.of(context).unfocus();
                }
              },
              onLongPress: () => _animController.stop(),
              onLongPressEnd: (details) => _animController.forward(),
              onTapDown: (details) {
                if (focus == false) {
                  _onTapDown(details, story);
                }
              },
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
                ],
              ),
            ),
          );
        },
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

  void _loadNextStory() {
    if (_currentIndex + 1 < stories.length) {
      setState(() {
        _currentIndex += 1;
      });
      _loadStory(story: stories[_currentIndex]);
    } else {}
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

// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:neonyx/domain/entity/feed_entity.dart';
// import 'package:story/story.dart';

// import '../../common/neo_input_field.dart';

// class StoryWidget extends StatefulWidget {
//   final List<FeedEntity> feedEntity;
//   const StoryWidget({super.key, required this.feedEntity});

//   @override
//   State<StoryWidget> createState() => _StoryWidgetState();
// }

// class _StoryWidgetState extends State<StoryWidget> {
//   ValueNotifier<IndicatorAnimationCommand>? indicatorAnimationController;
//   TextEditingController sendController = TextEditingController();
//   StreamSubscription<bool>? keyboardSubscription;
//   FocusNode textFieldFocusNode = FocusNode();

//   keyboradOpen() async {
//     if (MediaQuery.of(context).viewInsets.bottom == 0) {
//       setState(() {
//         indicatorAnimationController!.value = IndicatorAnimationCommand.pause;
//       });
//     }
//     // var keyboardVisibilityController = KeyboardVisibilityController();
//     // setState(() {
//     //   keyboardSubscription =
//     //       keyboardVisibilityController.onChange.listen((bool visible) {
//     //     if (visible == false) {
//     //       indicatorAnimationController =
//     //           ValueNotifier<IndicatorAnimationCommand>(
//     //               IndicatorAnimationCommand.resume);
//     //       print(visible);
//     //     } else {
//     //       indicatorAnimationController!.value = IndicatorAnimationCommand.pause;
//     //       print(visible);
//     //     }
//     //   });
//     // });
//   }

//   @override
//   void initState() {
//     super.initState();
//     indicatorAnimationController = ValueNotifier<IndicatorAnimationCommand>(
//         IndicatorAnimationCommand.resume);
//   }

//   @override
//   void dispose() {
//     indicatorAnimationController!.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onVerticalDragEnd: (details) {
//         if (details.primaryVelocity! > 0) {
//           Navigator.pop(context);
//         } else {
//           textFieldFocusNode.requestFocus();
//         }
//       },
//       onHorizontalDragEnd: (details) {
//         textFieldFocusNode.unfocus();
//       },
//       child: Scaffold(
//         resizeToAvoidBottomInset: true,
//         body: StoryPageView(
//           indicatorHeight: 2.h,
//           indicatorPadding: EdgeInsets.symmetric(vertical: 50, horizontal: 16),
//           itemBuilder: (context, pageIndex, storyIndex) {
//             final user = widget.feedEntity[pageIndex];
//             return SingleChildScrollView(
//               child: Stack(
//                 children: [
//                   StoryImage(
//                     key: ValueKey(user.storyImage),
//                     imageProvider: AssetImage(user.storyImage!),
//                     fit: BoxFit.cover,
//                     height: MediaQuery.of(context)
//                         .size
//                         .height, // Set the height to fullscreen
//                     width: MediaQuery.of(context).size.width,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 64, left: 8),
//                     child: Row(
//                       children: [
//                         Container(
//                           height: 32,
//                           width: 32,
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               image: AssetImage(user.avatar),
//                               fit: BoxFit.cover,
//                             ),
//                             shape: BoxShape.circle,
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 8,
//                         ),
//                         Text(
//                           user.username,
//                           style: const TextStyle(
//                             fontSize: 17,
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//           gestureItemBuilder: (context, pageIndex, storyIndex) {
//             return Stack(children: [
//               Align(
//                 alignment: Alignment.topRight,
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 55),
//                   child: IconButton(
//                     padding: EdgeInsets.zero,
//                     color: Colors.white,
//                     icon: const Icon(Icons.close),
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                   ),
//                 ),
//               ),
//               Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Container(
//                     margin: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
//                     padding: const EdgeInsets.only(right: 12),
//                     decoration: BoxDecoration(
//                         color: Colors.white.withOpacity(0.1),
//                         borderRadius: BorderRadius.circular(12)),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child: NeoInputField(
//                             focusNode: textFieldFocusNode,
//                             onChanged: (p0) => indicatorAnimationController!
//                                 .value = IndicatorAnimationCommand.pause,
//                             hint: 'Send message',
//                             hintStyle: GoogleFonts.notoSans(
//                                 color: Colors.white,
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w400),
//                             autofocus: false,
//                             maxLines: 3,
//                             isWithSearchIcon: false,
//                             type: NeoInputType.text,
//                             controller: sendController,
//                           ),
//                         ),
//                         Icon(
//                           Icons.more_horiz,
//                           color: const Color.fromRGBO(255, 255, 255, 1)
//                               .withOpacity(0.4),
//                         ),
//                       ],
//                     )),
//               ),
//             ]);
//           },
//           indicatorAnimationController: indicatorAnimationController,
//           initialStoryIndex: (pageIndex) {
//             if (pageIndex == 0) {
//               return 1;
//             }
//             return 0;
//           },
//           pageLength: 2,
//           storyLength: (int pageIndex) {
//             return 2;
//           },
//           onPageLimitReached: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//     );
//   }
// }

