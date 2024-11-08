import 'package:dartz/dartz.dart';
import 'package:e_mobi/core/errors/failures.dart';
import 'package:e_mobi/core/usecase/usecase.dart';
import 'package:e_mobi/views/features/authentication/domain/entities/user_entity.dart';
import 'package:equatable/equatable.dart';

class AuthenticateUseCase extends UseCase<UserEntity, AuthParams> {
  @override
  Future<Either<Failure, UserEntity>> call(AuthParams? params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}

class AuthParams extends Equatable {
  final String username;
  final String password;
  const AuthParams({required this.username, required this.password});

  @override
  List<Object> get props => [username, password];
}
