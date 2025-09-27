import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:harmoni/data/models/video_model.dart';
import 'package:harmoni/domain/usecases/search_videos.dart';
import 'package:harmoni/features/home/bloc/home_bloc.dart';
import 'package:harmoni/features/home/bloc/home_event.dart';
import 'package:harmoni/features/home/bloc/home_state.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([SearchVideos])
void main() {
  late HomeBloc homeBloc;
  late MockSearchVideos mockSearchVideos;

  setUp(() {
    mockSearchVideos = MockSearchVideos();
    homeBloc = HomeBloc(mockSearchVideos);
  });

  blocTest<HomeBloc, HomeState>(
    'emits [HomeLoading, HomeLoaded] when SearchVideosEvent is added',
    build: () => homeBloc,
    act: (bloc) => bloc.add(SearchVideosEvent('test')),
    expect: () => [
      HomeLoading(),
      HomeLoaded([VideoModel.fromVideo(Video(
        id: VideoId('dQw4w9WgXcQ'),
        title: 'Test',
        author: 'Test Author',
        duration: Duration(minutes: 3),
        thumbnails: ThumbnailSet(
          defaultThumbnail: Thumbnail(url: 'https://i.ytimg.com/vi/dQw4w9WgXcQ/default.jpg'),
          mediumRes: Thumbnail(url: 'https://i.ytimg.com/vi/dQw4w9WgXcQ/mqdefault.jpg'),
          highRes: Thumbnail(url: 'https://i.ytimg.com/vi/dQw4w9WgXcQ/hqdefault.jpg'),
        ),
      ))]),
    ],
    setUp: () {
      when(mockSearchVideos('test')).thenAnswer((_) async => [
            VideoModel.fromVideo(Video(
              id: VideoId('dQw4w9WgXcQ'),
              title: 'Test',
              author: 'Test Author',
              duration: Duration(minutes: 3),
              thumbnails: ThumbnailSet(
                defaultThumbnail: Thumbnail(url: 'https://i.ytimg.com/vi/dQw4w9WgXcQ/default.jpg'),
                mediumRes: Thumbnail(url: 'https://i.ytimg.com/vi/dQw4w9WgXcQ/mqdefault.jpg'),
                highRes: Thumbnail(url: 'https://i.ytimg.com/vi/dQw4w9WgXcQ/hqdefault.jpg'),
              ),
            ))
          ]);
    },
  );
}