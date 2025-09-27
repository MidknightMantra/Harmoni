import 'package:go_router/go_router.dart';
import 'package:harmoni/features/home/screens/home_screen.dart';
import 'package:harmoni/features/music/screens/music_screen.dart';
import 'package:harmoni/features/player/screens/video_player_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmoni/features/home/bloc/home_bloc.dart';
import 'package:harmoni/features/player/bloc/player_bloc.dart';
import 'package:harmoni/core/di/service_locator.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => HomeBloc(getIt())),
        ],
        child: const HomeScreen(),
      ),
    ),
    GoRoute(
      path: '/player/:id',
      builder: (context, state) => BlocProvider(
        create: (_) => PlayerBloc(getIt()),
        child: VideoPlayerScreen(videoId: state.pathParameters['id']!),
      ),
    ),
    GoRoute(
      path: '/music',
      builder: (context, state) => const MusicScreen(),
    ),
  ],
);