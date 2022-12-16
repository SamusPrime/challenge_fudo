import '../../domain/entity/abstract_company.dart';

class CompanyModel extends AbstractCompany {
  CompanyModel({
    super.name,
    super.catchphrase,
    super.bs,
  });

  static CompanyModel? fromMap(
    Map<String, dynamic>? company,
  ) {
    return company != null ? CompanyModel.fromJson(company) : null;
  }

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      name: json['name'] as String?,
      catchphrase: json['catchphrase'] as String?,
      bs: json['bs'] as String?,
    );
  }
}
