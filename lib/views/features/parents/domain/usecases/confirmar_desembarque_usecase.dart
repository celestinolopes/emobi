import 'package:dartz/dartz.dart';
import 'package:e_mobi/core/errors/failures.dart';
import 'package:e_mobi/core/usecase/usecase.dart';
import 'package:e_mobi/views/features/parents/domain/repositories/parent_repository.dart';

import 'confirmar_vinculo_motorista_usecase.dart';

class ConfirmarDeEmbarqueMotoristaUseCase extends UseCase<bool, DuploParams> {
  final IParentRepository? iParentRepository;
  ConfirmarDeEmbarqueMotoristaUseCase({required this.iParentRepository});
  @override
  Future<Either<Failure, bool>> call(DuploParams? params) async {
    final result = await iParentRepository!.confirmarDembarqueMorista(
      idResponsavel: params!.idResponsavel,
      idMotorista: params.idMotorista,
    );
    return result;
  }
}
