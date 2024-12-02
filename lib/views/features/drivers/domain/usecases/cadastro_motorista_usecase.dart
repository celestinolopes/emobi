import 'package:dartz/dartz.dart';
import 'package:e_mobi/core/errors/failures.dart';
import 'package:e_mobi/core/usecase/usecase.dart';

import '../repositories/cadastro_motorista_repository.dart';

class CadastroMotoristaUseCase extends UseCase<bool, CadastroMotoristaParams> {
  final ICadastroMotoristaRepository? cadastroMotoristaRepository;
  CadastroMotoristaUseCase({required this.cadastroMotoristaRepository});
  @override
  Future<Either<Failure, bool>> call(CadastroMotoristaParams? params) async {
    final result = await cadastroMotoristaRepository!.cadastrarMotorista(
        params: CadastroMotoristaParams(
      nome: params!.nome,
      email: params.email,
      dataNascimento: params.dataNascimento,
      celular: params.celular,
      telefone: params.telefone,
      cep: params.cep,
      bairro: params.bairro,
      endereco: params.endereco,
      numero: params.numero,
      complemento: params.complemento,
      cidade: params.cidade,
      estado: params.estado,
      tipo: params.tipo,
    ));
    return result;
  }
}
