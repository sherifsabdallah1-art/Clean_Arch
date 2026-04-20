import 'package:clean_arch/Core/errors/failure.dart';
import 'package:clean_arch/features/user/domain/entites/user_entity/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<Failure,UserEntity>> getUser();
}