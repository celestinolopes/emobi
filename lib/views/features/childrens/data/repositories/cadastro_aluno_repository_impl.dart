import 'package:dartz/dartz.dart';
import 'package:e_mobi/core/errors/exception.dart';
import 'package:e_mobi/core/errors/failures.dart';
import 'package:e_mobi/views/features/childrens/data/datasources/cadastro_aluno_datasource.dart';
import 'package:e_mobi/views/features/childrens/domain/entities/meus_filhos_entity.dart';
import 'package:e_mobi/views/features/childrens/domain/repositories/cadastro_aluno_repository.dart';
import 'package:e_mobi/views/features/childrens/domain/usecases/get_meus_filhos.dart';

import '../../domain/entities/cadastro_aluno_entity.dart';

class CadastroAlunoRepositoryimpl extends ICadastroAlunoRepository {
  final CadastroAlunoDataourceImpl cadastroAlunoDataourceImpl;
  CadastroAlunoRepositoryimpl({required this.cadastroAlunoDataourceImpl});

  @override
  Future<Either<Failure, CadastroAlunoEntity>> cadastrarAluno(
      {CadastroAlunoParams? params}) async {
    try {
      final result = await cadastroAlunoDataourceImpl.cadastrarAluno(
        params: CadastroAlunoParams(
          nome: params!.nome,
          dataNascimento: params.dataNascimento,
          endereco: params.endereco,
          numero: params.numero,
          serie: params.serie,
          escola: params.escola,
          idPai: params.idPai,
        ),
      );
      return Right(result);
    } on NetWorkException {
      return Left(NetWorkFailure());
    } on ServerException {
      return Left(ServerFailure(message: "ocorreu um erro no servidoe"));
    }
  }

  @override
  Future<Either<Failure, List<MeusFilhosEntity>>> getMeusFilhos(
      {getAlunosParams? params}) async {
    try {
      final result = await cadastroAlunoDataourceImpl.getAlunos(
        params: getAlunosParams(
          userId: params!.userId,
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
