import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:together/src/features/auth/login/logic/login_bloc.dart';
import 'package:together/src/features/auth/sign_up/logic/sign_up_bloc.dart';
import 'package:together/src/features/auth/sign_up/widgets/sign_up_button.dart';
import 'package:together/src/network/widgets/input.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignUpBloc(),
      child: BlocBuilder<SignUpBloc, SignUpState>(
        builder: (context, _) {
          return Scaffold(
            appBar: AppBar(),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    const Text("đăng ký"),
                    const XInput(value: "value"),
                    const XInput(value: "value"),
                    SignUpButton(
                      label: "Email/Password",
                      onPressed: () =>
                          context.read<LoginBloc>().onEmailPasswordButton(),
                    ),
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
