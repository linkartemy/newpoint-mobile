import 'package:flutter/material.dart';
import 'package:newpoint/domain/factories/screen_factory.dart';

abstract class MainNavigationRouteNames {
  static const loader = '/';
  static const auth = '/auth';
  static const main = '/main';
  static const post = '/post';
  static const postCreator = '/post/creator';
  static const profile = '/profile';
  static const profileEditor = '/profile/editor';
  static const register = '/register';
  static const login = '/login';
  static const settings = '/settings';
}

class MainNavigation {
  static final _screenFactory = ScreenFactory();

  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.loader: (_) => _screenFactory.makeLoader(),
    MainNavigationRouteNames.auth: (_) => _screenFactory.makeAuth(),
    MainNavigationRouteNames.register: (_) => _screenFactory.makeRegister(),
    MainNavigationRouteNames.login: (_) => _screenFactory.makeLogin(),
    MainNavigationRouteNames.main: (_) => _screenFactory.makeMain(),
    MainNavigationRouteNames.postCreator: (_) =>
        _screenFactory.makePostCreator(),
    MainNavigationRouteNames.settings: (_) => _screenFactory.makeSettings(),
  };

  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouteNames.post:
        final arguments = settings.arguments;
        final postId = arguments is int ? arguments : 0;
        return MaterialPageRoute(
          builder: (_) => _screenFactory.makePost(postId),
        );
      case MainNavigationRouteNames.profile:
        final arguments = settings.arguments;
        final profileId = arguments is int ? arguments : 0;
        return MaterialPageRoute(
          builder: (_) => _screenFactory.makeProfile(profileId),
        );
      case MainNavigationRouteNames.profileEditor:
        final arguments = settings.arguments;
        final profileId = arguments is int ? arguments : 0;
        return MaterialPageRoute(
          builder: (_) => _screenFactory.makeProfileEditor(profileId),
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
