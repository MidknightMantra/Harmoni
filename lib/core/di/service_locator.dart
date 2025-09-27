import 'package:get_it/get_it.dart';
import 'package:harmoni/data/repositories/youtube_repository.dart';
import 'package:harmoni/domain/usecases/search_videos.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  final prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => prefs);
  getIt.registerLazySingleton(() => YoutubeRepository());
  getIt.registerFactory(() => SearchVideos(getIt()));
}