import 'package:dartz/dartz.dart';
import 'package:e_mobi/core/errors/failures.dart';

abstract class ICadastroVeiculoRepository {
  Future<Either<Failure, bool>> cadastrarVeiculo({
    CadastroVeiculoParams? params,
  });
}

class CadastroVeiculoParams {
  final String? idUsuario;
  final String? anoFabrico;
  final String? categoria;
  final String? lotacao;
  final String? dataLocacao;
  final String? dataVencimentoLicenca;
  final String? modelo;
  final String? veiculoPlaca;

  CadastroVeiculoParams(
      {required this.idUsuario,
      required this.anoFabrico,
      required this.categoria,
      required this.lotacao,
      required this.dataLocacao,
      required this.dataVencimentoLicenca,
      required this.modelo,
      required this.veiculoPlaca});
}
