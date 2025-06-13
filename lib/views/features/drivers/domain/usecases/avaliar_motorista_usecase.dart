import 'package:dartz/dartz.dart';
import 'package:e_mobi/core/errors/failures.dart';
import 'package:e_mobi/core/usecase/usecase.dart';

import '../repositories/cadastro_motorista_repository.dart';

class AvaliarMotoristaUseCase extends UseCase<bool, AvaliarMotoristaParams> {
  final ICadastroMotoristaRepository? cadastroMotoristaRepository;
  AvaliarMotoristaUseCase({required this.cadastroMotoristaRepository});
  @override
  Future<Either<Failure, bool>> call(AvaliarMotoristaParams? params) async {
    final result = await cadastroMotoristaRepository!.avaliarMotorista(
        params: AvaliarMotoristaParams(
      idMotorista: params!.idMotorista,
      idResponsavel: params.idResponsavel,
      pontuacao: params.pontuacao,
      observacao: params.observacao,
    ));
    return result;
  }
}
