import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/screen.dart';

final appRouter = GoRouter(
  initialLocation: '/home',
  routes: [ 
    GoRoute(
      path: '/home',
      name: RoutesScreenApp.home.toString(),
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/buttons',
      name: RoutesScreenApp.buttons.toString(),
      builder: (context, state) => const ButtonsScreen(),
    ),
    GoRoute(
      path: '/cards',
      name: RoutesScreenApp.cards.toString(),
      builder: (context, state) => const CardsScreen(),
    ),
    GoRoute(
      path: '/progress',
      name: RoutesScreenApp.progress.toString(),
      builder: (context, state) => const ProgressScreen(),
    ),
    GoRoute(
      path: '/snackbar',
      name: RoutesScreenApp.snackbar.toString(),
      builder: (context, state) => const SnackbarScreen(),
    ),
    GoRoute(
      path: '/animated',
      name: RoutesScreenApp.animated.toString(),
      builder: (context, state) => const AnimatedScreen(),
    ),
    GoRoute(
      path: '/tutorial',
      name: RoutesScreenApp.tutorial.toString(),
      builder: (context, state) => const TutorialScreen(),
    ),

  ]
);

enum RoutesScreenApp {
  home,
  cards,
  buttons,
  animated,
  progress,
  snackbar,
  tutorial,
  uiControls,
  infiniteScroll,
}