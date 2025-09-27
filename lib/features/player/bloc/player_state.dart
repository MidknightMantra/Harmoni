import 'package:equatable/equatable.dart';

abstract class PlayerState extends Equatable {
  const PlayerState();
}

class PlayerInitial extends PlayerState {
  @override
  List<Object?> get props => [];
}

class PlayerLoading extends PlayerState {
  @override
  List<Object?> get props => [];
}

class PlayerLoaded extends PlayerState {
  final String videoId;
  final String title;
  final String nextVideoId; // for autoplay

  const PlayerLoaded({
    required this.videoId,
    required this.title,
    required this.nextVideoId,
  });

  @override
  List<Object?> get props => [videoId, title, nextVideoId];
}

class PlayerError extends PlayerState {
  final String message;
  const PlayerError(this.message);
  @override
  List<Object?> get props => [message];
}