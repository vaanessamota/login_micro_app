import 'package:login_micro_app/login/domain/entities/default_login_entity.dart';

class DefaultLoginResponseModel {
  final String token;

  DefaultLoginResponseModel({required this.token});

  Map<String, dynamic> toMap() {
    return {
      'token': token,
    };
  }

  factory DefaultLoginResponseModel.fromMap(Map<String, dynamic> map) {
    return DefaultLoginResponseModel(
      token: map['token'] as String,
    );
  }

  DefaultLoginEntity toEntity() {
    return DefaultLoginEntity(token: token);
  }
}
