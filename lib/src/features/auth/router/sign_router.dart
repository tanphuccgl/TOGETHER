import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:together/src/features/auth/login/pages/login_page.dart';
import 'package:together/src/features/auth/router/sign_wrapper_router.dart';
import 'package:together/src/features/auth/sign_up/pages/sign_up.dart';
import 'package:together/src/router/auto_router.gr.dart';
import 'package:together/src/router/router_name.dart';

class SignRouters {
  static const String login = 'login';
  static const String signUp = 'login1';
  static const String chatJoin = 'chat-join';
  static const String holding = 'holding';
}

class SignCoordinator {
  static const autoRoute = AutoRoute(
      path: XRoutes.sign,
      name: "SignRoute",
      page: SignWrapperPage,
      children: [
        AutoRoute(
          path: SignRouters.login,
          page: LoginPage,
          initial: true,
        ),
        AutoRoute(
          path: SignRouters.signUp,
          page: SignUpPage,
        ),
        RedirectRoute(path: '*', redirectTo: ''),
      ]);

  static void showSignUpPage(BuildContext context) =>
      context.router.push(const SignUpRoute());
}
