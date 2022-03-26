import 'package:flutter/foundation.dart';
import 'package:gocery_partner/core/config/app_const.dart';
import 'package:gocery_partner/core/service/network/network.dart';
import 'package:gocery_partner/feature/account/data/datasource/account_datasource.dart';
import 'package:gocery_partner/feature/auth/data/model/partner_model.dart';

class AccountRemoteDatasource implements AccountDatasource {
  AccountRemoteDatasource({required this.client});

  final Network client;

  @override
  Future<PartnerModel> getUserAccount() async {
    final response = await client.get(kPartnerAccount);

    PartnerModel model =
        await compute(partnerModelFromJson, response.toString());

    return model;
  }

  @override
  Future<void> updateStatus({required String param}) async {
    await client.post(kPartnerAccountStatus, data: {'status': param});
  }
}
