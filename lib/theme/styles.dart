import 'package:flutter/material.dart';

import 'colors.dart';

class XStyles {
  static final titleRegular = TextStyle(
    fontSize: 17,
    color: XColors.primary.withOpacity(.5),
    fontWeight: FontWeight.w400,
  );

  static const titleBold = TextStyle(
    fontSize: 17,
    color: XColors.primary,
    fontWeight: FontWeight.bold,
  );

  static const body = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: XColors.darkSilver,
  );

  static const inputStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static const textNormal = TextStyle(
    fontSize: 15,
    color: XColors.text,
    letterSpacing: -0.15,
    fontWeight: FontWeight.normal,
  );

  static const textLarge = TextStyle(
    fontSize: 18,
    color: XColors.primary,
    fontWeight: FontWeight.normal,
  );

  static const titleSmall = TextStyle(
    color: XColors.charlestonGreen,
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );

  static final boxDecoration = BoxDecoration(
    color: XColors.white,
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
      shadowDefault,
    ],
  );

  static final boxDecorationGradient =
      XStyles.boxDecoration.copyWith(gradient: primaryGradient);
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [
      0.0,
      1.0,
    ],
    colors: XColors.gradientBlue,
  );

  static final boxDecorationGradientDisable =
      XStyles.boxDecoration.copyWith(gradient: primaryGradientDisable);
  static const LinearGradient primaryGradientDisable = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [
      0.0,
      1.0,
    ],
    colors: XColors.gradientBlueDisable,
  );

  static final BoxShadow shadowDefault = BoxShadow(
    color: XColors.black.withOpacity(.16),
    blurRadius: 2,
    spreadRadius: -0.5,
  );
  static final List<Shadow> shadowText = <Shadow>[
    Shadow(
      offset: const Offset(0, 0),
      blurRadius: 2.0,
      color: XColors.black.withOpacity(.16),
    ),
  ];

// https://api.flutter.dev/flutter/material/TextTheme-class.html
  static TextTheme get textTheme {
    final textTheme = const TextTheme(
      // input style
      bodyLarge: inputStyle,
      bodyMedium: body,
      labelSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    ).apply(
      bodyColor: XColors.darkSilver,
      displayColor: XColors.darkSilver,
    );
    return textTheme;
  }
}
