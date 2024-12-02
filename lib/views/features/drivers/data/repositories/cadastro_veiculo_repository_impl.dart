import 'package:dartz/dartz.dart';
import 'package:e_mobi/core/errors/exception.dart';
import 'package:e_mobi/core/errors/failures.dart';
import 'package:e_mobi/views/features/drivers/data/datasources/cadastro_veiculo_datasource.dart';
import 'package:e_mobi/views/features/drivers/domain/repositories/cadastro_veiculo_repository.dart';

class CadastroVeiculoRepositoryimpl extends ICadastroVeiculoRepository {
  final CadastroVeiculoDatasourceImpl cadastroVeiculoDatasourceImpl;
  CadastroVeiculoRepositoryimpl({required this.cadastroVeiculoDatasourceImpl});

  @override
  Future<Either<Failure, bool>> cadastrarVeiculo(
      {CadastroVeiculoParams? params}) async {
    try {
      final result = await cadastroVeiculoDatasourceImpl.cadastrarVeiculo(
        params: CadastroVeiculoParams(
          idUsuario: params!.idUsuario,
          anoFabrico: params.anoFabrico,
          categoria: params.categoria,
          dataLocacao: params.dataLocacao,
          dataVencimentoLicenca: params.dataVencimentoLicenca,
          lotacao: params.lotacao,
          modelo: params.modelo,
          veiculoPlaca: params.veiculoPlaca,
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
