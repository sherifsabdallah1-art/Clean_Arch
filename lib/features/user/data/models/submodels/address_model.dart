import 'package:clean_arch/Core/databases/api/end_points.dart';
import 'package:clean_arch/features/user/domain/entites/sub_entites/address_entity.dart';

class AddressModel extends AddressEntity {
  AddressModel({
    required super.street,
    required super.suite,
    required super.city,
    required super.zipcode,
    required super.geo,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      street: json[ApiKey.street],
      suite: json[ApiKey.suite],
      city: json[ApiKey.city],
      zipcode: json[ApiKey.zipcode],
      geo: json[ApiKey.geo],
    );
  }

  Map<String, dynamic> tojson() {
    return {
      'street': street,
      'suite': suite,
      'city': city,
      'zipcode': zipcode,
      'geo': geo,
    };
  }
}
