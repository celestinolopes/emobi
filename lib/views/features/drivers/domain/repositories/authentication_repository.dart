import 'package:dartz/dartz.dart';
import 'package:e_mobi/core/errors/failures.dart';
import 'package:e_mobi/views/features/authentication/domain/usecases/authentication_usecase.dart';

import '../entities/user_entity.dart';

abstract class IAuthenticationRepository {
  Future<Either<Failure, UserEntity>> authenticate({
    AuthParams? params,
  });
}
