import '../../domain/entity/abstract_address.dart';

import 'geo_model.dart';

class AddressModel extends AbstractAddress {
  AddressModel({
    super.street,
    super.suite,
    super.city,
    super.zipcode,
    super.geo,
  });

  static AddressModel? fromMap(
    Map<String, dynamic>? address,
  ) {
    return address != null ? AddressModel.fromJson(address) : null;
  }

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      street: json['street'] as String?,
      suite: json['suite'] as String?,
      city: json['city'] as String?,
      zipcode: json['zipcode'] as String?,
      geo: GeoModel.fromMap(
        json['geo'],
      ),
    );
  }
}
