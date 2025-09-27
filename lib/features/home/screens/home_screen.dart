import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmoni/app_router.dart';
import 'package:harmoni/data/models/video_model.dart';
import 'package:harmoni/features/home/bloc/home_bloc.dart';
import 'package:harmoni/features/home/bloc/home_event.dart';
import 'package:harmoni/features/home/bloc/home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Harmoni')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Search YouTube...',
                suffixIcon: Icon(Icons.search),
              ),
              onSubmitted: (value) {
                context.read<HomeBloc>().add(SearchVideosEvent(value));
              },
            ),
            const SizedBox(height: 16),
            Expanded(
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is HomeLoaded) {
                    return _VideoList(videos: state.videos);
                  } else if (state is HomeError) {
                    return Center(child: Text('Error: ${state.message}'));
                  } else {
                    return const Center(child: Text('Search to begin'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _VideoList extends StatelessWidget {
  final List<VideoModel> videos;

  const _VideoList({required this.videos});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final video = videos[index];
        return ListTile(
          leading: Image.network(
            video.thumbnailUrl,
            width: 80,
            height: 60,
            fit: BoxFit.cover,
          ),
          title: Text(video.title),
          subtitle: Text(video.author),
          trailing: Text('${video.duration.inMinutes}:${(video.duration.inSeconds % 60).toString().padLeft(2, '0')}'),
          onTap: () {
            context.go('/player/${video.id}');
          },
        );
      },
    );
  }
}