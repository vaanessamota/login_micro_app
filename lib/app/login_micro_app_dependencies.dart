import 'package:login_micro_app/login/data/datasources/auth_datasource.dart';
import 'package:login_micro_app/login/data/repositories/auth_repository_impl.dart';
import 'package:login_micro_app/login/domain/repositories/auth_repository.dart';
import 'package:login_micro_app/login/domain/usecases/default_login_usecase.dart';
import 'package:login_micro_app/login/infra/auth_datasource_impl.dart';
import 'package:login_micro_app/login/login_events.dart/login_presenter.dart';
import 'package:micro_core/core/http/http_client.dart';
import 'package:micro_core/utils/app_locator.dart';

class LoginMicroAppDependencies {
  static setUp(AppLocator locator) {
    locator.registerFactory<AuthDataSource>(() => AuthDataSourceImpl(locator.get<HttpClient>()));
    locator.registerFactory<AuthRepository>(() => AuthRepositoryImpl(locator.get<AuthDataSource>()));
    locator.registerFactory(() => DefaultLoginUsecase(locator.get<AuthRepository>()));
    locator.registerFactory(() => LoginBloc(locator.get<DefaultLoginUsecase>()));
  }
}
