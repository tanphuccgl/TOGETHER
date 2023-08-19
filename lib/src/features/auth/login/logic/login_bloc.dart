import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:get_it/get_it.dart';
import 'package:together/src/network/domain_manager.dart';
import 'package:together/src/network/model/common/result.dart';
import 'package:together/src/network/model/user.dart';
import 'package:together/src/network/widgets/dialogs/toast_wrapper.dart';

part "login_state.dart";

class LoginBloc extends Cubit<LoginState> {
  LoginBloc() : super(LoginState());

  DomainManager get _domain => GetIt.I<DomainManager>();

  Future<void> onEmailPasswordButton() async {
    XToast.showLoading();
    final result = await _domain.user
        .signUpWithEmailPassword(email: "fsdafs", password: "Fsdaf");

    if (result.isSuccess) {
      final isSuccess = await createNewAccount();
      isSuccess.isSuccess
          ? XToast.error("Thành công")
          : XToast.error(isSuccess.error);
      XToast.hideLoading();
    } else {
      XToast.error(result.error);
      XToast.hideLoading();
    }
  }

  Future<XResult<WUser>> createNewAccount() async {
    final user = WUser.defaultUser(
      name: "state.displayName.value",
      username: "signUpState.username.value",
      email: "signUpState.emailResult",
    );

    final result = await _domain.user.createNewAccount(user);
    return result;
  }
}
