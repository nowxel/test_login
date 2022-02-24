part of 'login_bloc.dart';

class LoginState extends Equatable {
  LoginState({
    this.status = FormzStatus.pure,
    this.username = const Username.pure(),
    this.password = const Password.pure(),
    this.hidePassword = true,
  });

  final FormzStatus status;
  final Username username;
  final Password password;

  bool hidePassword;

  LoginState copyWith({
    FormzStatus? status,
    Username? username,
    Password? password,
    bool? hidePassword,
  }) {
    return LoginState(
      status: status ?? this.status,
      username: username ?? this.username,
      password: password ?? this.password,
      hidePassword: hidePassword ?? this.hidePassword,
    );
  }

  @override
  List<Object> get props => [status, username, password];
}