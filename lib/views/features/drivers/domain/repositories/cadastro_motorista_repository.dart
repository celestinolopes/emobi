import 'package:dartz/dartz.dart';
import 'package:e_mobi/core/errors/failures.dart';

abstract class ICadastroMotoristaRepository {
  Future<Either<Failure, bool>> cadastrarMotorista({
    CadastroMotoristaParams? params,
  });
}

class CadastroMotoristaParams {
  final String? nome;
  final String? email;
  final String? dataNascimento;
  final String? celular;
  final String? telefone;
  final String? cep;
  final String? bairro;
  final String? endereco;
  final String? numero;
  final String? complemento;
  final String? cidade;
  final String? estado;
  final String? tipo;
  final String? ddCelular;
  final String? ddTelefone;

  CadastroMotoristaParams(
      {required this.nome,
      required this.email,
      required this.dataNascimento,
      required this.celular,
      required this.telefone,
      required this.cep,
      required this.bairro,
      required this.endereco,
      required this.numero,
      required this.complemento,
      required this.cidade,
      required this.estado,
      this.ddCelular,
      this.ddTelefone,
      required this.tipo});
}
