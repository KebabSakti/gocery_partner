// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

import 'dart:convert';

import 'package:gocery_partner/feature/auth/domain/entity/auth_entity.dart';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel extends AuthEntity {
  AuthModel({String? token}) : super(token: token);

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      AuthModel(token: json["token"]);

  Map<String, dynamic> toJson() => {"token": token};
}
