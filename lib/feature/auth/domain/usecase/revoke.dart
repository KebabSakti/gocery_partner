import 'package:gocery_partner/feature/auth/domain/repository/auth_repository.dart';

class Revoke {
  Revoke({required this.repository});

  final AuthRepository repository;

  Future<void> call() async {
    await repository.revoke();
  }
}
