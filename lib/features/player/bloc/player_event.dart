abstract class PlayerEvent {}

class LoadVideoEvent extends PlayerEvent {
  final String videoId;
  LoadVideoEvent(this.videoId);
}

class PlayNextEvent extends PlayerEvent {}