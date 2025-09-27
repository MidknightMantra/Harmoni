import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';
import 'package:harmoni/features/player/bloc/player_bloc.dart';
import 'package:harmoni/features/player/bloc/player_event.dart';
import 'package:harmoni/features/player/bloc/player_state.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoId;

  const VideoPlayerScreen({super.key, required this.videoId});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    context.read<PlayerBloc>().add(LoadVideoEvent(widget.videoId));
    // In real app: use youtube_explode_dart to get stream URL
    _controller = VideoPlayerController.networkUrl(
      Uri.parse('https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'),
    )..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PlayerBloc, PlayerState>(
        builder: (context, state) {
          if (state is PlayerLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PlayerError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : const Center(child: Text('Loading player...'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _controller.value.isPlaying
            ? _controller.pause()
            : _controller.play(),
        child: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}