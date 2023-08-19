import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:together/bloc_observer.dart';

import 'package:together/firebase_options.dart';

import 'package:together/src/config/constants/constants.dart';
import 'package:together/src/features/auth/logic/account_bloc.dart';
import 'package:together/src/network/domain_manager.dart';
import 'package:together/src/router/auto_router.gr.dart';
import 'package:together/src/services/user_prefs.dart';
import 'package:together/theme/themes.dart';

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(XTheme.barOverLayStyle);

  _locator();

  await Future.wait([
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
    UserPrefs.instance.initialize(),
  ]);
  if (!kIsWeb) {
    FlutterError.onError = (errorDetails) =>
        FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);

    FirebaseFirestore.instance.settings =
        const Settings(persistenceEnabled: false);

    _initializeCrashlytics();
  }

  if (Constants.turnOnBlocObserver) Bloc.observer = XBlocObserver();
}

void _locator() {
  GetIt.I
    ..registerLazySingleton(() => DomainManager())
    ..registerLazySingleton(() => XRouter())
    ..registerLazySingleton(() => AccountBloc());
}

Future<void> _initializeCrashlytics() async {
  bool isLog = Constants.testingCrashlytics || !kDebugMode;
  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(isLog);
}
