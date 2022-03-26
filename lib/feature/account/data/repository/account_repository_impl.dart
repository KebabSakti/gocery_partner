import 'package:gocery_partner/feature/account/data/datasource/account_datasource.dart';
import 'package:gocery_partner/feature/account/domain/repository/account_repository.dart';
import 'package:gocery_partner/feature/auth/domain/entity/partner_entity.dart';

class AccountRepositoryImpl implements AccountRepository {
  AccountRepositoryImpl({required this.datasource});

  final AccountDatasource datasource;

  @override
  Future<PartnerEntity> getUserAccount() async {
    return await datasource.getUserAccount();
  }

  @override
  Future<void> updateStatus({required String param}) async {
    await datasource.updateStatus(param: param);
  }
}
