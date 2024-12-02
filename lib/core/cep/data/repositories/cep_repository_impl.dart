import 'package:dartz/dartz.dart';
import 'package:e_mobi/core/cep/data/datasource/remote_get_cep.dart';
import 'package:e_mobi/core/cep/domain/entities/cep_entity.dart';
import 'package:e_mobi/core/cep/domain/repositories/i_get_cep_repository.dart';
import 'package:e_mobi/core/errors/exception.dart';
import 'package:e_mobi/core/errors/failures.dart';

class GetCepRepositoryImpl implements ICepRepository {
  final RemoteCepDataSourceImpl remoteCepDataSourceImpl;

  GetCepRepositoryImpl({required this.remoteCepDataSourceImpl});

  @override
  Future<Either<Failure, CepEntity>> getCep({String? cep}) async {
    try {
      final result = await remoteCepDataSourceImpl.getCep(cep: cep!);
      return Right(result);
    } on NetWorkException {
      return Left(NetWorkFailure());
    } on InvalidCepException {
      return Left(InvalidCepFailure());
    }
  }
}
