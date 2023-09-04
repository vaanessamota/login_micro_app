enum DomainError { unexpected, invalidCredentials, accessDenied }

extension DomainErrorExtension on DomainError {
  String get description {
    switch (this) {
      case DomainError.unexpected:
        return "Algo errado aconteceu. Tente novamente em breve.";
      case DomainError.invalidCredentials:
        return "Credenciais inválidas.";
      case DomainError.accessDenied:
        return "Acesso negado. Você não tem permissão para realizar esta ação.";
    }
  }
}
