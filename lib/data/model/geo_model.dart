import '../../domain/entity/abstract_company.dart';
import '../../domain/entity/abstract_geo.dart';

class GeoModel extends AbstractGeo {
  GeoModel({
    super.lat,
    super.lng,
  });

  static GeoModel? fromMap(
    Map<String, dynamic>? geo,
  ) {
    return geo != null ? GeoModel.fromJson(geo) : null;
  }

  factory GeoModel.fromJson(Map<String, dynamic> json) {
    return GeoModel(
      lat: json['lat'] as String?,
      lng: json['lng'] as String?,
    );
  }
}
