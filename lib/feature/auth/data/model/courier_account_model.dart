// To parse this JSON data, do
//
//     final courierAccountModel = courierAccountModelFromJson(jsonString);

import 'dart:convert';

import 'package:gocery_partner/feature/auth/data/model/courier_profile_model.dart';
import 'package:gocery_partner/feature/auth/domain/entity/courier_account_entity.dart';

CourierAccountModel courierAccountModelFromJson(String str) =>
    CourierAccountModel.fromJson(json.decode(str));

String courierAccountModelToJson(CourierAccountModel data) =>
    json.encode(data.toJson());

class CourierAccountModel extends CourierAccountEntity {
  CourierAccountModel({
    String? partnerUid,
    String? uid,
    String? username,
    String? owner,
    CourierProfileModel? courierProfileModel,
  }) : super(
          partnerUid: partnerUid,
          uid: uid,
          username: username,
          owner: owner,
          courierProfileEntity: courierProfileModel,
        );

  factory CourierAccountModel.fromJson(Map<String, dynamic> json) =>
      CourierAccountModel(
        partnerUid: json["partner_uid"],
        uid: json["uid"],
        username: json["username"],
        owner: json["owner"],
        courierProfileModel: json['profile'] == null
            ? null
            : CourierProfileModel.fromJson(json['profile']),
      );

  Map<String, dynamic> toJson() => {
        "partner_uid": partnerUid,
        "uid": uid,
        "username": username,
        "owner": owner,
        "json": courierProfileEntity == null
            ? null
            : courierProfileModelToJson(
                (courierProfileEntity as CourierProfileModel)),
      };
}
