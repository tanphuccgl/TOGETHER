import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class DashboardWrapperPage extends StatelessWidget {
  const DashboardWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AutoRouter(),
    );
  }
}
