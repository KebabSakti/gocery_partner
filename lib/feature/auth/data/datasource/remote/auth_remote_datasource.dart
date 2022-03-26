import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:gocery_partner/core/config/app_const.dart';
import 'package:gocery_partner/core/service/network/network.dart';
import 'package:gocery_partner/core/service/storage/storage.dart';
import 'package:gocery_partner/feature/auth/data/datasource/auth_datasource.dart';
import 'package:gocery_partner/feature/auth/data/model/auth_model.dart';
import 'package:gocery_partner/feature/auth/data/model/partner_model.dart';
import 'package:gocery_partner/feature/auth/domain/entity/access_param.dart';

class AuthRemoteDatasource implements AuthDatasource {
  AuthRemoteDatasource({
    required this.client,
    required this.storage,
  });

  final Network client;
  final Storage storage;

  @override
  Future<List<PartnerModel>> partners() async {
    final response = await client.get(kPartners);

    return compute(_partners, response.toString());
  }

  @override
  Future<void> access({required AccessParam param}) async {
    final response = await client.post(kAuthAccess, data: {
      'username': param.username,
      'password': param.password,
    });

    AuthModel model = await compute(authModelFromJson, response.toString());

    await storage.write(key: 'token', value: model.token!);
  }

  @override
  Future<void> revoke() async {
    await client.get(kAuthRevoke);

    await storage.delete(key: 'token');
  }

  @override
  Future<bool> userIsAuthenticated() async {
    String? token = await storage.read(key: 'token');

    bool authenticated = token != null ? true : false;

    return authenticated;
  }
}

List<PartnerModel> _partners(dynamic data) {
  var parsed = jsonDecode(data);

  List<PartnerModel> datas = List<PartnerModel>.from(
      parsed.map((item) => PartnerModel.fromJson(item)));

  return datas;
}
