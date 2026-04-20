import 'package:clean_arch/Core/connection/network_info.dart';
import 'package:clean_arch/Core/errors/expentions.dart';
import 'package:clean_arch/Core/errors/failure.dart';
import 'package:clean_arch/Core/params/params.dart';
import 'package:clean_arch/features/user/data/datasource/user_local_datasource.dart';
import 'package:clean_arch/features/user/data/datasource/user_remote_datasource.dart';
import 'package:clean_arch/features/user/domain/entites/user_entity/user_entity.dart';
import 'package:clean_arch/features/user/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImp extends UserRepository {
  final NetworkInfo networkInfo;
  final UserRemoteDatasource userRemoteDatasource;
  final UserLocalDatasource userLocalDatasource;

  UserRepositoryImp({
    required this.networkInfo,
    required this.userRemoteDatasource,
    required this.userLocalDatasource,
  });

  @override
  Future<Either<Failure, UserEntity>> getUser({
    required UserParams params,
  }) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteUser = await userRemoteDatasource.getUser(params);
        userLocalDatasource.cacheUser(remoteUser);
        return Right(remoteUser);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      try {
        final localUser = await userLocalDatasource.getLastUser();
        return Right(localUser);
      } on CacheExeption catch (e) {
        return Left(Failure(errMessage: e.errorMessage));
      }
    }
  }
}
