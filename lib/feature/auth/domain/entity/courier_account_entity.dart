import 'package:gocery_partner/feature/auth/domain/entity/courier_profile_entity.dart';

class CourierAccountEntity {
  CourierAccountEntity({
    this.partnerUid,
    this.uid,
    this.username,
    this.owner,
    this.courierProfileEntity,
  });

  String? partnerUid;
  String? uid;
  String? username;
  String? owner;
  CourierProfileEntity? courierProfileEntity;

  CourierAccountEntity copyWith({
    String? partnerUid,
    String? uid,
    String? username,
    String? owner,
    CourierProfileEntity? courierProfileEntity,
  }) =>
      CourierAccountEntity(
        partnerUid: partnerUid ?? this.partnerUid,
        uid: uid ?? this.uid,
        username: username ?? this.username,
        owner: owner ?? this.owner,
        courierProfileEntity: courierProfileEntity ?? this.courierProfileEntity,
      );
}
