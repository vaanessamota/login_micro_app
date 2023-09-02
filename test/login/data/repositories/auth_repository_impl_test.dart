import 'package:flutter_test/flutter_test.dart';
import 'package:login_micro_app/login/data/repositories/auth_repository_impl.dart';
import 'package:login_micro_app/login/domain/entities/default_login_entity.dart';
import 'package:login_micro_app/login/domain/usecases/default_login_usecase.dart';
import 'package:mockito/mockito.dart';

import '../../../resources/mocks.mocks.dart';

void main() {
  late AuthRepositoryImpl sut;
  late MockAuthDataSource mockAuthService;

  setUp(() {
    mockAuthService = MockAuthDataSource();
    sut = AuthRepositoryImpl(mockAuthService);
  });

  test('should login user when credentials are valid', () async {
    //arrange
    final loginEntity = DefaultLoginEntity(token: 'token');
    final loginUsecaseParams = DefaultLoginUsecaseParams(email: 'user@email.com', password: 'P@ssw0rd');
    when(sut.defaultLogin(loginUsecaseParams)).thenAnswer((_) => Future.value(loginEntity));

    //act
    final result = await sut.defaultLogin(loginUsecaseParams);

    //assert
    expect(result, loginEntity);
  });

  test('throws Exception', () async {
    // Arrange
    final params = DefaultLoginUsecaseParams(email: 'email', password: 'password');
    when(mockAuthService.defaultLogin(any)).thenThrow(Exception('An exception occurred'));

    // Act and Assert
    expect(() => sut.defaultLogin(params), throwsA(isInstanceOf<Exception>()));
  });
}
