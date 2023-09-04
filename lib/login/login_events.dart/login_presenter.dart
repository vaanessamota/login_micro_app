import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_micro_app/login/domain/errors/domain_errors.dart';
import 'package:login_micro_app/login/domain/usecases/default_login_usecase.dart';
import 'package:login_micro_app/login/login_events.dart/login_events.dart';

import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final DefaultLoginUsecase defaultLogin;

  LoginBloc(this.defaultLogin) : super(LoginState()) {
    on<PerformLoginEvent>(performDefaultLogin);
  }

  FutureOr<void> performDefaultLogin(PerformLoginEvent event, Emitter emit) async {
    try {
      await defaultLogin(DefaultLoginUsecaseParams(email: event.email, password: event.password));
      emit(LoginSuccessState());
    } on DomainError catch (error) {
      emit(LoginErrorState(error));
    }
  }
}
