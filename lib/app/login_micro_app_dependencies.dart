import 'package:login_micro_app/login/data/datasources/auth_datasource.dart';
import 'package:login_micro_app/login/data/repositories/auth_repository_impl.dart';
import 'package:login_micro_app/login/domain/repositories/auth_repository.dart';
import 'package:login_micro_app/login/domain/usecases/default_login_usecase.dart';
import 'package:micro_core/utils/app_locator.dart';

class LoginMicroAppDependencies {
  static setUp(AppLocator locator) {
    locator.registerFactory(() => DefaultLoginUsecase(locator.get<AuthRepository>()));
    locator.registerFactory<AuthRepository>(() => AuthRepositoryImpl(locator.get<AuthDataSource>()));
  }
}
