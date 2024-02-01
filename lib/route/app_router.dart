import 'package:flutter/material.dart';
import 'package:raionbattlepass/presentation/Splash/splash_screen.dart';
import 'package:raionbattlepass/presentation/auth/screen/login_screen.dart';
import 'package:raionbattlepass/presentation/auth/screen/register_screen.dart';
import 'package:raionbattlepass/presentation/homepage/screen/create_note.dart';
import 'package:raionbattlepass/presentation/homepage/screen/edit_note.dart';
import 'package:raionbattlepass/presentation/homepage/screen/home_screen.dart';

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
          GoRoute(
            parentNavigatorKey: _rootNavKey,
            path: Routes.LOGIN_SCREEN,
            builder: (context, _) => LoginScreen(),
          ),
          GoRoute(
            parentNavigatorKey: _rootNavKey,
            path: Routes.REGISTER_SCREEN,
            builder: (context, _) => RegisterScreen(),
          ),
          GoRoute(
            parentNavigatorKey: _rootNavKey,
            path: Routes.HOMEPAGE_SCREEN,
            builder: (context, _) => HomePage(),
          ),
          GoRoute(
            parentNavigatorKey: _rootNavKey,
            path: Routes.CREATENOTE_SCREEN,
            builder: (context, _) => CreateNoteScreen(),
          ),
          GoRoute(
            parentNavigatorKey: _rootNavKey,
            path: Routes.EDITNOTE_SCREEN,
            builder: (context, _) => EditNoteScreen(),
          ),
        ],
      ),
    );
  }
}
