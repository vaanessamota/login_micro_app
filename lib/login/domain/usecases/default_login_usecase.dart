import 'package:login_micro_app/login/domain/entities/default_login_entity.dart';
import 'package:login_micro_app/login/domain/repositories/auth_repository.dart';

class DefaultLoginUsecase {
  final AuthRepository auth;

  DefaultLoginUsecase(this.auth);

  Future<DefaultLoginEntity> call(DefaultLoginUsecaseParams params) async {
    return await auth.defaultLogin(params);
  }
}

class DefaultLoginUsecaseParams {
  final String email;
  final String password;

  DefaultLoginUsecaseParams({required this.email, required this.password});
}
