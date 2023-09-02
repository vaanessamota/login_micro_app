import 'package:login_micro_app/login/data/models/default_login_request_model.dart';
import 'package:login_micro_app/login/data/models/default_login_response_model.dart';

abstract class AuthDataSource {
  Future<DefaultLoginResponseModel> defaultLogin(DefaultLoginRequestModel requestModel);
}
