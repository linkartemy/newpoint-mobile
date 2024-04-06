import 'package:flutter/material.dart';
import 'package:newpoint/views/auth/auth_view.dart';
import 'package:newpoint/views/auth/auth_view_model.dart';
import 'package:newpoint/views/auth/login_view.dart';
import 'package:newpoint/views/auth/login_view_model.dart';
import 'package:newpoint/views/auth/register_view.dart';
import 'package:newpoint/views/auth/register_view_model.dart';
import 'package:newpoint/views/loader/loader_view.dart';
import 'package:newpoint/views/loader/loader_view_model.dart';
import 'package:newpoint/views/main/main_view.dart';
import 'package:newpoint/views/post/post_view.dart';
import 'package:newpoint/views/post/post_view_model.dart';
import 'package:newpoint/views/post_creator/post_creator_view.dart';
import 'package:newpoint/views/post_creator/post_creator_view_model.dart';
import 'package:newpoint/views/profile/profile_view.dart';
import 'package:newpoint/views/profile/profile_view_model.dart';
import 'package:newpoint/views/profile_editor/profile_editor_view.dart';
import 'package:newpoint/views/profile_editor/profile_editor_view_model.dart';
import 'package:newpoint/views/settings/accessibility/accessibility_settings_menu_view.dart';
import 'package:newpoint/views/settings/accessibility/accessibility_settings_menu_view_model.dart';
import 'package:newpoint/views/settings/accessibility/language_settings_view.dart';
import 'package:newpoint/views/settings/accessibility/language_settings_view_model.dart';
import 'package:newpoint/views/settings/accessibility/theme_settings_view.dart';
import 'package:newpoint/views/settings/accessibility/theme_settings_view_model.dart';
import 'package:newpoint/views/settings/account/account_deletion_settings_view.dart';
import 'package:newpoint/views/settings/account/account_deletion_settings_view_model.dart';
import 'package:newpoint/views/settings/account/account_settings_menu_view.dart';
import 'package:newpoint/views/settings/account/account_settings_menu_view_model.dart';
import 'package:newpoint/views/settings/account/account_settings_view.dart';
import 'package:newpoint/views/settings/account/account_settings_view_model.dart';
import 'package:newpoint/views/settings/account/password_settings_view.dart';
import 'package:newpoint/views/settings/account/password_settings_view_model.dart';
import 'package:newpoint/views/settings/settings_view.dart';
import 'package:newpoint/views/settings/settings_view_model.dart';
import 'package:provider/provider.dart';

import '../../views/main/main_view_model.dart';

class ScreenFactory {
  Widget makeLoader() {
    return Provider(
      create: (context) => LoaderViewModel(context),
      lazy: false,
      child: const LoaderView(),
    );
  }

  Widget makeAuth() {
    return ChangeNotifierProvider(
      create: (_) => AuthViewModel(),
      child: const AuthView(),
    );
  }

  Widget makeRegister() {
    return ChangeNotifierProvider(
      create: (_) => RegisterViewModel(),
      child: const RegisterView(),
    );
  }

  Widget makeLogin() {
    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
      child: const LoginView(),
    );
  }

  Widget makePost(int id) {
    return ChangeNotifierProvider(
      create: (_) => PostViewModel(id),
      child: const PostView(),
    );
  }

  Widget makePostCreator() {
    return ChangeNotifierProvider(
      create: (_) => PostCreatorViewModel(),
      child: const PostCreatorView(),
    );
  }

  Widget makeMain() {
    return ChangeNotifierProvider(
      create: (_) => MainViewModel(),
      child: const MainView(),
    );
  }

  Widget makeProfile(int id) {
    return ChangeNotifierProvider(
      create: (_) => ProfileViewModel(id),
      child: const ProfileView(),
    );
  }

  Widget makeProfileEditor(int id) {
    return ChangeNotifierProvider(
      create: (_) => ProfileEditorViewModel(id),
      child: const ProfileEditorView(),
    );
  }

  Widget makeSettings() {
    return ChangeNotifierProvider(
      create: (_) => SettingsViewModel(),
      child: const SettingsView(),
    );
  }

  Widget makeAccountSettingsMenu() {
    return ChangeNotifierProvider(
      create: (_) => AccountSettingsMenuViewModel(),
      child: const AccountSettingsMenuView(),
    );
  }

  Widget makePasswordSettings() {
    return ChangeNotifierProvider(
      create: (_) => PasswordSettingsViewModel(),
      child: const PasswordSettingsView(),
    );
  }

  Widget makeAccountDeletionSettings() {
    return ChangeNotifierProvider(
      create: (_) => AccountDeletionSettingsViewModel(),
      child: const AccountDeletionSettingsView(),
    );
  }

  Widget makeAccountSettings() {
    return ChangeNotifierProvider(
      create: (_) => AccountSettingsViewModel(),
      child: const AccountSettingsView(),
    );
  }

  Widget makeAccessibilitySettingsMenu() {
    return ChangeNotifierProvider(
      create: (_) => AccessibilitySettingsMenuViewModel(),
      child: const AccessibilitySettingsMenuView(),
    );
  }

  Widget makeLanguageSettings() {
    return ChangeNotifierProvider(
      create: (_) => LanguageSettingsViewModel(),
      child: const LanguageSettingsView(),
    );
  }

  Widget makeThemeSettings() {
    return ChangeNotifierProvider(
      create: (_) => ThemeSettingsViewModel(),
      child: const ThemeSettingsView(),
    );
  }
}
