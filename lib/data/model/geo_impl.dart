import '../../domain/entity/geo.dart';

class GeoImpl extends Geo {
  GeoImpl({
    super.lat,
    super.lng,
  });

  factory GeoImpl.fromJson(Map<String, dynamic> json) {
    return GeoImpl(
      lat: json['lat'] as String?,
      lng: json['lng'] as String?,
    );
  }
}
