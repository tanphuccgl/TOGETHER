// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../features/auth/login/pages/login_page.dart' as _i4;
import '../features/auth/router/sign_wrapper_router.dart' as _i2;
import '../features/auth/sign_up/pages/sign_up.dart' as _i5;
import '../features/dashboard/router/dashboard_wrapper_router.dart' as _i1;
import '../features/loading/splash_page.dart' as _i3;

class XRouter extends _i6.RootStackRouter {
  XRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    DashboardWrapperRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.DashboardWrapperPage(),
      );
    },
    SignRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.SignWrapperPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.SplashPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.LoginPage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.SignUpPage(),
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          DashboardWrapperRoute.name,
          path: '/dashboard',
          children: [
            _i6.RouteConfig(
              '*#redirect',
              path: '*',
              parent: DashboardWrapperRoute.name,
              redirectTo: '',
              fullMatch: true,
            )
          ],
        ),
        _i6.RouteConfig(
          SignRoute.name,
          path: '/sign',
          children: [
            _i6.RouteConfig(
              '#redirect',
              path: '',
              parent: SignRoute.name,
              redirectTo: 'login',
              fullMatch: true,
            ),
            _i6.RouteConfig(
              LoginRoute.name,
              path: 'login',
              parent: SignRoute.name,
            ),
            _i6.RouteConfig(
              SignUpRoute.name,
              path: 'login1',
              parent: SignRoute.name,
            ),
            _i6.RouteConfig(
              '*#redirect',
              path: '*',
              parent: SignRoute.name,
              redirectTo: '',
              fullMatch: true,
            ),
          ],
        ),
        _i6.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i6.RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [_i1.DashboardWrapperPage]
class DashboardWrapperRoute extends _i6.PageRouteInfo<void> {
  const DashboardWrapperRoute({List<_i6.PageRouteInfo>? children})
      : super(
          DashboardWrapperRoute.name,
          path: '/dashboard',
          initialChildren: children,
        );

  static const String name = 'DashboardWrapperRoute';
}

/// generated route for
/// [_i2.SignWrapperPage]
class SignRoute extends _i6.PageRouteInfo<void> {
  const SignRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SignRoute.name,
          path: '/sign',
          initialChildren: children,
        );

  static const String name = 'SignRoute';
}

/// generated route for
/// [_i3.SplashPage]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i4.LoginPage]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: 'login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i5.SignUpPage]
class SignUpRoute extends _i6.PageRouteInfo<void> {
  const SignUpRoute()
      : super(
          SignUpRoute.name,
          path: 'login1',
        );

  static const String name = 'SignUpRoute';
}
