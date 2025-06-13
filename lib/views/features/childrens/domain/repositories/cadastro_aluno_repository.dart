import 'package:dartz/dartz.dart';
import 'package:e_mobi/core/errors/failures.dart';
import 'package:e_mobi/views/features/childrens/domain/entities/meus_filhos_entity.dart';
import 'package:e_mobi/views/features/childrens/domain/usecases/get_meus_filhos.dart';

import '../entities/cadastro_aluno_entity.dart';

abstract class ICadastroAlunoRepository {
  Future<Either<Failure, CadastroAlunoEntity>> cadastrarAluno({
    CadastroAlunoParams? params,
  });
  Future<Either<Failure, List<MeusFilhosEntity>>> getMeusFilhos(
      {getAlunosParams? params});
}

class CadastroAlunoParams {
  final String? nome;
  final String? dataNascimento;
  final String? idPai;
  final String? endereco;
  final String? numero;
  final String? escola;
  final String? serie;

  CadastroAlunoParams({
    required this.nome,
    required this.idPai,
    required this.dataNascimento,
    required this.endereco,
    required this.numero,
    required this.escola,
    required this.serie,
  });
}
