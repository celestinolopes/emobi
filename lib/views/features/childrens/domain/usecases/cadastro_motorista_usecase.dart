import 'package:dartz/dartz.dart';
import 'package:e_mobi/core/errors/failures.dart';
import 'package:e_mobi/core/usecase/usecase.dart';

import '../entities/cadastro_aluno_entity.dart';
import '../repositories/cadastro_aluno_repository.dart';

class CadastroAlunoUseCase
    extends UseCase<CadastroAlunoEntity, CadastroAlunoParams> {
  final ICadastroAlunoRepository? cadastroMotoristaRepository;
  CadastroAlunoUseCase({required this.cadastroMotoristaRepository});
  @override
  Future<Either<Failure, CadastroAlunoEntity>> call(
      CadastroAlunoParams? params) async {
    final result = await cadastroMotoristaRepository!.cadastrarAluno(
        params: CadastroAlunoParams(
      nome: params!.nome,
      escola: params.escola,
      dataNascimento: params.dataNascimento,
      serie: params.serie,
      endereco: params.endereco,
      numero: params.numero,
      idPai: params.idPai,
    ));
    return result;
  }
}
