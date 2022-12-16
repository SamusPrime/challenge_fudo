import 'address_model.dart';
import 'company_model.dart';

import '../../domain/entity/abstract_user.dart';

class UserModel extends AbstractUser {
  UserModel({
    required super.id,
    required super.name,
    required super.username,
    required super.email,
    super.address,
    super.phone,
    super.website,
    super.company,
  });

  factory UserModel.fromJson(dynamic usersJson) {
    return UserModel(
      id: usersJson['id'] as int,
      name: usersJson['name'] as String,
      username: usersJson['username'] as String,
      email: usersJson['email'] as String,
      address: AddressModel.fromMap( usersJson['address'])  ,
      phone: usersJson['phone'] as String?,
      website: usersJson['website'] as String?,
      company: CompanyModel.fromMap(
        usersJson['company'],
      ),
    );
  }
}
