import 'package:login_micro_app/login/data/datasources/auth_datasource.dart';
import 'package:login_micro_app/login/data/models/default_login_request_model.dart';
import 'package:login_micro_app/login/data/models/default_login_response_model.dart';
import 'package:micro_core/core/http/http_client.dart';

class AuthDataSourceImpl extends AuthDataSource {
  final HttpClient _httpClient;

  AuthDataSourceImpl(this._httpClient);

  @override
  Future<DefaultLoginResponseModel> defaultLogin(DefaultLoginRequestModel requestModel) async {
    final response = await _httpClient.post('/login');
    return DefaultLoginResponseModel.fromMap(response);
  }
}
