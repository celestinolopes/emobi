import 'package:dartz/dartz.dart';
import 'package:e_mobi/core/errors/failures.dart';
import 'package:e_mobi/core/usecase/usecase.dart';
import 'package:e_mobi/views/features/parents/domain/entities/status_motorista_entity.dart';
import 'package:e_mobi/views/features/parents/domain/repositories/parent_repository.dart';

import 'confirmar_vinculo_motorista_usecase.dart';

class GetStatusVinculoMotoristaUseCase
    extends UseCase<StatusMotoristaEntity, DuploParams> {
  final IParentRepository? iParentRepository;
  GetStatusVinculoMotoristaUseCase({required this.iParentRepository});
  @override
  Future<Either<Failure, StatusMotoristaEntity>> call(
      DuploParams? params) async {
    final result = await iParentRepository!.getStatusVinculoMotorista(
      idResponsavel: params!.idResponsavel,
      idMotorista: params.idMotorista,
    );
    return result;
  }
}
