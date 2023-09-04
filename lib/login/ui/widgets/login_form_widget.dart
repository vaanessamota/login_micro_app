import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_micro_app/login/domain/errors/domain_errors.dart';
import 'package:login_micro_app/login/login_events.dart/login_presenter.dart';
import 'package:login_micro_app/login/login_events.dart/login_state.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginForm({super.key, required this.emailController, required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginErrorState) {
          _showSnackBar(context, state.error.description);
        }
        if (state is LoginSuccessState) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Usuário logado com sucesso')),
            );
        }
      },
      child: Center(
        child: Column(
          children: [
            _UsernameInput(
              emailController: emailController,
            ),
            _PasswordInput(passwordController: passwordController),
          ],
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(text)),
      );
  }
}

class _UsernameInput extends StatelessWidget {
  final TextEditingController emailController;

  const _UsernameInput({required this.emailController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return const SizedBox(
          height: 100,
          width: 300,
          child: TextField(
            decoration: InputDecoration(
              labelText: 'username',
            ),
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  final TextEditingController passwordController;

  const _PasswordInput({required this.passwordController});
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 100,
      width: 300,
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(labelText: 'password'),
      ),
    );
  }
}
