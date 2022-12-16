import 'address_impl.dart';
import 'company_impl.dart';

import '../../domain/entity/user.dart';

class UserImpl extends User {
  UserImpl({
    required super.id,
    required super.name,
    required super.username,
    required super.email,
    super.address,
    super.phone,
    super.website,
    super.company,
  });

  factory UserImpl.fromJson(dynamic usersJson) {
    return UserImpl(
      id: usersJson['id'] as int,
      name: usersJson['name'] as String,
      username: usersJson['username'] as String,
      email: usersJson['email'] as String,
      address: AddressImpl.fromJson(usersJson['address']),
      phone: usersJson['phone'] as String?,
      website: usersJson['website'] as String?,
      company: CompanyImpl.fromJson(
        usersJson['company'],
      ),
    );
  }
}
