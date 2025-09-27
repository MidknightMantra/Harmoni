import 'package:flutter/material.dart';
import 'package:harmoni/app_router.dart';
import 'package:harmoni/core/di/service_locator.dart';
import 'package:harmoni/core/utils/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const HarmoniApp());
}

class HarmoniApp extends StatelessWidget {
  const HarmoniApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Harmoni',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: appRouter,
    );
  }
}