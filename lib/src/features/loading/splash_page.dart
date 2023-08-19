import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:together/src/features/auth/logic/account_bloc.dart';
import 'package:together/src/features/auth/login/pages/login_page.dart';
import 'package:together/src/features/loading/loading_page.dart';
import 'package:together/src/router/coordinator.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AccountBloc, AccountState>(
        listenWhen: (p, c) => p.isLoading != c.isLoading || p.user != c.user,
        listener: (_, state) {
          if (state.isLoading) return;
          state.user.id.isEmpty
              ? XCoordinator.showSign()
              : XCoordinator.showDashboard();
        },
        child: const LoadingPage());
  }
}
