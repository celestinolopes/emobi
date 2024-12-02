import 'package:dartz/dartz.dart';
import 'package:e_mobi/core/errors/exception.dart';
import 'package:e_mobi/core/errors/failures.dart';
import 'package:e_mobi/views/features/drivers/data/datasources/cadastro_motorista_datasource.dart';
import 'package:e_mobi/views/features/drivers/domain/repositories/cadastro_motorista_repository.dart';

class CadastroMotoristaRepositoryimpl extends ICadastroMotoristaRepository {
  final CadastroMotoristaDataourceImpl cadastroMotoristaDataourceImpl;
  CadastroMotoristaRepositoryimpl(
      {required this.cadastroMotoristaDataourceImpl});

  @override
  Future<Either<Failure, bool>> cadastrarMotorista(
      {CadastroMotoristaParams? params}) async {
    try {
      final result = await cadastroMotoristaDataourceImpl.cadastrarMotorista(
        params: CadastroMotoristaParams(
          nome: params!.nome,
          dataNascimento: params.dataNascimento,
          telefone: params.telefone,
          email: params.email,
          endereco: params.endereco,
          numero: params.numero,
          bairro: params.bairro,
          cidade: params.cidade,
          estado: params.estado,
          celular: params.celular,
          cep: params.cep,
          complemento: params.complemento,
          tipo: params.tipo,
        ),
      );
      return Right(result);
    } on NetWorkException {
      return Left(NetWorkFailure());
    } on ServerException {
      return Left(ServerFailure(message: "ocorreu um erro no servidoe"));
    }
  }
}
