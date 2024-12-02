import 'package:dartz/dartz.dart';
import 'package:e_mobi/core/cep/domain/entities/cep_entity.dart';
import 'package:e_mobi/core/errors/failures.dart';

abstract class ICepRepository {
  Future<Either<Failure, CepEntity>> getCep({String? cep});
}
