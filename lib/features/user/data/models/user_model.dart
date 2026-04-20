import 'package:clean_arch/Core/databases/api/end_points.dart';
import 'package:clean_arch/features/user/data/models/submodels/address_model.dart';
import 'package:clean_arch/features/user/data/models/submodels/company_model.dart';
import 'package:clean_arch/features/user/domain/entites/user_entity/user_entity.dart';

class UserModel extends UserEntity {
  int id;
  final String username;
  final String website;
  final CompanyModel company;

  UserModel({
    required this.id,
    required super.name,
    required super.email,
    required super.phone,
    required super.address,
    required this.username,
    required this.website,
    required this.company,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json[ApiKey.id],
      name: json[ApiKey.name],
      email: json[ApiKey.email],
      phone: json[ApiKey.phone],
      address: AddressModel.fromJson(json[ApiKey.address]),
      username: json[ApiKey.username],
      website: json[ApiKey.website],
      company: CompanyModel.fromJson(json[ApiKey.company]),
    );
  }

  Map<String, dynamic> tojson() {
    return {
      ApiKey.id: id,
      ApiKey.name: name,
      ApiKey.email: email,
      ApiKey.phone: phone,
      ApiKey.username: username,
      ApiKey.website: website,
      ApiKey.company: company,
      ApiKey.address: address,
    };
  }
}
