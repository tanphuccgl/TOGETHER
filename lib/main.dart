import 'dart:async';

import 'package:flutter/material.dart';
import 'package:together/app.dart';
import 'package:together/locator.dart';

Future main() async {
  await initializeApp();
  runApp(const MyApp());
}
