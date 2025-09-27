// For future use (e.g., mapping layer)
class VideoEntity {
  final String id;
  final String title;
  final String author;
  final Duration duration;
  final String thumbnailUrl;

  VideoEntity({
    required this.id,
    required this.title,
    required this.author,
    required this.duration,
    required this.thumbnailUrl,
  });
}