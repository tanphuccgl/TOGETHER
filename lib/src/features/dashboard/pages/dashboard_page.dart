import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
    // return AutoTabsScaffold(
    //     routes: [
    //       HomeTab(),
    //       DiscoverTab(),
    //       LandingWrapperRoute(),
    //       GroupAndChatTab(),
    //       CalendarTab(),
    //     ],
    //     extendBody: true,
    //     bottomNavigationBuilder: (_, tabsRouter) {
    //       return XFloatBottomNavigation(tabsRouter: tabsRouter);
    //     });
  }
}
