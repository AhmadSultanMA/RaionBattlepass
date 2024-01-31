import 'package:flutter/material.dart';
import 'package:raionbattlepass/presentation/Splash/splash_screen.dart';

import 'package:raionbattlepass/route/routes.dart';
import 'package:go_router/go_router.dart';

class AppRouter extends StatefulWidget {
  const AppRouter({super.key});

  @override
  State<AppRouter> createState() => _AppRouterState();
}

class _AppRouterState extends State<AppRouter> {
  final _rootNavKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: GoRouter(
        initialLocation: Routes.SPLASH_SCREEN,
        navigatorKey: _rootNavKey,
        routes: [
          GoRoute(
            parentNavigatorKey: _rootNavKey,
            path: Routes.SPLASH_SCREEN,
            builder: (context, _) => const SplashScreen(),
          ),
        ],
      ),
    );
  }
}
