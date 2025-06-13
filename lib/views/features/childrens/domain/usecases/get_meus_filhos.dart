import 'package:dartz/dartz.dart';
import 'package:e_mobi/core/errors/failures.dart';
import 'package:e_mobi/core/usecase/usecase.dart';
import 'package:e_mobi/views/features/childrens/domain/entities/meus_filhos_entity.dart';

import '../repositories/cadastro_aluno_repository.dart';

class GetFilhosUseCase
    extends UseCase<List<MeusFilhosEntity>, getAlunosParams> {
  final ICadastroAlunoRepository? cadastroMotoristaRepository;
  GetFilhosUseCase({required this.cadastroMotoristaRepository});

  @override
  Future<Either<Failure, List<MeusFilhosEntity>>> call(
      getAlunosParams? params) async {
    final result = await cadastroMotoristaRepository!
        .getMeusFilhos(params: getAlunosParams(userId: params!.userId));
    return result;
  }
}

class getAlunosParams {
  final int? userId;
  getAlunosParams({required this.userId});
}
