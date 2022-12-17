import '../../domain/entity/company.dart';

class CompanyImpl extends Company {
  CompanyImpl({
    super.name,
    super.catchphrase,
    super.bs,
  });

  factory CompanyImpl.fromJson(Map<String, dynamic> json) {
    return CompanyImpl(
      name: json['name'] as String?,
      catchphrase: json['catchphrase'] as String?,
      bs: json['bs'] as String?,
    );
  }
}
