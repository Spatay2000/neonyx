import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoItem extends StatefulWidget {
  final String videoUrl;
  final bool type;
  final bool auto;
  final int value;
  const VideoItem(
      {required this.videoUrl,
      required this.type,
      required this.auto,
      required this.value});

  @override
  _VideoItemState createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  late VideoPlayerController _videoController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();

    _videoController = VideoPlayerController.asset(widget.videoUrl);
    _videoController.setVolume(widget.value.toDouble());
    _chewieController = ChewieController(
      videoPlayerController: _videoController,

      aspectRatio: 1,
      autoInitialize: false,
      showControls: widget.type,
      autoPlay: widget.auto, // Set to true for auto-play
      looping: false, // Set to true for loop
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (MediaQuery.of(context).size.width) / 8 * 8,
      child: Chewie(
        controller: _chewieController,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    // IMPORTANT to dispose of all the used resources
    _videoController.dispose();
    _chewieController.dispose();
    _chewieController.pause();
  }
}
