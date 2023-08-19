import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import 'package:together/src/config/constants/constants.dart';
import 'package:together/src/features/auth/logic/account_bloc.dart';
import 'package:together/src/localization/localization_utils.dart';
import 'package:together/src/router/auto_router.gr.dart';
import 'package:together/src/router/route_observer.dart';
import 'package:together/theme/colors.dart';
import 'package:together/theme/themes.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();
    final appRouter = GetIt.I<XRouter>();

    return BlocProvider(
      create: (context) => GetIt.I<AccountBloc>(),
      child: ScreenUtilInit(
        rebuildFactor: (old, data) => RebuildFactors.all(old, data),
        designSize: const Size(360, 844),
        useInheritedMediaQuery: true,
        builder: (context, child) {
          return MaterialApp.router(
              color: XColors.antiFlashWhite,
              locale: const Locale('en'),
              builder: (context, child) {
                child = botToastBuilder(context, child);
                child = MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: child,
                );

                return child;
              },
              debugShowCheckedModeBanner: true,
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en', ''),
              ],
              onGenerateTitle: (BuildContext context) =>
                  S.of(context).common_appTitle,
              theme: XTheme.light(),
              darkTheme: XTheme.dark(),
              themeMode: ThemeMode.light,
              routeInformationParser:
                  appRouter.defaultRouteParser(includePrefixMatches: true),
              routerDelegate: AutoRouterDelegate(
                appRouter,
                navigatorObservers: () =>
                    [if (Constants.turnOnRouteObserver) XRouteObserver()],
              ));
        },
      ),
    );
  }
}
