import 'package:flutter_test/flutter_test.dart';
import 'package:login_micro_app/login/data/models/default_login_response_model.dart';
import 'package:login_micro_app/login/data/repositories/auth_repository_impl.dart';
import 'package:login_micro_app/login/domain/entities/default_login_entity.dart';
import 'package:login_micro_app/login/domain/errors/domain_errors.dart';
import 'package:login_micro_app/login/domain/usecases/default_login_usecase.dart';
import 'package:micro_core/core/http/http_error.dart';
import 'package:mockito/mockito.dart';

import '../../../resources/mocks.mocks.dart';

void main() {
  late AuthRepositoryImpl sut;
  late MockAuthDataSource mockAuthDataSource;

  setUp(() {
    mockAuthDataSource = MockAuthDataSource();
    sut = AuthRepositoryImpl(mockAuthDataSource);
  });

  test('should login user when credentials are valid', () async {
    //arrange
    final expected = DefaultLoginEntity(token: 'token');
    final loginResponseModel = DefaultLoginResponseModel(token: 'token');
    final loginParams = DefaultLoginUsecaseParams(email: 'user@email.com', password: 'P@ssw0rd');
    when(mockAuthDataSource.defaultLogin(any))
        .thenAnswer((realInvocation) => Future.value(loginResponseModel));

    //act
    final result = await sut.defaultLogin(loginParams);

    //assert
    expect(result, expected);
  });

  test('should throw Invalid Credentials when credentials are invalid', () async {
    // Arrange
    final params = DefaultLoginUsecaseParams(email: 'email', password: 'password');
    when(mockAuthDataSource.defaultLogin(any)).thenThrow(HttpError.unauthorized);
    // Act and Assert
    expect(() => sut.defaultLogin(params), throwsA(DomainError.invalidCredentials));
  });

  test('should throw Unexpected Domain Error when Server Error happens', () async {
    // Arrange
    final params = DefaultLoginUsecaseParams(email: 'email', password: 'password');
    when(mockAuthDataSource.defaultLogin(any)).thenThrow(HttpError.serverError);
    // Act and Assert
    expect(() => sut.defaultLogin(params), throwsA(DomainError.unexpected));
  });
}
