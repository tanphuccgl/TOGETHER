// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "account_bloc.dart";

class AccountState extends Equatable {
  final bool isLoading;
  final WUser user;

  const AccountState({
    this.isLoading = true,
    required this.user,
  });
  @override
  List<Object?> get props => [
        isLoading,
        user,
      ];

  AccountState copyWith({
    bool? isLoading,
    WUser? user,
  }) {
    return AccountState(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
    );
  }
}
