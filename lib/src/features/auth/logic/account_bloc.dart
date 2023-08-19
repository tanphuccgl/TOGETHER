import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:together/src/network/model/user.dart';
import 'package:together/src/services/user_prefs.dart';

part "account_state.dart";

class AccountBloc extends Cubit<AccountState> {
  AccountBloc() : super(AccountState(user: WUser.empty())) {
    inital();
  }

  void inital() {
    getInfoAccount();
  }

  Future<void> getInfoAccount() async {
    await Future.delayed(Duration.zero);
    final user = UserPrefs().getUser();

    emit(state.copyWith(user: user, isLoading: false));
  }
}
