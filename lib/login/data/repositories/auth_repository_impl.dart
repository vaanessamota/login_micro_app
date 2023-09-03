import 'package:login_micro_app/login/data/datasources/auth_datasource.dart';
import 'package:login_micro_app/login/data/models/default_login_request_model.dart';
import 'package:login_micro_app/login/domain/entities/default_login_entity.dart';
import 'package:login_micro_app/login/domain/errors/domain_errors.dart';
import 'package:login_micro_app/login/domain/repositories/auth_repository.dart';
import 'package:login_micro_app/login/domain/usecases/default_login_usecase.dart';
import 'package:micro_core/core/http/http_error.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDatasource;

  AuthRepositoryImpl(this.authDatasource);

  @override
  Future<DefaultLoginEntity> defaultLogin(DefaultLoginUsecaseParams params) async {
    try {
      final requestModel = DefaultLoginRequestModel(email: params.email, password: params.password);
      final result = await authDatasource.defaultLogin(requestModel);

      return result.toEntity();
    } on HttpError catch (error) {
      throw error == HttpError.unauthorized ? DomainError.invalidCredentials : DomainError.unexpected;
    }
  }
}
