import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:together/theme/styles.dart';

class XLoadingAlert extends StatelessWidget {
  const XLoadingAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 80,
        decoration: BoxDecoration(
          gradient: XStyles.primaryGradient,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                height: 80,
                padding: const EdgeInsets.all(20),
                alignment: Alignment.center,
                child: _indicator(context)),
          ],
        ),
      ),
    );
  }

  Widget _indicator(BuildContext context) {
    const double radius = 15;
    if (kIsWeb || Platform.isAndroid) {
      return SizedBox(
        width: radius * 2,
        height: radius * 2,
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor),
        ),
      );
    }
    return const CupertinoActivityIndicator(
      radius: radius,
    );
  }
}
