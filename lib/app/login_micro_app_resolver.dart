import 'package:login_micro_app/login/ui/pages/login_page.dart';
import 'package:micro_core/micro_core.dart';

class LoginMicroAppResolver implements MicroApp {
  @override
  String get microAppName => 'login_micro_app';

  @override
  Map<String, WidgetBuilderArgs> get routes => {
        '/login': (context, args) => const LoginPage(),
      };
}
