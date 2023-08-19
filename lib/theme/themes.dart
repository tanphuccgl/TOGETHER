import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

class XTheme {
  static const barOverLayStyle = SystemUiOverlayStyle.light;

  static ThemeData light() =>
      ThemeData(scaffoldBackgroundColor: XColors.antiFlashWhite);

  static ThemeData dark() => ThemeData.dark();
}
