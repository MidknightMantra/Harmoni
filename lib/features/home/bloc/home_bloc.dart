import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmoni/data/models/video_model.dart';
import 'package:harmoni/domain/usecases/search_videos.dart';
import 'package:harmoni/features/home/bloc/home_event.dart';
import 'package:harmoni/features/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final SearchVideos _searchVideos;

  HomeBloc(this._searchVideos) : super(HomeInitial()) {
    on<SearchVideosEvent>((event, emit) async {
      if (event.query.isEmpty) return;
      emit(HomeLoading());
      try {
        final videos = await _searchVideos(event.query);
        emit(HomeLoaded(videos));
      } catch (e) {
        emit(HomeError(e.toString()));
      }
    });
  }
}