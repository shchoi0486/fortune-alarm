import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoBackgroundWidget extends StatefulWidget {
  final String videoPath;
  final bool isAsset;
  final bool loop;
  final bool mute;
  final bool play;
  final Duration? loopDuration;

  const VideoBackgroundWidget({
    super.key,
    required this.videoPath,
    this.isAsset = true,
    this.loop = true,
    this.mute = true,
    this.play = true,
    this.loopDuration,
  });

  @override
  State<VideoBackgroundWidget> createState() => _VideoBackgroundWidgetState();
}

class _VideoBackgroundWidgetState extends State<VideoBackgroundWidget> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;
  bool _isInitializing = false;

  @override
  void initState() {
    super.initState();
    _initializeController();
  }

  @override
  void didUpdateWidget(VideoBackgroundWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.videoPath != widget.videoPath ||
        oldWidget.isAsset != widget.isAsset ||
        oldWidget.play != widget.play ||
        oldWidget.loop != widget.loop ||
        oldWidget.mute != widget.mute ||
        oldWidget.loopDuration != widget.loopDuration) {
      _controller.dispose();
      _initializeController();
    }
  }

  void _initializeController() {
    if (_isInitializing) return;
    _isInitializing = true;
    _isInitialized = false;
    if (mounted) setState(() {});

    if (widget.isAsset) {
      _controller = VideoPlayerController.asset(
        widget.videoPath,
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
      );
    } else {
      _controller = VideoPlayerController.file(
        File(widget.videoPath),
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
      );
    }

    _controller.initialize().then((_) {
      if (mounted) {
        setState(() {
          _isInitialized = true;
        });
        _controller.setLooping(widget.loopDuration == null ? widget.loop : false);
        if (widget.mute) _controller.setVolume(0);
        _controller.seekTo(Duration.zero).then((_) {
          if (!mounted) return;
          if (widget.play) {
            _controller.play();
          } else {
            _controller.pause();
          }
        });
      }
      _isInitializing = false;
    });
    _controller.addListener(_handleLoopDuration);
  }

  void _handleLoopDuration() {
    final loopDuration = widget.loopDuration;
    if (!_isInitialized || !widget.play || loopDuration == null) return;
    final value = _controller.value;
    if (!value.isInitialized) return;
    final pos = value.position;
    if (pos >= loopDuration) {
      _controller.seekTo(Duration.zero);
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_handleLoopDuration);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return SizedBox.expand(
      child: FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          width: _controller.value.size.width,
          height: _controller.value.size.height,
          child: VideoPlayer(_controller),
        ),
      ),
    );
  }
}
