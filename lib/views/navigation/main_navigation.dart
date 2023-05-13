import 'package:newpoint/domain/factories/screen_factory.dart';
import 'package:flutter/material.dart';

abstract class MainNavigationRouteNames {
  static const loader = '/';
  static const auth = '/auth';
  static const main = '/main';
  static const post = '/main/post';
  static const register = '/register';
  static const login = '/login';
  static const movieTrailerWidget = '/main/movie_details/trailer';
}

class MainNavigation {
  static final _screenFactory = ScreenFactory();

  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.loader: (_) => _screenFactory.makeLoader(),
    MainNavigationRouteNames.auth: (_) => _screenFactory.makeAuth(),
    MainNavigationRouteNames.register: (_) => _screenFactory.makeRegister(),
    MainNavigationRouteNames.login: (_) => _screenFactory.makeLogin(),
    MainNavigationRouteNames.main: (_) => _screenFactory.makeMain(),
  };
  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouteNames.post:
        final arguments = settings.arguments;
        final postId = arguments is int ? arguments : 0;
        return MaterialPageRoute(
          builder: (_) => _screenFactory.makePost(postId),
        );
      default:
        const widget = Text('Navigation error!!!');
        return MaterialPageRoute(builder: (_) => widget);
    }
  }

  static void resetNavigation(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      MainNavigationRouteNames.loader,
          (route) => false,
    );
  }
}