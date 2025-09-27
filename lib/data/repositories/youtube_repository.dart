import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:harmoni/data/models/video_model.dart';

class YoutubeRepository {
  final YoutubeExplode _yt = YoutubeExplode();

  Future<List<VideoModel>> searchVideos(String query) async {
    try {
      final videos = <VideoModel>[];
      await for (final video in _yt.search.getVideos(query)) {
        videos.add(VideoModel.fromVideo(video));
        if (videos.length >= 20) break; // limit for demo
      }
      return videos;
    } catch (e) {
      throw Exception('Failed to fetch videos: $e');
    }
  }

  Future<List<VideoModel>> getRelatedVideos(String videoId) async {
    try {
      final related = <VideoModel>[];
      await for (final video in _yt.videos.getRelated(videoId)) {
        related.add(VideoModel.fromVideo(video));
        if (related.length >= 5) break;
      }
      return related;
    } catch (e) {
      return [];
    }
  }
}