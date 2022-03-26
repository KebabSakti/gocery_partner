import 'package:gocery_partner/feature/auth/domain/entity/access_param.dart';
import 'package:gocery_partner/feature/auth/domain/entity/partner_entity.dart';

abstract class AuthRepository {
  Future<List<PartnerEntity>> partners();

  Future<void> access({required AccessParam param});

  Future<void> revoke();

  Future<bool> userIsAuthenticated();
}
