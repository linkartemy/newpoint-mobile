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
import 'package:provider/provider.dart';

import '../../views/main/main_view_model.dart';

class ScreenFactory {
  Widget makeLoader() {
    return Provider(
      create: (context) => LoaderViewModel(context),
      child: const LoaderView(),
      lazy: false,
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

  Widget makeMain() {
    return ChangeNotifierProvider(
      create: (_) => MainViewModel(),
      child: const MainView(),
    );
  }
}
