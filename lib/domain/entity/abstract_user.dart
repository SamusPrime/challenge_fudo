import '../../data/model/address_model.dart';
import '../../data/model/company_model.dart';

class AbstractUser {
  final int id;
  final String name;
  final String username;
  final String email;
  final AddressModel? address;
  final String? phone;
  final String? website;
  final CompanyModel? company;

  AbstractUser({
    required this.name,
    required this.id,
    required this.username,
    required this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });
}
