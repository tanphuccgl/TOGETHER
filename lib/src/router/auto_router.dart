import 'package:auto_route/auto_route.dart';
import 'package:together/src/features/auth/router/sign_router.dart';
import 'package:together/src/features/dashboard/router/dashboard_router.dart';

import 'package:together/src/features/loading/splash_page.dart';
import 'package:together/src/router/router_name.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    DashboardCoordinator.autoRoute,
    SignCoordinator.autoRoute,
    AutoRoute(
      path: XRoutes.loading,
      name: "SplashRoute",
      page: SplashPage,
      initial: true,
    ),
    // redirect all other paths
    RedirectRoute(path: '*', redirectTo: ''),
  ],
)
class $XRouter {}
