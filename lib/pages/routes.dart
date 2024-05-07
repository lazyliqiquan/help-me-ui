import 'package:fluent_ui/fluent_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:help_me_ui/pages/home/home.dart';

class WebRouter {
  GoRouter get goRouter => _router;
  final GoRouter _router = GoRouter(routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const Home(),
    ),
  ]);
}
