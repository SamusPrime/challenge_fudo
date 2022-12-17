import '../../data/model/address_impl.dart';
import '../../data/model/company_impl.dart';

class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final AddressImpl? address;
  final String? phone;
  final String? website;
  final CompanyImpl? company;

  User({
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
