class DefaultLoginRequestModel {
  final String email;
  final String password;

  DefaultLoginRequestModel({required this.email, required this.password});

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory DefaultLoginRequestModel.fromMap(Map<String, dynamic> map) {
    return DefaultLoginRequestModel(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }
}
