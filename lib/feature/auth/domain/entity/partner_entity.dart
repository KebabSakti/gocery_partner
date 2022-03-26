import 'package:gocery_partner/feature/auth/domain/entity/courier_account_entity.dart';

class PartnerEntity {
  PartnerEntity({
    this.uid,
    this.name,
    this.address,
    this.phone,
    this.shipping,
    this.type,
    this.latitude,
    this.longitude,
    this.exclusive,
    this.online,
    this.couriers,
  });

  String? uid;
  String? name;
  String? address;
  String? phone;
  String? shipping;
  String? type;
  String? latitude;
  String? longitude;
  int? exclusive;
  int? online;
  List<CourierAccountEntity>? couriers;

  PartnerEntity copyWith({
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
    List<CourierAccountEntity>? couriers,
  }) =>
      PartnerEntity(
        uid: uid ?? this.uid,
        name: name ?? this.name,
        address: address ?? this.address,
        phone: phone ?? this.phone,
        shipping: shipping ?? this.shipping,
        type: type ?? this.type,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        exclusive: exclusive ?? this.exclusive,
        online: online ?? this.online,
        couriers: couriers ?? this.couriers,
      );
}
