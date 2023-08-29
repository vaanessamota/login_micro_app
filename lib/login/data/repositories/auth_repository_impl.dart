import 'package:login_micro_app/login/data/models/default_login_request_model.dart';
import 'package:login_micro_app/login/data/services/auth_service.dart';
import 'package:login_micro_app/login/domain/entities/default_login_entity.dart';
import 'package:login_micro_app/login/domain/repositories/auth_repository.dart';
import 'package:login_micro_app/login/domain/usecases/default_login_usecase.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService authDatasource;

  AuthRepositoryImpl(this.authDatasource);

  @override
  Future<DefaultLoginEntity> defaultLogin(DefaultLoginUsecaseParams params) async {
    try {
      final requestModel = DefaultLoginRequestModel(email: params.email, password: params.password);
      final result = await authDatasource.defaultLogin(requestModel);

      return result.toEntity();
    } catch (e) {
      throw Exception();
    }
  }
}
