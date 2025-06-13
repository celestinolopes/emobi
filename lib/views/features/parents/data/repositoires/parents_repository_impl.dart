import 'package:dartz/dartz.dart';
import 'package:e_mobi/core/errors/exception.dart';
import 'package:e_mobi/core/errors/failures.dart';
import 'package:e_mobi/views/features/parents/data/datasource/parents_datasource_impl.dart';
import 'package:e_mobi/views/features/parents/domain/entities/desembrarque_entity.dart';
import 'package:e_mobi/views/features/parents/domain/entities/meus_alunos_entity.dart';
import 'package:e_mobi/views/features/parents/domain/entities/status_motorista_entity.dart';
import 'package:e_mobi/views/features/parents/domain/repositories/parent_repository.dart';

class ParentsRepositoryimpl extends IParentRepository {
  final ParentsDatasourceImpl parentDatasource;
  ParentsRepositoryimpl({required this.parentDatasource});

  @override
  Future<Either<Failure, bool>> confirmarDembarqueMorista(
      {required int? idResponsavel, required int? idMotorista}) {
    // TODO: implement confirmarDembarqueMorista
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> confirmarEmbarqueMorista(
      {required int? idResponsavel, required int? idMotorista}) {
    // TODO: implement confirmarEmbarqueMorista
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> confirmarVinculoMorista(
      {required int? idResponsavel, required int? idMotorista}) {
    // TODO: implement confirmarVinculoMorista
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<DesembarqueaEntity>>> getMeuDesembarqueMotorista(
      {required int? idMotorista}) async {
    try {
      final result = await parentDatasource.getMeusDesembarqueMotoristas(
        motoristaId: idMotorista!,
      );
      return Right(result);
    } on NetWorkException {
      return Left(NetWorkFailure());
    } on ServerException {
      return Left(ServerFailure(message: "ocorreu um erro no servidoe"));
    } on DuplicationException {
      return Left(DuplicateFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> getMeuEmbarqueMotorista(
      {required int? idMotorista}) {
    // TODO: implement getMeuEmbarqueMotorista
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> getMeuTrajetoMotorista(
      {required int? idMotorista}) {
    // TODO: implement getMeuTrajetoMotorista
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> getMeuVeiculoMotorista(
      {required int? idMotorista}) {
    // TODO: implement getMeuVeiculoMotorista
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, MeusAlunosEntity>> getMeusAlunoMotorista(
      {required int? idMotorista}) async {
    try {
      final result = await parentDatasource.getMeusAlunosMotoristas(
        motoristaId: idMotorista!,
      );
      return Right(result);
    } on NetWorkException {
      return Left(NetWorkFailure());
    } on ServerException {
      return Left(ServerFailure(message: "ocorreu um erro no servidoe"));
    } on DuplicationException {
      return Left(DuplicateFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> getMeusTrajetos({required int? idResponsavel}) {
    // TODO: implement getMeusTrajetos
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> getMotoristas({getMotoristaParams? params}) {
    // TODO: implement getMotoristas
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, StatusMotoristaEntity>> getStatusVinculoMotorista(
      {required int? idResponsavel, required int? idMotorista}) {
    // TODO: implement getStatusVinculoMotorista
    throw UnimplementedError();
  }
}
