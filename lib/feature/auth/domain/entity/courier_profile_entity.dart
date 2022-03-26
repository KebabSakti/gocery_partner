class CourierProfileEntity {
  CourierProfileEntity({
    this.partnerUid,
    this.courierAccountUid,
    this.uid,
    this.name,
    this.email,
    this.phone,
    this.picture,
    this.status,
  });

  String? partnerUid;
  String? courierAccountUid;
  String? uid;
  String? name;
  String? email;
  String? phone;
  String? picture;
  String? status;

  CourierProfileEntity copyWith({
    String? partnerUid,
    String? courierAccountUid,
    String? uid,
    String? name,
    String? email,
    String? phone,
    String? picture,
    String? status,
  }) =>
      CourierProfileEntity(
        partnerUid: partnerUid ?? this.partnerUid,
        courierAccountUid: courierAccountUid ?? this.courierAccountUid,
        uid: uid ?? this.uid,
        name: name ?? this.name,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        picture: picture ?? this.picture,
        status: status ?? this.status,
      );
}
