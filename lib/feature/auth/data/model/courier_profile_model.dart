// To parse this JSON data, do
//
//     final courierProfileModel = courierProfileModelFromJson(jsonString);

import 'dart:convert';

import 'package:gocery_partner/feature/auth/domain/entity/courier_profile_entity.dart';

CourierProfileModel courierProfileModelFromJson(String str) =>
    CourierProfileModel.fromJson(json.decode(str));

String courierProfileModelToJson(CourierProfileModel data) =>
    json.encode(data.toJson());

class CourierProfileModel extends CourierProfileEntity {
  CourierProfileModel({
    String? partnerUid,
    String? courierAccountUid,
    String? uid,
    String? name,
    String? email,
    String? phone,
    String? picture,
    String? status,
  }) : super(
          partnerUid: partnerUid,
          courierAccountUid: courierAccountUid,
          uid: uid,
          name: name,
          email: email,
          phone: phone,
          picture: picture,
          status: status,
        );

  factory CourierProfileModel.fromJson(Map<String, dynamic> json) =>
      CourierProfileModel(
        partnerUid: json["partner_uid"],
        courierAccountUid: json["courier_account_uid"],
        uid: json["uid"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        picture: json["picture"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "partner_uid": partnerUid,
        "courier_account_uid": courierAccountUid,
        "uid": uid,
        "name": name,
        "email": email,
        "phone": phone,
        "picture": picture,
        "status": status,
      };
}
