import 'package:flutter_test/flutter_test.dart';
import 'package:login_micro_app/login/domain/entities/default_login_entity.dart';
import 'package:login_micro_app/login/domain/repositories/auth_repository.dart';
import 'package:login_micro_app/login/domain/usecases/default_login_usecase.dart';
import 'package:mockito/mockito.dart';

import '../../../resources/mocks.mocks.dart';

void main() {
  late final DefaultLoginUsecase sut;
  late final AuthRepository repository;

  setUp(() {
    repository = MockAuthRepository();
    sut = DefaultLoginUsecase(repository);
  });

  test('should login user when credentials are valid', () async {
    //arrange
    final loginEntity = DefaultLoginEntity(token: 'token');
    final loginUsecaseParams = DefaultLoginUsecaseParams(email: 'user@email.com', password: 'P@ssw0rd');
    when(sut.call(loginUsecaseParams)).thenAnswer((_) => Future.value(loginEntity));

    //act
    final result = await sut.call(loginUsecaseParams);

    //assert
    expect(result, loginEntity);
  });
}
