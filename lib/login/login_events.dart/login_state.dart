import 'package:login_micro_app/login/domain/errors/domain_errors.dart';

class LoginState {}

class LoginErrorState extends LoginState {
  final DomainError error;

  LoginErrorState(this.error);
}

class LoginSuccessState extends LoginState {}
