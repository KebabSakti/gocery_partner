import 'package:gocery_partner/feature/auth/data/model/partner_model.dart';

abstract class AccountDatasource {
  Future<PartnerModel> getUserAccount();

  Future<void> updateStatus({required String param});
}
