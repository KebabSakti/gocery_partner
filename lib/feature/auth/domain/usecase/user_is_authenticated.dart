import 'package:gocery_partner/feature/auth/domain/repository/auth_repository.dart';

class UserIsAuthenticated {
  UserIsAuthenticated({required this.repository});

  final AuthRepository repository;

  Future<bool> call() async {
    return await repository.userIsAuthenticated();
  }
}
