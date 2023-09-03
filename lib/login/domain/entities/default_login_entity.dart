import 'package:equatable/equatable.dart';

class DefaultLoginEntity with EquatableMixin {
  final String token;

  DefaultLoginEntity({required this.token});

  @override
  List<Object?> get props => [token];
}
