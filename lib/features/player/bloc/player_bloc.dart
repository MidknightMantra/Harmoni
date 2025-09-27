import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmoni/data/repositories/youtube_repository.dart';
import 'package:harmoni/features/player/bloc/player_event.dart';
import 'package:harmoni/features/player/bloc/player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  final YoutubeRepository _repo;

  PlayerBloc(this._repo) : super(PlayerInitial()) {
    on<LoadVideoEvent>((event, emit) async {
      emit(PlayerLoading());
      try {
        // In real app: fetch video metadata + related
        final related = await _repo.getRelatedVideos(event.videoId);
        final nextId = related.isNotEmpty ? related[0].id : '';
        emit(PlayerLoaded(
          videoId: event.videoId,
          title: 'Video ${event.videoId.substring(0, 6)}',
          nextVideoId: nextId,
        ));
      } catch (e) {
        emit(PlayerError(e.toString()));
      }
    });

    on<PlayNextEvent>((event, emit) {
      // Handle crossfade logic here (simplified)
      // In real app: trigger audio_service crossfade
    });
  }
}