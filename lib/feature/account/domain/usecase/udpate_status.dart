import 'package:gocery_partner/feature/account/domain/repository/account_repository.dart';

class UpdateStatus {
  UpdateStatus({required this.repository});

  final AccountRepository repository;

  Future<void> call({required String param}) async {
    await repository.updateStatus(param: param);
  }
}
