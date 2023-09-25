import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:neonyx/features/common/neo_colors.dart';
// import 'package:photo_manager/photo_manager.dart';
import 'package:record/record.dart';

class SendButton extends StatefulWidget {
  final TextEditingController controller;
  final void Function(String path) onStop;
  final void Function() sendMessageTap;
  final bool isSendMessageWithImage;

  const SendButton({
    super.key,
    required this.onStop,
    required this.controller,
    required this.sendMessageTap,
    required this.isSendMessageWithImage,
  });

  @override
  State<SendButton> createState() => _SendButtonState();
}

class _SendButtonState extends State<SendButton> {
  int _recordDuration = 0;
  Timer? _timer;
  final _audioRecorder = Record();
  StreamSubscription<RecordState>? _recordSub;
  RecordState _recordState = RecordState.stop;

  Future<void> _start() async {
    try {
      if (await _audioRecorder.hasPermission()) {
        await _audioRecorder.start();
        _recordDuration = 0;

        _startTimer();
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> _stop() async {
    _timer?.cancel();
    _recordDuration = 0;

    final path = await _audioRecorder.stop();

    widget.onStop(path!);
    log("PATH: $path");
  }

  @override
  void initState() {
    _recordSub = _audioRecorder.onStateChanged().listen((recordState) {
      setState(() => _recordState = recordState);
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _recordSub?.cancel();
    _audioRecorder.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: 36,
      decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Color(0xFFB7AF6B),
            Color(0xFF2F9197),
          ]),
          borderRadius: BorderRadius.circular(12)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(36, 36),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {
          if (widget.isSendMessageWithImage) {
            widget.sendMessageTap();
          } else {
            if (widget.controller.text.isNotEmpty) {
              widget.sendMessageTap();
            } else {
              (_recordState != RecordState.stop) ? _stop() : _start();
            }
          }
        },
        child: Row(
          children: [
            _buildSendButtonIcon(),
            // _recordState != RecordState.stop ? _buildTimer() : const SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget _buildSendButtonIcon() {
    late IconData icon;
    late Color color;

    if (_recordState != RecordState.stop) {
      icon = Icons.stop;
      color = Colors.red;
    } else if (widget.isSendMessageWithImage) {
      icon = CupertinoIcons.arrow_up;
      color = NeoColors.white;
    } else if (widget.controller.text.isNotEmpty &&
        !widget.isSendMessageWithImage) {
      setState(() {
        icon = CupertinoIcons.arrow_up;
      });
      color = Colors.white;
    } else {
      icon = Icons.mic;
      color = NeoColors.white;
    }

    return Icon(
      icon,
      color: color,
      size: 16,
    );
  }

  Widget _buildTimer() {
    final String minutes = _formatNumber(_recordDuration ~/ 60);
    final String seconds = _formatNumber(_recordDuration % 60);

    return Text(
      '$minutes : $seconds',
      style: const TextStyle(color: Colors.red),
    );
  }

  String _formatNumber(int number) {
    String numberStr = number.toString();
    if (number < 10) {
      numberStr = '0$numberStr';
    }

    return numberStr;
  }

  void _startTimer() {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() => _recordDuration++);
    });
  }
}
