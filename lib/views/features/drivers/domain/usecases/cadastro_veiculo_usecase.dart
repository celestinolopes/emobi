import 'package:dartz/dartz.dart';
import 'package:e_mobi/core/errors/failures.dart';
import 'package:e_mobi/core/usecase/usecase.dart';
import 'package:e_mobi/views/features/drivers/domain/repositories/cadastro_veiculo_repository.dart';

class CadastroVeiculoUseCase extends UseCase<bool, CadastroVeiculoParams> {
  final ICadastroVeiculoRepository? cadastroVeiculoRepository;
  CadastroVeiculoUseCase({required this.cadastroVeiculoRepository});
  @override
  Future<Either<Failure, bool>> call(CadastroVeiculoParams? params) async {
    final result = await cadastroVeiculoRepository!.cadastrarVeiculo(
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
    return result;
  }
}
