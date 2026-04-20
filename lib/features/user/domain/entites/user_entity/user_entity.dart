import 'package:clean_arch/features/user/domain/entites/sub_entites/address_entity.dart';

class UserEntity {
  final String name;
  final String email;
  final String phone;
  final AddressEntity address;

  UserEntity({required this.name, required this.email, required this.phone, required this.address});
}