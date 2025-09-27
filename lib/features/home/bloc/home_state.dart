import 'package:equatable/equatable.dart';
import 'package:harmoni/data/models/video_model.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoaded extends HomeState {
  final List<VideoModel> videos;
  const HomeLoaded(this.videos);
  @override
  List<Object?> get props => [videos];
}

class HomeError extends HomeState {
  final String message;
  const HomeError(this.message);
  @override
  List<Object?> get props => [message];
}