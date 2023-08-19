// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart' as AL;

import 'package:together/src/router/coordinator.dart';

class S {
  static get delegate => AL.AppLocalizations.delegate;
  static AL.AppLocalizations of(BuildContext context) {
    return AL.AppLocalizations.of(context)!;
  }

  static AL.AppLocalizations get text {
    return AL.AppLocalizations.of(XCoordinator.context)!;
  }
}
