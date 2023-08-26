import 'package:login_micro_app/login/domain/entities/default_login_entity.dart';
import 'package:login_micro_app/login/domain/usecases/default_login_usecase.dart';

abstract class AuthRepository {
  Future<DefaultLoginEntity> defaultLogin(DefaultLoginUsecaseParams params);
}
