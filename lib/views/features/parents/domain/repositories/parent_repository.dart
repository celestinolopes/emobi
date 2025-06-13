import 'package:dartz/dartz.dart';
import 'package:e_mobi/core/errors/failures.dart';
import 'package:e_mobi/views/features/parents/domain/entities/desembrarque_entity.dart';
import 'package:e_mobi/views/features/parents/domain/entities/meus_alunos_entity.dart';
import 'package:e_mobi/views/features/parents/domain/entities/status_motorista_entity.dart';

abstract class IParentRepository {
  Future<Either<Failure, bool>> getMotoristas({
    getMotoristaParams? params,
  });
  Future<Either<Failure, bool>> getMeusTrajetos({
    required int? idResponsavel,
  });
  Future<Either<Failure, bool>> confirmarVinculoMorista({
    required int? idResponsavel,
    required int? idMotorista,
  });

  Future<Either<Failure, StatusMotoristaEntity>> getStatusVinculoMotorista({
    required int? idResponsavel,
    required int? idMotorista,
  });
  Future<Either<Failure, bool>> getMeuVeiculoMotorista({
    required int? idMotorista,
  });
  Future<Either<Failure, bool>> getMeuTrajetoMotorista({
    required int? idMotorista,
  });
  Future<Either<Failure, bool>> getMeuEmbarqueMotorista({
    required int? idMotorista,
  });
  Future<Either<Failure, List<DesembarqueaEntity>>> getMeuDesembarqueMotorista({
    required int? idMotorista,
  });
  Future<Either<Failure, bool>> confirmarEmbarqueMorista({
    required int? idResponsavel,
    required int? idMotorista,
  });
  Future<Either<Failure, bool>> confirmarDembarqueMorista({
    required int? idResponsavel,
    required int? idMotorista,
  });
  Future<Either<Failure, MeusAlunosEntity>> getMeusAlunoMotorista({
    required int? idMotorista,
  });
}

class getMotoristaParams {
  final String? idMotorista;
  final String? latitude;
  final String? longitude;
  final String? observacao;

  getMotoristaParams({
    required this.idMotorista,
    required this.latitude,
    required this.longitude,
    required this.observacao,
  });
}
