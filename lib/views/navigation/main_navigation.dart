import 'package:flutter/material.dart';
import 'package:newpoint/domain/factories/screen_factory.dart';

abstract class MainNavigationRouteNames {
  static const loader = '/';
  static const auth = '/auth';
  static const main = '/main';
  static const post = '/post';
  static const article = '/article';
  static const postCreator = '/post/creator';
  static const articleCreator = '/article/creator';
  static const profile = '/profile';
  static const profileEditor = '/profile/editor';
  static const bookmarks = '/bookmarks';
  static const register = '/register';
  static const login = '/login';
  static const settings = '/settings';

  static const accountSettingsMenu = '/settings/account';
  static const accountSettings = '/settings/account/account';
  static const passwordSettings = '/settings/account/password';
  static const accountDeletionSettings = '/settings/account/delete';

  static const securitySettingsMenu = '/settings/security';
  static const twoFactorSettings = '/settings/security/two-factor';

  static const privacySettingsMenu = '/settings/privacy';
  static const sensitiveContentSettings = '/settings/private/sensitive-content';
  static const blacklistSettings = '/settings/privacy/blacklist';

  static const accessibilitySettingsMenu = '/settings/accessibility';
  static const languageSettings = '/settings/accessibility/language';
  static const themeSettings = '/settings/accessibility/theme';

  static const imageViewer = '/image-viewer';
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
    MainNavigationRouteNames.articleCreator: (_) =>
        _screenFactory.makeArticleCreator(),
    MainNavigationRouteNames.bookmarks: (_) => _screenFactory.makeBookmarks(),
    MainNavigationRouteNames.settings: (_) => _screenFactory.makeSettings(),
    MainNavigationRouteNames.accountSettingsMenu: (_) =>
        _screenFactory.makeAccountSettingsMenu(),
    MainNavigationRouteNames.accountSettings: (_) =>
        _screenFactory.makeAccountSettings(),
    MainNavigationRouteNames.passwordSettings: (_) =>
        _screenFactory.makePasswordSettings(),
    MainNavigationRouteNames.accountDeletionSettings: (_) =>
        _screenFactory.makeAccountDeletionSettings(),
    MainNavigationRouteNames.securitySettingsMenu: (_) =>
        _screenFactory.makeSecuritySettingsMenu(),
    MainNavigationRouteNames.twoFactorSettings: (_) =>
        _screenFactory.makeTwoFactorSettings(),
    MainNavigationRouteNames.privacySettingsMenu: (_) =>
        _screenFactory.makePrivacySettingsMenu(),
    MainNavigationRouteNames.sensitiveContentSettings: (_) =>
        _screenFactory.makeSensitiveContentSettings(),
    MainNavigationRouteNames.blacklistSettings: (_) =>
        _screenFactory.makeBlacklistSettings(),
    MainNavigationRouteNames.accessibilitySettingsMenu: (_) =>
        _screenFactory.makeAccessibilitySettingsMenu(),
    MainNavigationRouteNames.languageSettings: (_) =>
        _screenFactory.makeLanguageSettings(),
    MainNavigationRouteNames.themeSettings: (_) =>
        _screenFactory.makeThemeSettings(),
  };

  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouteNames.post:
        final arguments = settings.arguments;
        final postId = arguments is int ? arguments : 0;
        return MaterialPageRoute(
          builder: (_) => _screenFactory.makePost(postId),
        );
      case MainNavigationRouteNames.article:
        final arguments = settings.arguments;
        final articleId = arguments is int ? arguments : 0;
        return MaterialPageRoute(
          builder: (_) => _screenFactory.makeArticle(articleId),
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
      case MainNavigationRouteNames.imageViewer:
        final arguments = settings.arguments;
        final imageId = arguments is int ? arguments : 0;
        return MaterialPageRoute(
          builder: (_) => _screenFactory.makeImageViewer(imageId),
        );
      default:
        return MaterialPageRoute(builder: (_) => _screenFactory.makeMain());
    }
  }

  static void resetNavigation(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      MainNavigationRouteNames.loader,
      (route) => false,
    );
  }
}
