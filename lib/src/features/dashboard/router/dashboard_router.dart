import 'package:auto_route/auto_route.dart';
import 'package:together/src/features/dashboard/router/dashboard_wrapper_router.dart';
import 'package:together/src/router/router_name.dart';

class DashboardTaps {
  static const String homeTab = 'home';
  static const String discoverTab = 'discover';
  static const String createGroupTab = 'create-group';
  static const String groupChatTab = 'group-chat';
  static const String calendarTab = 'calendar';
}

class DashboardRouters {
  static const String user = 'userProfile/:idUser';
  static const String activeChat = 'active-chat';
  static const String prieview = 'preview';
  static const String notifications = 'notifications';
  static const String media = 'media/:groupId';
}

class DashboardCoordinator {
  static const autoRoute = AutoRoute(
    path: XRoutes.dashBoard,
    name: "DashboardWrapperRoute",
    page: DashboardWrapperPage,
    children: [
      RedirectRoute(path: '*', redirectTo: ''),
    ],
  );
}
