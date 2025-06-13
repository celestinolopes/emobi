import 'package:dartz/dartz.dart';
import 'package:e_mobi/core/errors/failures.dart';
import 'package:e_mobi/core/usecase/usecase.dart';
import 'package:e_mobi/views/features/parents/domain/repositories/parent_repository.dart';

class ConfirmarVinculoMotoristaUseCase extends UseCase<bool, DuploParams> {
  final IParentRepository? iParentRepository;
  ConfirmarVinculoMotoristaUseCase({required this.iParentRepository});
  @override
  Future<Either<Failure, bool>> call(DuploParams? params) async {
    final result = await iParentRepository!.confirmarVinculoMorista(
      idResponsavel: params!.idResponsavel,
      idMotorista: params.idMotorista,
    );
    return result;
  }
}

class DuploParams {
  int idResponsavel;
  int idMotorista;
  DuploParams({
    required this.idResponsavel,
    required this.idMotorista,
  });
}
