import '../../data/model/geo_model.dart';

abstract class AbstractAddress {
  AbstractAddress({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });

  final String? street;
  final String? suite;
  final String? city;
  final String? zipcode;
  final GeoModel? geo;
}
