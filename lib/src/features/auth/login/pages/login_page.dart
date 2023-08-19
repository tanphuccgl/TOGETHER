import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:together/src/features/auth/login/logic/login_bloc.dart';
import 'package:together/src/features/auth/login/widgets/login_button.dart';
import 'package:together/src/features/auth/router/sign_router.dart';
import 'package:together/src/network/widgets/input.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, _) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    const Text("đăng nhập"),
                    const XInput(value: "value"),
                    const XInput(value: "value"),
                    LoginButton(
                      label: "Email/Password",
                      onPressed: () =>
                          context.read<LoginBloc>().onEmailPasswordButton(),
                    ),
                    GestureDetector(
                        onTap: () => SignCoordinator.showSignUpPage(context),
                        child: const Text("chuyển Đăng ký"))
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
