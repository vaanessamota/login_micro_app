import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_micro_app/login/presentation/login_events.dart';
import 'package:login_micro_app/login/presentation/login_presenter.dart';
import 'package:login_micro_app/login/ui/widgets/login_form_widget.dart';
import 'package:micro_core/utils/micro_core_dependencies.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginBloc loginBloc = locator.get();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: BlocProvider(
        create: (context) => loginBloc, // Initialize your LoginBloc
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome to the login microapp',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 60),
              LoginForm(
                emailController: emailController,
                passwordController: passwordController,
              ),
              ElevatedButton(
                  onPressed: () {
                    loginBloc.add(
                        PerformLoginEvent(email: emailController.text, password: passwordController.text));
                  },
                  child: const Text('Login'))
            ],
          ),
        ),
      ),
    );
  }
}
