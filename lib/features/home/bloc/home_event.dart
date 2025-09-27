abstract class HomeEvent {}

class SearchVideosEvent extends HomeEvent {
  final String query;
  SearchVideosEvent(this.query);
}