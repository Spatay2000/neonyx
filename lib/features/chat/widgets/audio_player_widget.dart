import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:neonyx/features/common/neo_colors.dart';

class AudioPlayerWidget extends StatefulWidget {
  final String filepath;
  final bool isChatPartner;

  const AudioPlayerWidget({
    super.key,
    required this.filepath,
    required this.isChatPartner,
  });

  @override
  State<AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  final player = AudioPlayer();
  Duration? duration;

  @override
  void initState() {
    super.initState();
    player.setFilePath(widget.filepath).then((value) {
      setState(() {
        duration = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        // height: 60,
        width: MediaQuery.of(context).size.width - 50,
        constraints: const BoxConstraints(minWidth: 0.0),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: widget.isChatPartner == false
              ? NeoColors.black
              : NeoColors.primaryColor.withOpacity(.1),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: Radius.circular(
              widget.isChatPartner != false ? 4 : 16,
            ),
            bottomRight: Radius.circular(
              widget.isChatPartner == false ? 4 : 16,
            ),
          ),
        ),
        child: Row(
          children: [
            StreamBuilder<PlayerState>(
              stream: player.playerStateStream,
              builder: (context, snapshot) {
                final playerState = snapshot.data;
                final processingState = playerState?.processingState;
                final playing = playerState?.playing;
                if (processingState == ProcessingState.loading ||
                    processingState == ProcessingState.buffering) {
                  return _buildPlayButton(
                      Icons.play_arrow_outlined, player.play);
                } else if (playing != true) {
                  return _buildPlayButton(
                      Icons.play_arrow_outlined, player.play);
                } else if (processingState != ProcessingState.completed) {
                  return _buildPlayButton(Icons.pause, player.pause);
                } else {
                  return GestureDetector(
                    child: Container(
                      height: 36,
                      width: 36,
                      decoration: const BoxDecoration(
                        color: NeoColors.soonColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.replay,
                        color: NeoColors.white,
                      ),
                    ),
                    onTap: () {
                      player.seek(Duration.zero);
                    },
                  );
                }
              },
            ),
            const SizedBox(width: 12),
            StreamBuilder<Duration>(
              stream: player.positionStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: LinearProgressIndicator(
                      value: snapshot.data!.inMilliseconds /
                          (duration?.inMilliseconds ?? 1),
                    ),
                  );
                } else {
                  return const Expanded(child: LinearProgressIndicator());
                }
              },
            ),
            const SizedBox(width: 10),
            StreamBuilder<Duration>(
              stream: player.positionStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    timer(snapshot.data! == Duration.zero
                        ? duration ?? Duration.zero
                        : snapshot.data!),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  String timer(Duration d) {
    var min = d.inMinutes < 10 ? "0${d.inMinutes}" : d.inMinutes.toString();
    var sec = d.inSeconds < 10 ? "0${d.inSeconds}" : d.inSeconds.toString();
    return "$min:$sec";
  }

  _buildPlayButton(IconData icon, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 36,
        width: 36,
        decoration: const BoxDecoration(
          color: NeoColors.soonColor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: NeoColors.white,
        ),
      ),
    );
  }
}
