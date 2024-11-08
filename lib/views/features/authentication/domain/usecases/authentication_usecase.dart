import 'package:dartz/dartz.dart';
import 'package:e_mobi/core/errors/failures.dart';
import 'package:e_mobi/core/usecase/usecase.dart';
import 'package:e_mobi/views/features/authentication/domain/entities/user_entity.dart';
import 'package:e_mobi/views/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:equatable/equatable.dart';

class AuthenticateUseCase extends UseCase<UserEntity, AuthParams> {
  final IAuthenticationRepository? _authenticationRepository;
  AuthenticateUseCase(this._authenticationRepository);

  @override
  Future<Either<Failure, UserEntity>> call(AuthParams? params) async {
    final authResponse = await _authenticationRepository!.authenticate(
      params: AuthParams(username: params!.username, password: params.password),
    );

    return authResponse;
  }
}

class AuthParams extends Equatable {
  final String username;
  final String password;
  const AuthParams({required this.username, required this.password});

  @override
  List<Object> get props => [username, password];
}
