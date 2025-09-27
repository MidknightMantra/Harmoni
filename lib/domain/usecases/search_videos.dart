import 'package:harmoni/data/models/video_model.dart';
import 'package:harmoni/data/repositories/youtube_repository.dart';

class SearchVideos {
  final YoutubeRepository repository;

  SearchVideos(this.repository);

  Future<List<VideoModel>> call(String query) async {
    if (query.isEmpty) throw Exception('Query cannot be empty');
    return await repository.searchVideos(query);
  }
}