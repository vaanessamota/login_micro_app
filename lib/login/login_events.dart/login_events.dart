class LoginEvent {}

class PerformLoginEvent extends LoginEvent {
  final String email;
  final String password;

  PerformLoginEvent({required this.email, required this.password});
}
