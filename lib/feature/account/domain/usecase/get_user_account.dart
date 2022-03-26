import 'package:gocery_partner/feature/account/domain/repository/account_repository.dart';
import 'package:gocery_partner/feature/auth/domain/entity/partner_entity.dart';

class GetUserAccount {
  GetUserAccount({required this.repository});

  final AccountRepository repository;

  Future<PartnerEntity> call() async {
    return await repository.getUserAccount();
  }
}
