import 'package:dartz/dartz.dart';
import 'package:e_mobi/core/errors/exception.dart';
import 'package:e_mobi/core/errors/failures.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/authentication_repository.dart';
import '../../domain/usecases/authentication_usecase.dart';
import '../datasources/remote_authentication_data_source.dart';

class AuthenticationRepositoryImpl implements IAuthenticationRepository {
  final RemoteAuthenticationDataSourceImpl remoteAuthenticationDataSourceImpl;

  AuthenticationRepositoryImpl({
    required this.remoteAuthenticationDataSourceImpl,
  });

  @override
  Future<Either<Failure, UserEntity>> authenticate({AuthParams? params}) async {
    try {
      final userData = await remoteAuthenticationDataSourceImpl.authenticate(
        AuthParams(username: params!.username, password: params.password),
      );
      return Right(userData);
    } on ServerException {
      return Left(ServerFailure(message: "Ocorreu um erro ao fazer o login"));
    } on LoginException {
      return Left(LoginFailure());
    } on NetWorkException {
      return Left(NetWorkFailure());
    }
  }
}
