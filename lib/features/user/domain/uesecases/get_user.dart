import 'package:clean_arch/Core/errors/failure.dart';
import 'package:clean_arch/features/user/domain/entites/user_entity/user_entity.dart';
import 'package:clean_arch/features/user/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class GetUser {
  final UserRepository repository;

  GetUser({required this.repository});
  Future<Either<Failure,UserEntity>> call (){
    return repository.getUser();
  }
}