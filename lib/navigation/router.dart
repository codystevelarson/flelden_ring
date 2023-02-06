import 'package:flelden_ring/screens/error_screen.dart';
import 'package:flelden_ring/screens/main_menu_screen.dart';
import 'package:flelden_ring/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter eldenRouter = GoRouter(
  routes: [
    GoRoute(
      name: SplashScreen.name,
      path: SplashScreen.path,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      name: MainMenu.name,
      path: MainMenu.path,
      builder: (context, state) => const MainMenu(),
    ),
  ],
  errorBuilder: (context, state) => const ErrorScreen(),
);
