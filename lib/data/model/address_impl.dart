import '../../domain/entity/address.dart';

import 'geo_impl.dart';

class AddressImpl extends Address {
  AddressImpl({
    super.street,
    super.suite,
    super.city,
    super.zipcode,
    super.geo,
  });



  factory AddressImpl.fromJson(Map<String, dynamic> json) {
    return AddressImpl(
      street: json['street'] as String?,
      suite: json['suite'] as String?,
      city: json['city'] as String?,
      zipcode: json['zipcode'] as String?,
      geo: GeoImpl.fromJson(
        json['geo'],
      ),
    );
  }
}
