import 'package:gocery_partner/feature/auth/domain/entity/partner_entity.dart';

abstract class AccountRepository {
  Future<PartnerEntity> getUserAccount();

  Future<void> updateStatus({required String param});
}
