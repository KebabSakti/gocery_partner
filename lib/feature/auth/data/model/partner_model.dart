// To parse this JSON data, do
//
//     final partnerModel = partnerModelFromJson(jsonString);

import 'dart:convert';

import 'package:gocery_partner/feature/auth/data/model/courier_account_model.dart';
import 'package:gocery_partner/feature/auth/domain/entity/partner_entity.dart';

PartnerModel partnerModelFromJson(String str) =>
    PartnerModel.fromJson(json.decode(str));

String partnerModelToJson(PartnerModel data) => json.encode(data.toJson());

class PartnerModel extends PartnerEntity {
  PartnerModel({
    String? uid,
    String? name,
    String? address,
    String? phone,
    String? shipping,
    String? type,
    String? latitude,
    String? longitude,
    int? exclusive,
    int? online,
    List<CourierAccountModel>? couriers,
  }) : super(
          uid: uid,
          name: name,
          address: address,
          phone: phone,
          shipping: shipping,
          type: type,
          latitude: latitude,
          longitude: longitude,
          exclusive: exclusive,
          online: online,
          couriers: couriers,
        );

  factory PartnerModel.fromJson(Map<String, dynamic> json) => PartnerModel(
      uid: json["uid"],
      name: json["name"],
      address: json["address"],
      phone: json["phone"],
      shipping: json["shipping"],
      type: json["type"],
      latitude: json["latitude"],
      longitude: json["longitude"],
      exclusive: json["exclusive"],
      online: json["online"],
      couriers: json['couriers'] == null
          ? null
          : List<CourierAccountModel>.from(
              json["couriers"].map((x) => CourierAccountModel.fromJson(x))));

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "name": name,
        "address": address,
        "phone": phone,
        "shipping": shipping,
        "type": type,
        "latitude": latitude,
        "longitude": longitude,
        "exclusive": exclusive,
        "online": online,
        "couriers": List<CourierAccountModel>.from(
            (couriers as List<CourierAccountModel>).map((x) => x.toJson())),
      };
}
