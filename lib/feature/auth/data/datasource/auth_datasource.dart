import 'package:gocery_partner/feature/auth/data/model/partner_model.dart';
import 'package:gocery_partner/feature/auth/domain/entity/access_param.dart';

abstract class AuthDatasource {
  Future<List<PartnerModel>> partners();

  Future<void> access({required AccessParam param});

  Future<void> revoke();

  Future<bool> userIsAuthenticated();
}
