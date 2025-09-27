import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class VideoModel {
  final String id;
  final String title;
  final String author;
  final Duration duration;
  final String thumbnailUrl;

  VideoModel.fromVideo(Video video)
      : id = video.id.value,
        title = video.title,
        author = video.author,
        duration = video.duration,
        thumbnailUrl = video.thumbnails.highResUrl;

  @override
  String toString() =>
      'VideoModel(id: $id, title: $title, author: $author, duration: $duration)';
}